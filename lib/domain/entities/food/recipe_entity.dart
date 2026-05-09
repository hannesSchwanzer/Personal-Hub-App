import 'package:personal_hub_app/domain/entities/food/nutrition_entity.dart';
import 'package:personal_hub_app/domain/entities/food/unit_type.dart';

class RecipeEntity {
  final String id;
  final String name;
  final String description;
  final List<IngredientEntity> ingredients;
  final List<StepEntity> steps;
  final List<String> tags;
  final int servings;
  final int cookingTimeMinutes;
  final int preparationTimeMinutes;
  final NutritionEntity nutritionInfo;
  final String imagePath;

  RecipeEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.ingredients,
    required this.steps,
    required this.tags,
    required this.servings,
    required this.cookingTimeMinutes,
    required this.preparationTimeMinutes,
    required this.nutritionInfo,
    required this.imagePath,
  });

  RecipeEntity copyWith({
    String? id,
    String? name,
    String? description,
    List<IngredientEntity>? ingredients,
    List<StepEntity>? steps,
    List<String>? tags,
    int? servings,
    int? cookingTimeMinutes,
    int? preparationTimeMinutes,
    NutritionEntity? nutritionInfo,
    String? imagePath,
  }) {
    return RecipeEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      ingredients: ingredients ?? this.ingredients,
      steps: steps ?? this.steps,
      tags: tags ?? this.tags,
      servings: servings ?? this.servings,
      cookingTimeMinutes: cookingTimeMinutes ?? this.cookingTimeMinutes,
      preparationTimeMinutes:
          preparationTimeMinutes ?? this.preparationTimeMinutes,
      nutritionInfo: nutritionInfo ?? this.nutritionInfo,
      imagePath: imagePath ?? this.imagePath,
    );
  }

  @override
  String toString() {
    return 'RecipeEntity(id: $id, name: $name, description: $description, ingredients: $ingredients, steps: $steps, tags: $tags, servings: $servings, cookingTimeMinutes: $cookingTimeMinutes, preparationTimeMinutes: $preparationTimeMinutes, nutritionInfo: $nutritionInfo, imageUrl: $imagePath)';
  }
}

class IngredientEntity {
  final int? id;
  final String name;
  final double quantity;
  final UnitType unit;

  IngredientEntity({
    this.id,
    required this.name,
    required this.quantity,
    required this.unit,
  });

  IngredientEntity copyWith({String? name, double? quantity, UnitType? unit}) {
    return IngredientEntity(
      name: name ?? this.name,
      quantity: quantity ?? this.quantity,
      unit: unit ?? this.unit,
    );
  }
}

class StepEntity {
  final int? id;
  final List<StepIngredientEntity> ingredients;
  final String instruction;
  final String? imagePath;

  StepEntity({
    this.id,
    required this.ingredients,
    required this.instruction,
    this.imagePath,
  });

  StepEntity copyWith({
    List<StepIngredientEntity>? ingredients,
    String? instruction,
    String? imagePath,
  }) {
    return StepEntity(
      ingredients: ingredients ?? this.ingredients,
      instruction: instruction ?? this.instruction,
      imagePath: imagePath ?? this.imagePath,
    );
  }
}

class StepIngredientEntity {
  final String name;
  final double quantityPercent;

  StepIngredientEntity({required this.name, required this.quantityPercent});

  StepIngredientEntity copyWith({String? name, double? quantityPercent}) {
    return StepIngredientEntity(
      name: name ?? this.name,
      quantityPercent: quantityPercent ?? this.quantityPercent,
    );
  }
}
