import 'package:personal_hub_app/domain/entities/food/unit_type.dart';

/// Data Transfer Object representing nutritional information.
/// Updated to match the NutritionEntity model fields and types.
class NutritionDto {
  /// The unit for quantity (e.g., 'gram', 'ml').
  final UnitType? quantityUnit;

  /// The reference quantity (e.g., per 100g).
  final double? perQuantity;

  /// Total energy in kilocalories.
  final double? energyKcal;

  /// Total carbohydrates, in grams.
  final double? carbohydrates;

  /// Total proteins, in grams.
  final double? proteins;

  /// Total fat, in grams.
  final double? fat;

  /// Total sugars, in grams.
  final double? sugars;

  /// Saturated fat, in grams.
  final double? saturatedFat;

  /// Sodium, in grams.
  final double? sodium;

  const NutritionDto({
    this.quantityUnit,
    this.perQuantity,
    this.energyKcal,
    this.carbohydrates,
    this.proteins,
    this.fat,
    this.sugars,
    this.saturatedFat,
    this.sodium,
  });

  factory NutritionDto.fromJson(Map<String, dynamic> json) {
    return NutritionDto(
      quantityUnit: UnitType.values.byName(json['quantity_unit']),
      perQuantity: (json['per_quantity'] as num?)?.toDouble(),
      energyKcal: (json['energy_kcal'] as num?)?.toDouble(),
      carbohydrates: (json['carbohydrates'] as num?)?.toDouble(),
      proteins: (json['proteins'] as num?)?.toDouble(),
      fat: (json['fat'] as num?)?.toDouble(),
      sugars: (json['sugars'] as num?)?.toDouble(),
      saturatedFat: (json['saturated_fat'] as num?)?.toDouble(),
      sodium: (json['sodium'] as num?)?.toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'quantityUnit': quantityUnit,
      'perQuantity': perQuantity,
      'energyKcal': energyKcal,
      'carbohydrates': carbohydrates,
      'proteins': proteins,
      'fat': fat,
      'sugars': sugars,
      'saturatedFat': saturatedFat,
      'sodium': sodium,
    };
  }
}
