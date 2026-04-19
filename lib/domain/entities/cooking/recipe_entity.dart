import 'dart:convert';

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
  final NutritionInfoEntity nutritionInfo;
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
    NutritionInfoEntity? nutritionInfo,
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

enum UnitType {
  miligrams,
  grams,
  kilograms,
  ounces,
  pounds,
  milliliters,
  liters,
  fluidOunces,
  gallons,
  pieces,
  teaspoons,
  tablespoons;

  String get abbreviation {
    switch (this) {
      case UnitType.miligrams:
        return 'mg';
      case UnitType.grams:
        return 'g';
      case UnitType.kilograms:
        return 'kg';
      case UnitType.ounces:
        return 'oz';
      case UnitType.pounds:
        return 'lb';
      case UnitType.milliliters:
        return 'ml';
      case UnitType.liters:
        return 'l';
      case UnitType.fluidOunces:
        return 'fl oz';
      case UnitType.gallons:
        return 'gal';
      case UnitType.pieces:
        return 'pc';
      case UnitType.teaspoons:
        return 'tsp';
      case UnitType.tablespoons:
        return 'tbsp';
    }
  }

  @override
  String toString() => abbreviation;

  /// Creates a UnitType from abbreviation or name (case-insensitive)
  static UnitType? fromString(String value) {
    final val = value.trim().toLowerCase();
    for (var type in UnitType.values) {
      if (type.name.toLowerCase() == val ||
          type.abbreviation.toLowerCase() == val) {
        return type;
      }
    }
    // Special case for plural abbreviations and common variations
    switch (val) {
      case 'mgs':
        return UnitType.miligrams;
      case 'gs':
        return UnitType.grams;
      case 'kgs':
        return UnitType.kilograms;
      case 'ozs':
        return UnitType.ounces;
      case 'lbs':
        return UnitType.pounds;
      case 'mls':
        return UnitType.milliliters;
      case 'ls':
        return UnitType.liters;
      case 'floz':
      case 'fl. oz.':
      case 'fl.oz':
      case 'fl oz':
        return UnitType.fluidOunces;
      case 'gals':
        return UnitType.gallons;
      case 'pcs':
        return UnitType.pieces;
      case 'tsps':
        return UnitType.teaspoons;
      case 'tbsps':
        return UnitType.tablespoons;
      default:
        return null;
    }
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

class NutritionInfoEntity {
  final int? calories;
  final double? carbohydratesGrams;
  final double? proteinGrams;
  final double? fatGrams;

  NutritionInfoEntity({
    required this.calories,
    this.carbohydratesGrams,
    this.proteinGrams,
    this.fatGrams,
  });

  NutritionInfoEntity copyWith({
    int? calories,
    double? carbohydratesGrams,
    double? proteinGrams,
    double? fatGrams,
  }) {
    return NutritionInfoEntity(
      calories: calories ?? this.calories,
      carbohydratesGrams: carbohydratesGrams ?? this.carbohydratesGrams,
      proteinGrams: proteinGrams ?? this.proteinGrams,
      fatGrams: fatGrams ?? this.fatGrams,
    );
  }

  String toJsonString() {
    return jsonEncode({
      'calories': calories,
      'carbohydratesGrams': carbohydratesGrams,
      'proteinGrams': proteinGrams,
      'fatGrams': fatGrams,
    });
  }

  factory NutritionInfoEntity.fromJsonString(String source) {
    final Map<String, dynamic> json = jsonDecode(source);
    return NutritionInfoEntity(
      calories: json['calories'],
      carbohydratesGrams: (json['carbohydratesGrams'] as num?)?.toDouble(),
      proteinGrams: (json['proteinGrams'] as num?)?.toDouble(),
      fatGrams: (json['fatGrams'] as num?)?.toDouble(),
    );
  }
}
