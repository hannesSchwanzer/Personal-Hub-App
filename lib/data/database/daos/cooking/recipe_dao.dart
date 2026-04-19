import 'package:drift/drift.dart';
import 'package:personal_hub_app/data/database/app_database.dart';
import 'package:personal_hub_app/data/database/tables/cooking/recipe_table.dart';
import 'package:personal_hub_app/data/database/tables/cooking/ingredient_table.dart';
import 'package:personal_hub_app/data/database/tables/cooking/step_table.dart';
import 'package:personal_hub_app/data/database/tables/cooking/step_ingredient_table.dart';
import 'package:personal_hub_app/data/database/tables/cooking/tag_table.dart';
import 'package:personal_hub_app/data/database/tables/cooking/recipe_tag_table.dart';

part 'recipe_dao.g.dart';

@DriftAccessor(
  tables: [Recipes, Ingredients, Steps, StepIngredients, Tags, RecipeTags],
)
class RecipeDao extends DatabaseAccessor<AppDatabase> with _$RecipeDaoMixin {
  RecipeDao(super.db);

  /// Insert a recipe and all its sub-entities in a transaction.
  ///
  /// [nutritionInfoJson] must be serialized as a JSON string.
  Future<void> insertFullRecipe({
    required RecipesCompanion recipe,
    required List<IngredientsCompanion> ingredientList,
    required List<StepsCompanion> stepList,
    required List<List<StepIngredientsCompanion>> stepIngredientsByStep, // NEW: stepIngredient companions, grouped by step
    required List<String> tagList,
  }) async {
    await transaction(() async {
      await into(recipes).insert(recipe);
      for (final ingredient in ingredientList) {
        await into(ingredients).insert(ingredient);
      }
      // Insert each step and its step ingredients
      for (int i = 0; i < stepList.length; i++) {
        final stepCompanion = stepList[i];
        final stepId = await into(steps).insert(stepCompanion);
        // Insert related step ingredients (if any) for this step
        if (i < stepIngredientsByStep.length) {
          for (final si in stepIngredientsByStep[i]) {
            await into(stepIngredients).insert(
              si.copyWith(stepId: Value(stepId)), // assign DB stepId
            );
          }
        }
      }
      // handle tags
      for (final tag in tagList) {
        await into(tags).insertOnConflictUpdate(TagsCompanion(tag: Value(tag)));
        await into(recipeTags).insert(
          RecipeTagsCompanion(recipeId: recipe.id, tag: Value(tag)),
          mode: InsertMode.insertOrIgnore,
        );
      }
    });
  }

  /// Watches a recipe by id, with all nested entities populated.
  /// Emits new values whenever the recipe or any associated table (ingredients, steps, tags, etc.) changes.
  Stream<RecipeWithAll?> watchRecipe(String id) async* {
    // Listen for changes in the recipes table, but refetch everything on any row change.
    yield* select(recipes)
      .watch()
      .asyncMap((_) => getFullRecipe(id));
  }

  /// Fetches a recipe by id, with all nested entities populated.
  /// You can later add mapping to your domain model in the repository/service layer.
  Future<RecipeWithAll?> getFullRecipe(String id) async {
    // Get main recipe
    final recipeRow = await (select(
      recipes,
    )..where((r) => r.id.equals(id))).getSingleOrNull();
    if (recipeRow == null) return null;

    // Get ingredients
    final ingredientList = await (select(
      ingredients,
    )..where((i) => i.recipeId.equals(id))).get();

    // Get steps
    final stepList = await (select(
      steps,
    )..where((s) => s.recipeId.equals(id))).get();

    // Get step ingredients for all steps
    final stepIds = stepList.map((e) => e.id).toList();
    final stepIngredientList = stepIds.isEmpty
        ? <StepIngredient>[]
        : await (select(
            stepIngredients,
          )..where((si) => si.stepId.isIn(stepIds))).get();

    // Get tags (through recipe_tag)
    final tagJoins = await (select(
      recipeTags,
    )..where((t) => t.recipeId.equals(id))).get();
    final tagList = tagJoins.map((t) => t.tag).toList();

    return RecipeWithAll(
      recipe: recipeRow,
      ingredients: ingredientList,
      steps: stepList,
      stepIngredients: stepIngredientList,
      tags: tagList,
    );
  }

