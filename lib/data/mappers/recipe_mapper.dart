import 'dart:convert';

import 'package:personal_hub_app/data/database/app_database.dart';
import 'package:personal_hub_app/data/database/daos/cooking/recipe_dao.dart';
import 'package:personal_hub_app/data/dtos/recipe_dto.dart';
import 'package:personal_hub_app/domain/entities/food/nutrition_entity.dart';
import 'package:personal_hub_app/domain/entities/food/recipe_entity.dart';
import 'package:personal_hub_app/data/mappers/nutition_mapper.dart';
import 'package:drift/drift.dart';

/// Maps a [RecipesData] and its children into a domain [RecipeEntity].
/// Maps a RecipesData row (with JSON columns for nested objects) and its tags to a RecipeEntity.
RecipeEntity recipeFromDb(Recipe recipe, List<String> tags) {
  final List<IngredientEntity> ingredientEntities =
      (jsonDecode(recipe.ingredientsJson) as List)
          .map<IngredientEntity>((i) => IngredientEntity.fromJsonString(i))
          .toList();

  final List<StepEntity> stepEntities = (jsonDecode(recipe.stepsJson) as List)
      .map<StepEntity>((s) => StepEntity.fromJsonString(s))
      .toList();

  final NutritionEntity nutritionInfo = NutritionEntity.fromJsonString(
    recipe.nutritionJson,
  );

  final DurationEntity duration = DurationEntity.fromJsonString(
    recipe.durationJson,
  );

  return RecipeEntity(
    id: recipe.id,
    name: recipe.name,
    description: recipe.description,
    ingredients: ingredientEntities,
    steps: stepEntities,
    tags: tags,
    servings: recipe.servings,
    duration: duration,
    nutritionInfo: nutritionInfo,
    imagePath: recipe.imagePath,
  );
}

extension RecipeMapper on RecipeWithTags {
  RecipeEntity toEntity() {
    return recipeFromDb(recipe, tags);
  }
}

Map<String, dynamic> recipeToDb(RecipeEntity entity) {
  final recipeCompanion = RecipesCompanion(
    id: Value(entity.id),
    name: Value(entity.name),
    description: Value(entity.description),
    ingredientsJson: Value(
      jsonEncode(entity.ingredients.map((i) => i.toJsonString()).toList()),
    ),
    stepsJson: Value(
      jsonEncode(entity.steps.map((s) => s.toJsonString()).toList()),
    ),
    servings: Value(entity.servings),
    nutritionJson: Value(entity.nutritionInfo.toJsonString()),
    durationJson: Value(entity.duration.toJsonString()),
    imagePath: Value(entity.imagePath),
  );

  final tags = entity.tags;

  return {'recipe': recipeCompanion, 'tags': tags};
}

extension RecipeDtoMapper on RecipeDto {
  RecipeEntity toEntity({String? localImagePath}) {
    return RecipeEntity(
      id: "",
      name: name,
      description: description,
      ingredients: ingredients.map((e) => e.toEntity()).toList(),
      steps: steps.map((e) => e.toEntity()).toList(),
      tags: [],
      servings: servings,
      duration: duration.toEntity(),
      nutritionInfo: nutritionInfo.toEntity(),
      imagePath: localImagePath ?? '',
    );
  }
}

extension IngredientDtoMapper on IngredientDto {
  IngredientEntity toEntity() {
    return IngredientEntity(
      name: name,
      quantity: quantity,
      unit: unit, // same enum
      additionalInfo: additionalInfo,
    );
  }
}

extension StepDtoMapper on StepDto {
  StepEntity toEntity() {
    return StepEntity(
      ingredients: ingredients.map((e) => e.toEntity()).toList(),
      instruction: instruction,
      imagePath: null, // DTO doesn't provide it
    );
  }
}

extension StepIngredientDtoMapper on StepIngredientDto {
  StepIngredientEntity toEntity() {
    return StepIngredientEntity(name: name, quantityPercent: quantityPercent);
  }
}

extension DurationDtoMapper on DurationDto {
  DurationEntity toEntity() {
    return DurationEntity(
      prepTimeMinutes: prepTimeMinutes,
      cookTimeMinutes: cookTimeMinutes,
      restTimeMinutes: restTimeMinutes,
    );
  }
}
