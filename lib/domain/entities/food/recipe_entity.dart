import 'dart:convert';

import 'package:personal_hub_app/domain/entities/food/nutrition_entity.dart';
import 'package:personal_hub_app/domain/entities/food/unit_type.dart';

/// Domain model for a Recipe, including strong modification methods to enforce consistency.
class RecipeEntity {
  final String id;
  final String name;
  final String description;
  final List<IngredientEntity> ingredients;
  final List<StepEntity> steps;
  final List<String> tags;
  final int servings;
  final DurationEntity duration;
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
    required this.nutritionInfo,
    required this.imagePath,
    required this.duration,
  });

  /// Returns a new RecipeEntity with the specified ingredient added.
  RecipeEntity addIngredient(IngredientEntity ingredient) {
    print("Add ingredient: ${ingredient.name}");
    final updatedIngredients = List<IngredientEntity>.from(ingredients)
      ..add(ingredient);
    return copyWith(ingredients: updatedIngredients);
  }

  /// Returns a new RecipeEntity where the specified ingredient has been renamed everywhere (ingredients + step references).
  RecipeEntity renameIngredient(String oldName, String newName) {
    print("Rename ingredient: $oldName to $newName");
    final updatedIngredients = ingredients
        .map((ing) => ing.name == oldName ? ing.copyWith(name: newName) : ing)
        .toList();
    final updatedSteps = steps
        .map(
          (step) => step.copyWith(
            ingredients: step.ingredients
                .map(
                  (si) => si.name == oldName ? si.copyWith(name: newName) : si,
                )
                .toList(),
          ),
        )
        .toList();
    return copyWith(ingredients: updatedIngredients, steps: updatedSteps);
  }

  /// Returns a new RecipeEntity with the given ingredient removed from ingredients and any steps it is referenced in.
  RecipeEntity removeIngredient(String nameToRemove) {
    print("Remove ingredient: $nameToRemove");
    final updatedIngredients = ingredients
        .where((ing) => ing.name != nameToRemove)
        .toList();
    final updatedSteps = steps
        .map(
          (step) => step.copyWith(
            ingredients: step.ingredients
                .where((si) => si.name != nameToRemove)
                .toList(),
          ),
        )
        .toList();
    return copyWith(ingredients: updatedIngredients, steps: updatedSteps);
  }

  RecipeEntity copyWith({
    String? id,
    String? name,
    String? description,
    List<IngredientEntity>? ingredients,
    List<StepEntity>? steps,
    List<String>? tags,
    int? servings,
    NutritionEntity? nutritionInfo,
    String? imagePath,
    DurationEntity? duration,
  }) {
    return RecipeEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      ingredients: ingredients ?? this.ingredients,
      steps: steps ?? this.steps,
      tags: tags ?? this.tags,
      servings: servings ?? this.servings,
      nutritionInfo: nutritionInfo ?? this.nutritionInfo,
      imagePath: imagePath ?? this.imagePath,
      duration: duration ?? this.duration,
    );
  }

  factory RecipeEntity.empty() {
    return RecipeEntity(
      id: '',
      name: '',
      description: '',
      ingredients: [],
      steps: [],
      tags: [],
      servings: 1,
      duration: DurationEntity(),
      nutritionInfo: NutritionEntity(),
      imagePath: '',
    );
  }
}

class IngredientEntity {
  final String name;
  final double quantity;
  final UnitType unit;
  final String? additionalInfo;

  IngredientEntity({
    required this.name,
    required this.quantity,
    required this.unit,
    this.additionalInfo,
  });

  IngredientEntity copyWith({
    String? name,
    double? quantity,
    UnitType? unit,
    String? additionalInfo,
  }) {
    return IngredientEntity(
      name: name ?? this.name,
      quantity: quantity ?? this.quantity,
      unit: unit ?? this.unit,
      additionalInfo: additionalInfo ?? this.additionalInfo,
    );
  }

  String toJsonString() {
    return jsonEncode({
      'name': name,
      'quantity': quantity,
      'unit': unit.toString(),
      'additionalInfo': additionalInfo,
    });
  }

  factory IngredientEntity.fromJsonString(String jsonString) {
    final Map<String, dynamic> json = jsonDecode(jsonString);
    return IngredientEntity(
      name: json['name'],
      quantity: (json['quantity'] as num).toDouble(),
      unit: UnitType.fromString(json['unit'])!,
      additionalInfo: json['additionalInfo'],
    );
  }
}

class StepEntity {
  final List<StepIngredientEntity> ingredients;
  final String instruction;
  final String? imagePath;

  StepEntity({
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

  String toJsonString() {
    return jsonEncode({
      'ingredients': ingredients.map((e) => e.toJsonString()).toList(),
      'instruction': instruction,
      'imagePath': imagePath,
    });
  }

  factory StepEntity.fromJsonString(String jsonString) {
    final Map<String, dynamic> json = jsonDecode(jsonString);
    return StepEntity(
      ingredients: (json['ingredients'] as List)
          .map((e) => StepIngredientEntity.fromJsonString(e))
          .toList(),
      instruction: json['instruction'],
      imagePath: json['imagePath'],
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

  String toJsonString() {
    return jsonEncode({'name': name, 'quantityPercent': quantityPercent});
  }

  factory StepIngredientEntity.fromJsonString(String jsonString) {
    final Map<String, dynamic> json = jsonDecode(jsonString);
    return StepIngredientEntity(
      name: json['name'],
      quantityPercent: (json['quantityPercent'] as num).toDouble(),
    );
  }
}

class DurationEntity {
  final int? prepTimeMinutes;
  final int? cookTimeMinutes;
  final int? restTimeMinutes;

  DurationEntity({
    this.prepTimeMinutes,
    this.cookTimeMinutes,
    this.restTimeMinutes,
  });

  DurationEntity copyWith({
    int? prepTimeMinutes,
    int? cookTimeMinutes,
    int? restTimeMinutes,
  }) {
    return DurationEntity(
      prepTimeMinutes: prepTimeMinutes ?? this.prepTimeMinutes,
      cookTimeMinutes: cookTimeMinutes ?? this.cookTimeMinutes,
      restTimeMinutes: restTimeMinutes ?? this.restTimeMinutes,
    );
  }

  String toJsonString() {
    return jsonEncode({
      'prepTimeMinutes': prepTimeMinutes,
      'cookTimeMinutes': cookTimeMinutes,
      'restTimeMinutes': restTimeMinutes,
    });
  }

  factory DurationEntity.fromJsonString(String jsonString) {
    final Map<String, dynamic> json = jsonDecode(jsonString);
    return DurationEntity(
      prepTimeMinutes: json['prepTimeMinutes'],
      cookTimeMinutes: json['cookTimeMinutes'],
      restTimeMinutes: json['restTimeMinutes'],
    );
  }

  int get totalTimeMinutes {
    final prep = prepTimeMinutes ?? 0;
    final cook = cookTimeMinutes ?? 0;
    final rest = restTimeMinutes ?? 0;
    return prep + cook + rest;
  }
}