  /// Delete a recipe and all associated data (cascades assumed to be set in table definitions).
  Future<void> deleteFullRecipe(String id) async {
    await transaction(() async {
      await (delete(recipes)..where((tbl) => tbl.id.equals(id))).go();
      // Cascades should handle ingredients, stepTable, stepIngredientTable, recipeTagTable deletions.
    });
  }

  /// Update a recipe and its nested entities. Deletes any removed children.
  /// Takes full lists for each sub-entity; omits will leave old ones as is.
  /// Update a recipe and all its children by fully replacing them.
  /// All ingredients, steps, step ingredients and tags for the recipe will be deleted and replaced.
  Future<void> updateRecipe({
    required RecipesCompanion recipe,
    List<IngredientsCompanion>? ingredientList,
    List<StepsCompanion>? stepList,
    List<StepIngredientsCompanion>? stepIngredientList,
    List<String>? tagList,
  }) async {
    await transaction(() async {
      await update(recipes).replace(recipe);
      final recipeId = recipe.id.value;

      // Remove all old children (ingredients, steps, step_ingredients, tags)
      await (delete(ingredients)..where((i) => i.recipeId.equals(recipeId))).go();
      await (delete(steps)..where((s) => s.recipeId.equals(recipeId))).go();
      final stepIdsForRecipe = (await (select(steps)..where((s) => s.recipeId.equals(recipeId))).get()).map((s) => s.id).toList();
      if (stepIdsForRecipe.isNotEmpty) {
        await (delete(stepIngredients)..where((tbl) => tbl.stepId.isIn(stepIdsForRecipe))).go();
      }
      await (delete(recipeTags)..where((t) => t.recipeId.equals(recipeId))).go();

      // Insert new children (must all point to recipeId)
      if (ingredientList != null) {
        for (final ingredient in ingredientList) {
          await into(ingredients).insert(ingredient);
        }
      }
      if (stepList != null) {
        // Insert steps and track their new ids
        final List<int> newStepIds = [];
        for (final step in stepList) {
          final stepId = await into(steps).insert(step);
          newStepIds.add(stepId);
        }
        // Insert step ingredients using correct step id mapping if possible
        if (stepIngredientList != null && newStepIds.isNotEmpty) {
          int currStep = 0;
          for (final step in stepList) {
            final int assignedStepId = newStepIds[currStep];
            final stepIngredientsForStep = stepIngredientList.where((si) => si.stepId.present ? si.stepId.value == step.id : true).toList();
            for (final si in stepIngredientsForStep) {
              await into(stepIngredients).insert(
                  si.copyWith(stepId: Value(assignedStepId))
              );
            }
            currStep++;
          }
        }
      }
      if (tagList != null) {
        for (final tag in tagList) {
          await into(tags).insertOnConflictUpdate(TagsCompanion(tag: Value(tag)));
          await into(recipeTags).insert(
            RecipeTagsCompanion(recipeId: Value(recipeId), tag: Value(tag)),
            mode: InsertMode.insertOrIgnore,
          );
        }
      }
    });
  }

  /// Returns all recipes with nested entities fully populated.
  Future<List<RecipeWithAll>> getAllRecipes() async {
    final recipeRows = await select(recipes).get();
    return Future.wait(
      recipeRows.map((recipeRow) => getFullRecipe(recipeRow.id)).toList(),
    ).then((results) => results.whereType<RecipeWithAll>().toList());
  }

  /// Watches all recipes with nested entities fully populated.
  Stream<List<RecipeWithAll>> watchAllRecipes() async* {
    yield* select(recipes).watch().asyncMap((recipesRows) async {
      return Future.wait(
        recipesRows.map((row) => getFullRecipe(row.id)).toList(),
      ).then((results) => results.whereType<RecipeWithAll>().toList());
    });
  }

