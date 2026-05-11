import 'package:drift/drift.dart';
import 'package:personal_hub_app/data/database/app_database.dart';
import 'package:personal_hub_app/data/database/tables/cooking/recipe_table.dart';
import 'package:personal_hub_app/data/database/tables/cooking/tag_table.dart';
import 'package:personal_hub_app/data/database/tables/cooking/recipe_tag_table.dart';

part 'recipe_dao.g.dart';

@DriftAccessor(
  tables: [Recipes, Tags, RecipeTags],
)
class RecipeDao extends DatabaseAccessor<AppDatabase> with _$RecipeDaoMixin {
  RecipeDao(super.db);

  /// Inserts a new recipe (with nested fields as JSON) and its tags, in a single transaction.
  Future<void> insertRecipeWithTags({
    required RecipesCompanion recipe,
    required List<String> tagList,
  }) async {
    await transaction(() async {
      await into(recipes).insert(recipe);
      for (final tag in tagList) {
        await into(tags).insertOnConflictUpdate(TagsCompanion(tag: Value(tag)));
        await into(recipeTags).insert(
          RecipeTagsCompanion(recipeId: recipe.id, tag: Value(tag)),
          mode: InsertMode.insertOrIgnore,
        );
      }
    });
  }

  /// Watches a recipe by id. Emits new values whenever the recipe or its tags change.
  Stream<RecipeWithTags?> watchRecipe(String id) {
    return (select(recipes)..where((r) => r.id.equals(id)))
      .watchSingleOrNull()
      .asyncMap((recipe) async {
        if (recipe == null) return null;
        final tagsRows = await (select(recipeTags)..where((t) => t.recipeId.equals(id))).get();
        final tags = tagsRows.map((row) => row.tag).toList();
        return RecipeWithTags(recipe: recipe, tags: tags);
      });
  }

  /// Fetches a recipe by id, returns the recipe with its tags.
  Future<RecipeWithTags?> getRecipe(String id) async {
    final recipe = await (select(recipes)..where((r) => r.id.equals(id))).getSingleOrNull();
    if (recipe == null) return null;
    final tagsRows = await (select(recipeTags)..where((t) => t.recipeId.equals(id))).get();
    final tags = tagsRows.map((row) => row.tag).toList();
    return RecipeWithTags(recipe: recipe, tags: tags);
  }

  /// Delete a recipe and all associated data (cascades assumed to be set in table definitions).
  Future<void> deleteFullRecipe(String id) async {
    await transaction(() async {
      await (delete(recipes)..where((tbl) => tbl.id.equals(id))).go();
      // Cascades should handle ingredients, stepTable, stepIngredientTable, recipeTagTable deletions.
    });
  }

