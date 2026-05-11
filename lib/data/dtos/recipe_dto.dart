import 'package:personal_hub_app/data/dtos/nutrition_dto.dart';
import 'package:personal_hub_app/domain/entities/food/unit_type.dart';

/// Data Transfer Object for recipes coming from the server.
class RecipeDto {
  /// The recipe name.
  final String name;

  /// The recipe description.
  final String description;

  /// The list of ingredients for the recipe.
  final List<IngredientDto> ingredients;

  /// The procedural steps for the recipe.
  final List<StepDto> steps;

  /// Number of servings this recipe makes.
  final int servings;

  /// Nutrition facts for the recipe.
  final NutritionDto nutritionInfo;

  final DurationDto? duration;

  /// Optional URL for a recipe image.
  final String? imageUrl;

  RecipeDto({
    required this.name,
    required this.description,
    required this.ingredients,
    required this.steps,
    required this.servings,
    required this.nutritionInfo,
    this.duration,
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
      nutritionInfo: NutritionDto.fromJson(json['nutritionInfo']),
      imageUrl: json['imageUrl'],
      duration: json['duration'] != null
          ? DurationDto.fromJson(json['duration'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'ingredients': ingredients.map((e) => e.toJson()).toList(),
      'steps': steps.map((e) => e.toJson()).toList(),
      'servings': servings,
      'nutritionInfo': nutritionInfo.toJson(),
      'imageUrl': imageUrl,
      'duration': duration?.toJson(),
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

/// Data Transfer Object representing preparation, cooking, and resting times (in minutes) for a recipe as sent by the server.
class DurationDto {
  /// Preparation time in minutes. Nullable since the server may omit it.
  final int? prepTimeMinutes;
  /// Cooking time in minutes. Nullable since the server may omit it.
  final int? cookTimeMinutes;
  /// Rest time in minutes. Nullable since the server may omit it.
  final int? restTimeMinutes;

  /// Creates a [DurationDto] with the given times. All fields are optional.
  DurationDto({
    this.prepTimeMinutes,
    this.cookTimeMinutes,
    this.restTimeMinutes,
  });

  /// Creates a [DurationDto] from a JSON map from the server.
  factory DurationDto.fromJson(Map<String, dynamic> json) {
    return DurationDto(
      prepTimeMinutes: json['prepTimeMinutes'],
      cookTimeMinutes: json['cookTimeMinutes'],
      restTimeMinutes: json['restTimeMinutes'],
    );
  }

  /// Converts this [DurationDto] into a JSON map.
  Map<String, dynamic> toJson() {
    return {
      if (prepTimeMinutes != null) 'prepTimeMinutes': prepTimeMinutes,
      if (cookTimeMinutes != null) 'cookTimeMinutes': cookTimeMinutes,
      if (restTimeMinutes != null) 'restTimeMinutes': restTimeMinutes,
    };
  }
}