  /// Returns the distinct names of all ingredients, sorted alphabetically.
  Future<List<String>> getAllIngredientNames() async {
    final query = customSelect(
      'SELECT DISTINCT name FROM ingredients ORDER BY name ASC;',
      readsFrom: {ingredients},
    );
    final rows = await query.get();
    return rows.map((row) => row.read<String>('name')).toList();
  }

  /// Watches the distinct names of all ingredients, sorted alphabetically.
  Stream<List<String>> watchAllIngredientNames() {
    // Re-emits whenever the ingredients table changes
    return (select(ingredients)
          ..orderBy([(tbl) => OrderingTerm(expression: tbl.name)]))
        .watch()
        .map((rows) => rows.map((row) => row.name).toSet().toList()..sort());
  }

  /// Returns the distinct tags, sorted alphabetically.
  Future<List<String>> getAllTagNames() async {
    final query = customSelect(
      'SELECT tag FROM tags ORDER BY tag ASC;',
      readsFrom: {tags},
    );
    final rows = await query.get();
    return rows.map((row) => row.read<String>('tag')).toList();
  }

  /// Watches the distinct tags, sorted alphabetically.
  Stream<List<String>> watchAllTagNames() {
    // Re-emits whenever the tags table changes
    return (select(tags)
          ..orderBy([(tbl) => OrderingTerm(expression: tbl.tag)]))
        .watch()
        .map((rows) => rows.map((row) => row.tag).toList());
  }

  ///
  /// Searches for recipes based on a combination of fuzzy/substring search, ingredients and/or tags.
  ///
  /// If no filters are provided, returns all recipes.
  /// - [searchString]: The string to search for (optional).
  /// - [fuzzy]: If true, search all relevant text columns in recipe, ingredient, step, and tag tables. If false, search only the recipe name. Defaults to false.
  /// - [ingredientList]: List of ingredient names (optional). Case-insensitive. If given, recipes must contain these ingredients (all or any depending on [ingredientAllMustMatch]).
  /// - [ingredientAllMustMatch]: If true, all provided ingredients must be present in the recipe. If false, any one is enough. Defaults to false.
  /// - [tagList]: List of tags (optional). Case-insensitive. If given, recipes must contain these tags (all or any depending on [tagAllMustMatch]).
  /// - [tagAllMustMatch]: If true, all tags must be attached to the recipe. If false, any one is enough. Defaults to false.
  Future<List<RecipeWithAll>> searchRecipes({
    String? searchString,
    bool fuzzy = false,
    List<String>? ingredientList,
    bool ingredientAllMustMatch = false,
    List<String>? tagList,
    bool tagAllMustMatch = false,
  }) async {
    // If no filters are provided, return all recipes.
    if ((searchString == null || searchString.trim().isEmpty) &&
        (ingredientList == null || ingredientList.isEmpty) &&
        (tagList == null || tagList.isEmpty)) {
      return getAllRecipes();
    }

    final recipeQuery = select(recipes);

    // -- handle search string --
    if (searchString != null && searchString.trim().isNotEmpty) {
      final pattern = '%${searchString.trim()}%';
      if (!fuzzy) {
        recipeQuery.where((tbl) => tbl.name.like(pattern));
      } else {
        // Fuzzy: search name, description, ingredients, steps, tags
        final recipeNameMatch = recipes.name.like(pattern);
        final recipeDescriptionMatch = recipes.description.like(pattern);

        // Find ids matching ingredients
        final ingredientSubQuery = select(ingredients)
          ..where((i) => i.name.like(pattern));
        final ingredientRecipeIds = (await ingredientSubQuery.get())
            .map((i) => i.recipeId)
            .toSet();

        // Find ids matching steps
        final stepSubQuery = select(steps)
          ..where((s) => s.instruction.like(pattern));
        final stepRecipeIds = (await stepSubQuery.get())
            .map((s) => s.recipeId)
            .toSet();

        // Find ids matching tags
        final tagRecipeIds = <String>{};
        final tagSubQuery = select(recipeTags)
          ..where((t) => t.tag.like(pattern));
        for (final tagRow in await tagSubQuery.get()) {
          tagRecipeIds.add(tagRow.recipeId);
        }

        // Collect all matching recipe ids
        final Set<String> collectedIds = {
          ...ingredientRecipeIds,
          ...stepRecipeIds,
          ...tagRecipeIds,
        };

        recipeQuery.where(
          (r) =>
              recipeNameMatch |
              recipeDescriptionMatch |
              r.id.isIn(collectedIds.toList()),
        );
      }
    }

    // -- handle ingredient filter --
    if (ingredientList != null && ingredientList.isNotEmpty) {
      // get all recipes with ingredient matches
      final loweredIngredients = ingredientList
          .map((e) => e.toLowerCase())
          .toList();
      final ingredientRows = await (select(
        ingredients,
      )..where((i) => i.name.lower().isIn(loweredIngredients))).get();
      final recipeIngredientMap = <String, Set<String>>{};
      for (final row in ingredientRows) {
        recipeIngredientMap
            .putIfAbsent(row.recipeId, () => {})
            .add(row.name.toLowerCase());
      }

      Set<String> filteredRecipeIds;
      if (ingredientAllMustMatch) {
        // All must match
        filteredRecipeIds = recipeIngredientMap.entries
            .where(
              (entry) =>
                  loweredIngredients.every((ing) => entry.value.contains(ing)),
            )
            .map((entry) => entry.key)
            .toSet();
      } else {
        // Any match
        filteredRecipeIds = recipeIngredientMap.keys.toSet();
      }

      // Narrow down recipes
      recipeQuery.where((r) => r.id.isIn(filteredRecipeIds.toList()));
    }

    // -- handle tags filter --
    if (tagList != null && tagList.isNotEmpty) {
      final loweredTags = tagList.map((e) => e.toLowerCase()).toList();
      final tagsRows = await (select(
        recipeTags,
      )..where((t) => t.tag.lower().isIn(loweredTags))).get();

      // Map<recipeId, Set<tag>>
      final recipeTagMap = <String, Set<String>>{};
      for (final row in tagsRows) {
        recipeTagMap
            .putIfAbsent(row.recipeId, () => {})
            .add(row.tag.toLowerCase());
      }

      Set<String> filteredRecipeIds;
      if (tagAllMustMatch) {
        filteredRecipeIds = recipeTagMap.entries
            .where(
              (entry) => loweredTags.every((tag) => entry.value.contains(tag)),
            )
            .map((entry) => entry.key)
            .toSet();
      } else {
        filteredRecipeIds = recipeTagMap.keys.toSet();
      }

      recipeQuery.where((r) => r.id.isIn(filteredRecipeIds.toList()));
    }

    // -- Execute recipe query and get details --
    final recipeRows = await recipeQuery.get();

    final List<RecipeWithAll?> resultRecipes = await Future.wait(
      recipeRows.map((recipeRow) => getFullRecipe(recipeRow.id)),
    );

    return resultRecipes.whereType<RecipeWithAll>().toList();
  }

