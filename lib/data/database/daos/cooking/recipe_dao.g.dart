// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_dao.dart';

// ignore_for_file: type=lint
mixin _$RecipeDaoMixin on DatabaseAccessor<AppDatabase> {
  $RecipesTable get recipes => attachedDatabase.recipes;
  $IngredientsTable get ingredients => attachedDatabase.ingredients;
  $StepsTable get steps => attachedDatabase.steps;
  $StepIngredientsTable get stepIngredients => attachedDatabase.stepIngredients;
  $TagsTable get tags => attachedDatabase.tags;
  $RecipeTagsTable get recipeTags => attachedDatabase.recipeTags;
  RecipeDaoManager get managers => RecipeDaoManager(this);
}

class RecipeDaoManager {
  final _$RecipeDaoMixin _db;
  RecipeDaoManager(this._db);
  $$RecipesTableTableManager get recipes =>
      $$RecipesTableTableManager(_db.attachedDatabase, _db.recipes);
  $$IngredientsTableTableManager get ingredients =>
      $$IngredientsTableTableManager(_db.attachedDatabase, _db.ingredients);
  $$StepsTableTableManager get steps =>
      $$StepsTableTableManager(_db.attachedDatabase, _db.steps);
  $$StepIngredientsTableTableManager get stepIngredients =>
      $$StepIngredientsTableTableManager(
        _db.attachedDatabase,
        _db.stepIngredients,
      );
  $$TagsTableTableManager get tags =>
      $$TagsTableTableManager(_db.attachedDatabase, _db.tags);
  $$RecipeTagsTableTableManager get recipeTags =>
      $$RecipeTagsTableTableManager(_db.attachedDatabase, _db.recipeTags);
}