  /// Updates a recipe row and its tags. Removes all previous tags and replaces them with the given tagList. Updates to ingredients/steps/nutrition/duration are handled via the JSON columns at the repository layer.
  Future<void> updateRecipe({
    required RecipesCompanion recipe,
    List<String>? tagList,
  }) async {
    await transaction(() async {
      await update(recipes).replace(recipe);
      final recipeId = recipe.id.value;
      // Remove all previous tags
      await (delete(recipeTags)..where((t) => t.recipeId.equals(recipeId))).go();
      // Insert new tags
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

  /// Returns all recipes (with related entities as JSON blobs).
  /// Returns all recipes with their tags (with related entities as JSON blobs).
  Future<List<RecipeWithTags>> getAllRecipes() async {
    final allRecipes = await select(recipes).get();
    if (allRecipes.isEmpty) return [];
    final recipeIds = allRecipes.map((r) => r.id).toList();
    final tagRows = await (select(recipeTags)..where((t) => t.recipeId.isIn(recipeIds))).get();
    final tagsByRecipe = <String, List<String>>{};
    for (final row in tagRows) {
      tagsByRecipe.putIfAbsent(row.recipeId, () => []).add(row.tag);
    }
    return allRecipes.map((recipe) => RecipeWithTags(recipe: recipe, tags: tagsByRecipe[recipe.id] ?? [])).toList();
  }

  /// Watches all recipes (with related entities as JSON blobs).
  /// Watches all recipes along with their tags.
  Stream<List<RecipeWithTags>> watchAllRecipes() {
    return select(recipes).watch().asyncMap((allRecipes) async {
      if (allRecipes.isEmpty) return [];
      final recipeIds = allRecipes.map((r) => r.id).toList();
      final tagRows = await (select(recipeTags)..where((t) => t.recipeId.isIn(recipeIds))).get();
      final tagsByRecipe = <String, List<String>>{};
      for (final row in tagRows) {
        tagsByRecipe.putIfAbsent(row.recipeId, () => []).add(row.tag);
      }
      return allRecipes.map((recipe) => RecipeWithTags(recipe: recipe, tags: tagsByRecipe[recipe.id] ?? [])).toList();
    });
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
  /// Searches for recipes based on a combination of substring search and tags.
  ///
  /// If no filters are provided, returns all recipes.
  /// - [searchString]: The string to search for (optional). If [fuzzy] is true, performs a LIKE search on name and description.
  /// - [fuzzy]: If true, search both name and description (with LIKE), otherwise just name.
  /// - [tagList]: List of tags (optional). If given, recipes must contain these tags (all or any depending on [tagAllMustMatch]).
  /// - [tagAllMustMatch]: If true, all tags must be attached to the recipe. If false, any one is enough. Defaults to false.
  /// Searches for recipes based on a combination of substring search and tags, returning RecipeWithTags objects.
  ///
  /// If no filters are provided, returns all recipes with tags.
  /// - [searchString]: The string to search for (optional). If [fuzzy] is true, performs a LIKE search on name and description.
  /// - [fuzzy]: If true, search both name and description (with LIKE), otherwise just name.
  /// - [tagList]: List of tags (optional). If given, recipes must contain these tags (all or any depending on [tagAllMustMatch]).
  /// - [tagAllMustMatch]: If true, all tags must be attached to the recipe. If false, any one is enough. Defaults to false.
  Future<List<RecipeWithTags>> searchRecipes({
    String? searchString,
    bool fuzzy = false,
    List<String>? tagList,
    bool tagAllMustMatch = false,
  }) async {
    // If no filters are provided, return all recipes with tags.
    if ((searchString == null || searchString.trim().isEmpty)
        && (tagList == null || tagList.isEmpty)) {
      return getAllRecipes();
    }
    final recipeQuery = select(recipes);
    // Handle search string
    if (searchString != null && searchString.trim().isNotEmpty) {
      final pattern = '%${searchString.trim()}%';
      if (!fuzzy) {
        recipeQuery.where((tbl) => tbl.name.like(pattern));
      } else {
        recipeQuery.where((tbl) => tbl.name.like(pattern) | tbl.description.like(pattern));
      }
    }
    // Handle tags filter
    if (tagList != null && tagList.isNotEmpty) {
      final loweredTags = tagList.map((e) => e.toLowerCase()).toList();
      final tagsRows = await (select(
        recipeTags,
      )..where((t) => t.tag.lower().isIn(loweredTags))).get();
      // Map<recipeId, Set<tag>>
      final recipeTagMap = <String, Set<String>>{};
      for (final row in tagsRows) {
        recipeTagMap.putIfAbsent(row.recipeId, () => {}).add(row.tag.toLowerCase());
      }
      Set<String> filteredRecipeIds;
      if (tagAllMustMatch) {
        filteredRecipeIds = recipeTagMap.entries
            .where((entry) => loweredTags.every((tag) => entry.value.contains(tag)))
            .map((entry) => entry.key)
            .toSet();
      } else {
        filteredRecipeIds = recipeTagMap.keys.toSet();
      }
      recipeQuery.where((r) => r.id.isIn(filteredRecipeIds.toList()));
    }
    final foundRecipes = await recipeQuery.get();
    if (foundRecipes.isEmpty) return [];
    final recipeIds = foundRecipes.map((r) => r.id).toList();
    final tagRows = await (select(recipeTags)..where((t) => t.recipeId.isIn(recipeIds))).get();
    final tagsByRecipe = <String, List<String>>{};
    for (final row in tagRows) {
      tagsByRecipe.putIfAbsent(row.recipeId, () => []).add(row.tag);
    }
    return foundRecipes.map((recipe) => RecipeWithTags(recipe: recipe, tags: tagsByRecipe[recipe.id] ?? [])).toList();
  }

  /// Watches recipes based on a combination of search and tag filters.
  /// Watches recipes based on a combination of search and tag filters. Emits lists of RecipeWithTags.
  Stream<List<RecipeWithTags>> watchSearchRecipes({
    String? searchString,
    bool fuzzy = false,
    List<String>? tagList,
    bool tagAllMustMatch = false,
  }) async* {
    yield* select(recipes).watch().asyncMap((_) async {
      return searchRecipes(
        searchString: searchString,
        fuzzy: fuzzy,
        tagList: tagList,
        tagAllMustMatch: tagAllMustMatch,
      );
    });
  }
}

class RecipeWithTags {
  final Recipe recipe;
  final List<String> tags;
  RecipeWithTags({required this.recipe, required this.tags});
}