    /// Watches recipes based on a combination of fuzzy/substring search, ingredients and/or tags.
  Stream<List<RecipeWithAll>> watchSearchRecipes({
    String? searchString,
    bool fuzzy = false,
    List<String>? ingredientList,
    bool ingredientAllMustMatch = false,
    List<String>? tagList,
    bool tagAllMustMatch = false,
  }) async* {
    // This is a naive implementation: just refetch searchRecipes every time there is a database change.
    // You can make this more efficient using triggers or Drift advanced features if desired.
    yield* select(recipes).watch().asyncMap((_) {
      return searchRecipes(
        searchString: searchString,
        fuzzy: fuzzy,
        ingredientList: ingredientList,
        ingredientAllMustMatch: ingredientAllMustMatch,
        tagList: tagList,
        tagAllMustMatch: tagAllMustMatch,
      );
    });
  }

}

/// Helper data structure for recipe aggregation.
/// Map this to/from your domain model in repository/services.
class RecipeWithAll {
  final Recipe recipe;
  final List<Ingredient> ingredients;
  final List<Step> steps;
  final List<StepIngredient> stepIngredients;
  final List<String> tags;

  RecipeWithAll({
    required this.recipe,
    required this.ingredients,
    required this.steps,
    required this.stepIngredients,
    required this.tags,
  });
}
