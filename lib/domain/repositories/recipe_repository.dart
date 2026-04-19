import 'package:personal_hub_app/domain/entities/cooking/recipe_entity.dart';

abstract class RecipeRepository {
  /// Watches a single recipe and emits a new value whenever the recipe or any associated tables change.
  /// Emits `null` if the recipe is deleted.
  Stream<RecipeEntity?> watchRecipe(String id);

  /// Retrieves a single recipe by its [id].
  Future<RecipeEntity?> getRecipe(String id);

  /// Retrieves all recipes.
  Future<List<RecipeEntity>> getAllRecipes();

  /// Watches all recipes as a stream.
  Stream<List<RecipeEntity>> watchAllRecipes();

  Future<void> insertRecipe(RecipeEntity entity);

  Future<void> updateRecipe(RecipeEntity entity);

  Future<void> deleteRecipe(String id);

  /// Retrieves all unique ingredient names sorted alphabetically.
  Future<List<String>> getAllIngredientNames();

  /// Watches all unique ingredient names sorted alphabetically as a stream.
  Stream<List<String>> watchAllIngredientNames();

  /// Retrieves all unique tag names sorted alphabetically.
  Future<List<String>> getAllTagNames();

  /// Watches all unique tag names sorted alphabetically as a stream.
  Stream<List<String>> watchAllTagNames();

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
  Future<List<RecipeEntity>> searchRecipes({
    String? searchString,
    bool fuzzy = false,
    List<String>? ingredientList,
    bool ingredientAllMustMatch = false,
    List<String>? tagList,
    bool tagAllMustMatch = false,
  });

  /// Watches the results of searching for recipes based on various criteria, emitting updated lists as the data changes.
  Stream<List<RecipeEntity>> watchSearchRecipes({
    String? searchString,
    bool fuzzy = false,
    List<String>? ingredientList,
    bool ingredientAllMustMatch = false,
    List<String>? tagList,
    bool tagAllMustMatch = false,
  });
}

