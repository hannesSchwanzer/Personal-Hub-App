import 'package:personal_hub_app/domain/entities/food/recipe_entity.dart';
import 'package:personal_hub_app/data/mappers/recipe_mapper.dart';
import 'package:personal_hub_app/domain/repositories/recipe_repository.dart';
import 'package:uuid/uuid.dart';
import 'package:personal_hub_app/data/database/daos/cooking/recipe_dao.dart';

class RecipeRepositoryImpl implements RecipeRepository {
  final RecipeDao _dao;

  RecipeRepositoryImpl({
    required RecipeDao dao,
  }) : _dao = dao;

  @override
  Future<RecipeEntity?> getRecipe(String id) async {
    final recipe = await _dao.getRecipe(id);
    if (recipe == null) return null;
    return recipe.toEntity();
  }

  @override
  Future<List<RecipeEntity>> getAllRecipes() async {
    final rows = await _dao.getAllRecipes();
    return rows.map((r) => r.toEntity()).toList();
  }

  @override
  Stream<List<RecipeEntity>> watchAllRecipes() {
    return _dao.watchAllRecipes().map(
      (rows) => rows.map((r) => r.toEntity()).toList()
    );
  }

  @override
  Future<void> insertRecipe(RecipeEntity entity) async {
    entity = entity.copyWith(id: Uuid().v4());
    final dbMap = recipeToDb(entity);
    await _dao.insertRecipeWithTags(
      recipe: dbMap['recipe'],
      tagList: dbMap['tags'],
    );
  }

  @override
  Future<void> updateRecipe(RecipeEntity entity) async {
    final dbMap = recipeToDb(entity);
    await _dao.updateRecipe(
      recipe: dbMap['recipe'],
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
    List<String>? tagList,
    bool tagAllMustMatch = false,
  }) {
    return _dao
        .searchRecipes(
          searchString: searchString,
          fuzzy: fuzzy,
          tagList: tagList,
          tagAllMustMatch: tagAllMustMatch,
        )
        .then((rows) => rows.map((r) => r.toEntity()).toList());
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
        .map((data) => data?.toEntity());
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
          tagList: tagList,
          tagAllMustMatch: tagAllMustMatch,
        )
        .map((rows) => rows.map((r) => r.toEntity()).toList());
  }
}
