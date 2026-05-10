import 'dart:convert';

import 'package:personal_hub_app/domain/entities/food/unit_type.dart';

class NutritionEntity {
  final double? energyKcal;
  final double? carbohydrates;
  final double? proteins;
  final double? fat;
  final double? sugars;
  final double? saturatedFat;
  final double? sodium;

  /// The unit of the quantity, e.g., 'gram', 'ml'.
  final UnitType? quantityUnit;
  /// The number of [quantityUnit] this entry refers to, e.g. 100 (for 100 g)
  final double? perQuantity;

  NutritionEntity({
    this.energyKcal,
    this.carbohydrates,
    this.proteins,
    this.fat,
    this.sugars,
    this.saturatedFat,
    this.sodium,
    this.quantityUnit,
    this.perQuantity,
  });

  NutritionEntity copyWith({
    double? energyKcal,
    double? carbohydrates,
    double? proteins,
    double? fat,
    double? sugars,
    double? saturatedFat,
    double? sodium,
    UnitType? quantityUnit,
    double? perQuantity,
  }) {
    return NutritionEntity(
      energyKcal: energyKcal ?? this.energyKcal,
      carbohydrates: carbohydrates ?? this.carbohydrates,
      proteins: proteins ?? this.proteins,
      fat: fat ?? this.fat,
      sugars: sugars ?? this.sugars,
      saturatedFat: saturatedFat ?? this.saturatedFat,
      sodium: sodium ?? this.sodium,
      quantityUnit: quantityUnit ?? this.quantityUnit,
      perQuantity: perQuantity ?? this.perQuantity,
    );
  }

  String toJsonString() {
    return jsonEncode({
      'energyKcal': energyKcal,
      'carbohydrates': carbohydrates,
      'proteins': proteins,
      'fat': fat,
      'sugars': sugars,
      'saturatedFat': saturatedFat,
      'sodium': sodium,
      'quantityUnit': quantityUnit?.toString(),
      'perQuantity': perQuantity,
    });
  }

  factory NutritionEntity.fromJsonString(String source) {
    final Map<String, dynamic> json = jsonDecode(source);
    return NutritionEntity(
      energyKcal: (json['energyKcal'] as num?)?.toDouble(),
      carbohydrates: (json['carbohydrates'] as num?)?.toDouble(),
      proteins: (json['proteins'] as num?)?.toDouble(),
      fat: (json['fat'] as num?)?.toDouble(),
      sugars: (json['sugars'] as num?)?.toDouble(),
      saturatedFat: (json['saturatedFat'] as num?)?.toDouble(),
      sodium: (json['sodium'] as num?)?.toDouble(),
      quantityUnit: json['quantityUnit'] != null
          ? UnitType.values.firstWhere(
              (e) => e.toString() == json['quantityUnit'],
              orElse: () => UnitType.grams,
            )
          : null,
      perQuantity: (json['perQuantity'] as num?)?.toDouble(),
    );
  }

  NutritionEntity operator +(NutritionEntity other) {
    return NutritionEntity(
      energyKcal: (energyKcal ?? 0) + (other.energyKcal ?? 0),
      carbohydrates: (carbohydrates ?? 0) + (other.carbohydrates ?? 0),
      proteins: (proteins ?? 0) + (other.proteins ?? 0),
      fat: (fat ?? 0) + (other.fat ?? 0),
      sugars: (sugars ?? 0) + (other.sugars ?? 0),
      saturatedFat: (saturatedFat ?? 0) + (other.saturatedFat ?? 0),
      sodium: (sodium ?? 0) + (other.sodium ?? 0),
      quantityUnit: null,
      perQuantity: null,
    );
  }
}
