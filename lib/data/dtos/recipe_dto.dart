import 'package:personal_hub_app/domain/entities/cooking/recipe_entity.dart';

class RecipeDto {
  final String name;
  final String description;
  final List<IngredientDto> ingredients;
  final List<StepDto> steps;
  final int servings;
  final int cookingTimeMinutes;
  final int preparationTimeMinutes;
  final NutritionInfoDto nutritionInfo;
  final String? imageUrl;

  RecipeDto({
    required this.name,
    required this.description,
    required this.ingredients,
    required this.steps,
    required this.servings,
    required this.cookingTimeMinutes,
    required this.preparationTimeMinutes,
    required this.nutritionInfo,
    this.imageUrl,
  });

  factory RecipeDto.fromJson(Map<String, dynamic> json) {
    return RecipeDto(
      name: json['name'],
      description: json['description'],
      ingredients: (json['ingredients'] as List)
          .map((e) => IngredientDto.fromJson(e))
          .toList(),
      steps: (json['steps'] as List)
          .map((e) => StepDto.fromJson(e))
          .toList(),
      servings: json['servings'],
      cookingTimeMinutes: json['cookingTimeMinutes'],
      preparationTimeMinutes: json['preparationTimeMinutes'],
      nutritionInfo:
          NutritionInfoDto.fromJson(json['nutritionInfo']),
      imageUrl: json['imageUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'ingredients': ingredients.map((e) => e.toJson()).toList(),
      'steps': steps.map((e) => e.toJson()).toList(),
      'servings': servings,
      'cookingTimeMinutes': cookingTimeMinutes,
      'preparationTimeMinutes': preparationTimeMinutes,
      'nutritionInfo': nutritionInfo.toJson(),
      'imageUrl': imageUrl,
    };
  }
}

class NutritionInfoDto {
  final int? calories;
  final double? carbohydratesGrams;
  final double? proteinGrams;
  final double? fatGrams;

  NutritionInfoDto({
    this.calories,
    this.carbohydratesGrams,
    this.proteinGrams,
    this.fatGrams,
  });

  factory NutritionInfoDto.fromJson(Map<String, dynamic> json) {
    return NutritionInfoDto(
      calories: json['calories'],
      carbohydratesGrams: (json['carbohydratesGrams'] as num?)?.toDouble(),
      proteinGrams: (json['proteinGrams'] as num?)?.toDouble(),
      fatGrams: (json['fatGrams'] as num?)?.toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'calories': calories,
      'carbohydratesGrams': carbohydratesGrams,
      'proteinGrams': proteinGrams,
      'fatGrams': fatGrams,
    };
  }
}

class StepDto {
  final List<StepIngredientDto> ingredients;
  final String instruction;

  StepDto({
    required this.ingredients,
    required this.instruction,
  });

  factory StepDto.fromJson(Map<String, dynamic> json) {
    return StepDto(
      ingredients: (json['ingredients'] as List)
          .map((e) => StepIngredientDto.fromJson(e))
          .toList(),
      instruction: json['instruction'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'ingredients': ingredients.map((e) => e.toJson()).toList(),
      'instruction': instruction,
    };
  }
}

class StepIngredientDto {
  final String name;
  final double quantityPercent;

  StepIngredientDto({
    required this.name,
    required this.quantityPercent,
  });

  factory StepIngredientDto.fromJson(Map<String, dynamic> json) {
    return StepIngredientDto(
      name: json['name'],
      quantityPercent: (json['quantityPercent'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'quantityPercent': quantityPercent,
    };
  }
}

class IngredientDto {
  final String name;
  final double quantity;
  final UnitType unit;

  IngredientDto({
    required this.name,
    required this.quantity,
    required this.unit,
  });

  factory IngredientDto.fromJson(Map<String, dynamic> json) {
    return IngredientDto(
      name: json['name'],
      quantity: (json['quantity'] as num).toDouble(),
      unit: UnitType.values.byName(json['unit']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'quantity': quantity,
      'unit': unit.name,
    };
  }
}

