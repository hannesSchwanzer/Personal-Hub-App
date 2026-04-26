import 'package:personal_hub_app/data/database/app_database.dart';
import 'package:personal_hub_app/data/database/daos/cooking/recipe_dao.dart';
import 'package:personal_hub_app/data/dtos/recipe_dto.dart';
import 'package:personal_hub_app/domain/entities/cooking/recipe_entity.dart';
import 'package:drift/drift.dart';

/// Maps a [RecipesData] and its children into a domain [RecipeEntity].
RecipeEntity recipeFromDbParts(
  Recipe recipe,
  List<Ingredient> ingredients,
  List<Step> steps,
  List<StepIngredient> stepIngredients,
  List<String> tags,
) {
  final List<IngredientEntity> ingredientEntities =
      ingredients.map(ingredientFromDb).toList();

  final List<StepEntity> stepEntities = steps.map((stepRow) {
    final matchingStepIngredients = stepIngredients
        .where((si) => si.stepId == stepRow.id)
        .map(stepIngredientFromDb)
        .toList();
    return stepFromDb(stepRow, matchingStepIngredients);
  }).toList();

  final NutritionInfoEntity nutritionInfo =
      NutritionInfoEntity.fromJsonString(recipe.nutritionInfoJson);

  return RecipeEntity(
    id: recipe.id,
    name: recipe.name,
    description: recipe.description ?? '',
    ingredients: ingredientEntities,
    steps: stepEntities,
    tags: tags,
    servings: recipe.servings,
    cookingTimeMinutes: recipe.cookingTimeMinutes,
    preparationTimeMinutes: recipe.preparationTimeMinutes,
    nutritionInfo: nutritionInfo,
    imagePath: recipe.imageUrl ?? '',
  );
}

/// Converts [IngredientsData] row to domain [IngredientEntity].
IngredientEntity ingredientFromDb(Ingredient row) {
  return IngredientEntity(
    name: row.name,
    quantity: row.quantity,
    unit: UnitType.fromString(row.unit)!,
  );
}

/// Converts [StepIngredientsData] to domain [StepIngredientEntity].
StepIngredientEntity stepIngredientFromDb(StepIngredient si) {
  return StepIngredientEntity(
    name: si.name,
    quantityPercent: si.quantityPercent,
  );
}

/// Converts [StepsData] and its [stepIngredients] into [StepEntity].
StepEntity stepFromDb(Step step, List<StepIngredientEntity> stepIngredients) {
  return StepEntity(
    ingredients: stepIngredients,
    instruction: step.instruction,
    imagePath: step.imageUrl,
  );
}

/// For use by repository/services to map from [RecipeWithAll] to [RecipeEntity].
RecipeEntity recipeWithAllToEntity(RecipeWithAll data) {
  return recipeFromDbParts(
    data.recipe,
    data.ingredients,
    data.steps,
    data.stepIngredients,
    data.tags,
  );
}

/// Maps a domain [RecipeEntity] to Drift Companion classes for writes.
///
/// Returns:
/// {
///   'recipe': RecipesCompanion,
///   'ingredients': List<IngredientsCompanion>,
///   'steps': List<StepsCompanion>,
///   'stepIngredients': List<StepIngredientsCompanion>,
///   'tags': List<String>,
/// }
Map<String, dynamic> recipeToDb(RecipeEntity entity) {
  // RecipeCompanion
  final recipeCompanion = RecipesCompanion(
    id: Value(entity.id),
    name: Value(entity.name),
    description: Value(entity.description),
    servings: Value(entity.servings),
    cookingTimeMinutes: Value(entity.cookingTimeMinutes),
    preparationTimeMinutes: Value(entity.preparationTimeMinutes),
    nutritionInfoJson: Value(entity.nutritionInfo.toJsonString()),
    imageUrl: Value(entity.imagePath),
  );
  // IngredientsCompanion
  final ingredientCompanions = entity.ingredients
      .map((i) => ingredientToDb(i, entity.id))
      .toList();

  // StepsCompanion
  final List<StepsCompanion> stepCompanions = [];
  final List<StepIngredientsCompanion> stepIngredientCompanions = [];
  for (var i = 0; i < entity.steps.length; i++) {
    final step = entity.steps[i];
    stepCompanions.add(stepToDb(step, entity.id, i));
    for (var si in step.ingredients) {
        final Value<int> stepIdValue = step.id != null ? Value(step.id!) : const Value.absent();
        stepIngredientCompanions.add(StepIngredientsCompanion(
          stepId: stepIdValue,
        name: Value(si.name),
        quantityPercent: Value(si.quantityPercent),
      ));
    }
  }

  final tags = entity.tags;

  return {
    'recipe': recipeCompanion,
    'ingredients': ingredientCompanions,
    'steps': stepCompanions,
    'stepIngredients': stepIngredientCompanions,
    'tags': tags,
  };
}

/// Maps a domain [IngredientEntity] to Drift [IngredientsCompanion].
IngredientsCompanion ingredientToDb(IngredientEntity entity, String recipeId) {
  return IngredientsCompanion(
    id: entity.id != null ? Value(entity.id!) : const Value.absent(),
    recipeId: Value(recipeId),
    name: Value(entity.name),
    quantity: Value(entity.quantity),
    unit: Value(entity.unit.toString()),
  );
}

/// Maps a domain [StepEntity] to Drift [StepsCompanion].
StepsCompanion stepToDb(StepEntity entity, String recipeId, int position) {
  return StepsCompanion(
    id: entity.id != null ? Value(entity.id!) : const Value.absent(),
    recipeId: Value(recipeId),
    position: Value(position),
    instruction: Value(entity.instruction),
    imageUrl: Value(entity.imagePath),
  );
}

/// Maps a domain [StepIngredientEntity] to [StepIngredientsCompanion]
/// with stepId left absent (for insert). The DAO will map by step.
StepIngredientsCompanion stepIngredientToDbAbsentStep(StepIngredientEntity entity) {
  return StepIngredientsCompanion(
    stepId: const Value.absent(),
    name: Value(entity.name),
    quantityPercent: Value(entity.quantityPercent),
  );
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
      cookingTimeMinutes: cookingTimeMinutes,
      preparationTimeMinutes: preparationTimeMinutes,
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
    return StepIngredientEntity(
      name: name,
      quantityPercent: quantityPercent,
    );
  }
}

extension NutritionInfoDtoMapper on NutritionInfoDto {
  NutritionInfoEntity toEntity() {
    return NutritionInfoEntity(
      calories: calories,
      carbohydratesGrams: carbohydratesGrams,
      proteinGrams: proteinGrams,
      fatGrams: fatGrams,
    );
  }
}
