import 'package:personal_hub_app/domain/entities/cooking/recipe_entity.dart';
import 'package:personal_hub_app/data/mappers/recipe_mapper.dart';
import 'package:personal_hub_app/domain/repositories/recipe_repository.dart';
import 'package:uuid/uuid.dart';
import 'dart:io';
import 'package:personal_hub_app/data/database/daos/cooking/recipe_dao.dart';
import 'package:personal_hub_app/data/services/recipe_image_generate_service.dart';

class RecipeRepositoryImpl implements RecipeRepository {
  final RecipeDao _dao;
  final RecipeImageGenerateService _recipeImageGenerateService;

  RecipeRepositoryImpl({
    required RecipeDao dao,
    required RecipeImageGenerateService recipeImageGenerateService,
  }) : _dao = dao,
       _recipeImageGenerateService = recipeImageGenerateService;

  @override
  Future<RecipeEntity?> getRecipe(String id) async {
    final recipeWithAll = await _dao.getFullRecipe(id);
    if (recipeWithAll == null) return null;
    return recipeWithAllToEntity(recipeWithAll);
  }

  /// Uploads image(s) to the backend to generate a recipe using AI/ML.
  /// Throws on error.
  @override
  Future<RecipeEntity> generateRecipeFromImages(
    List<File> images, {
    String? inputLanguage,
    String? outputLanguage,
  }) async {
    return await _recipeImageGenerateService.generateRecipeFromImages(
      images,
      inputLanguage: inputLanguage,
      outputLanguage: outputLanguage,
    );
  }

  @override
  Future<List<RecipeEntity>> getAllRecipes() async {
    final rows = await _dao.getAllRecipes();
    return rows.map(recipeWithAllToEntity).toList();
  }

  @override
  Stream<List<RecipeEntity>> watchAllRecipes() {
    return _dao.watchAllRecipes().map(
      (rows) => rows.map(recipeWithAllToEntity).toList(),
    );
  }

  @override
  Future<void> insertRecipe(RecipeEntity entity) async {
    entity = entity.copyWith(id: Uuid().v4());
    final dbMap = recipeToDb(entity);
    // Build per-step stepIngredient companions for DB insert
    final stepIngredientsByStep = entity.steps
        .map(
          (step) => step.ingredients.map(stepIngredientToDbAbsentStep).toList(),
        )
        .toList();
    await _dao.insertFullRecipe(
      recipe: dbMap['recipe'],
      ingredientList: dbMap['ingredients'],
      stepList: dbMap['steps'],
      stepIngredientsByStep: stepIngredientsByStep,
      tagList: dbMap['tags'],
    );
  }

  @override
  Future<void> updateRecipe(RecipeEntity entity) async {
    final dbMap = recipeToDb(entity);
    await _dao.updateRecipe(
      recipe: dbMap['recipe'],
      ingredientList: dbMap['ingredients'],
      stepList: dbMap['steps'],
      stepIngredientList: dbMap['stepIngredients'],
      tagList: dbMap['tags'],
    );
  }

  @override
  Future<void> deleteRecipe(String id) async {
    await _dao.deleteFullRecipe(id);
  }

  @override
  Future<List<RecipeEntity>> searchRecipes({
    String? searchString,
    bool fuzzy = false,
    List<String>? ingredientList,
    bool ingredientAllMustMatch = false,
    List<String>? tagList,
    bool tagAllMustMatch = false,
  }) {
    return _dao
        .searchRecipes(
          searchString: searchString,
          fuzzy: fuzzy,
          ingredientList: ingredientList,
          ingredientAllMustMatch: ingredientAllMustMatch,
          tagList: tagList,
          tagAllMustMatch: tagAllMustMatch,
        )
        .then((rows) => rows.map(recipeWithAllToEntity).toList());
  }

  @override
  Future<List<String>> getAllIngredientNames() {
    return _dao.getAllIngredientNames();
  }

  @override
  Stream<List<String>> watchAllIngredientNames() {
    return _dao.watchAllIngredientNames();
  }

  @override
  Future<List<String>> getAllTagNames() {
    return _dao.getAllTagNames();
  }

  @override
  Stream<List<String>> watchAllTagNames() {
    return _dao.watchAllTagNames();
  }

  @override
  /// Watches a single recipe and emits a new value whenever the recipe or any associated tables change.
  /// Emits `null` if the recipe is deleted.
  Stream<RecipeEntity?> watchRecipe(String id) {
    return _dao
        .watchRecipe(id)
        .map((data) => data == null ? null : recipeWithAllToEntity(data));
  }

  @override
  Stream<List<RecipeEntity>> watchSearchRecipes({
    String? searchString,
    bool fuzzy = false,
    List<String>? ingredientList,
    bool ingredientAllMustMatch = false,
    List<String>? tagList,
    bool tagAllMustMatch = false,
  }) {
    return _dao
        .watchSearchRecipes(
          searchString: searchString,
          fuzzy: fuzzy,
          ingredientList: ingredientList,
          ingredientAllMustMatch: ingredientAllMustMatch,
          tagList: tagList,
          tagAllMustMatch: tagAllMustMatch,
        )
        .map((rows) => rows.map(recipeWithAllToEntity).toList());
  }
}
