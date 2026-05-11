import 'package:personal_hub_app/domain/entities/food/nutrition_entity.dart';

/// Enum for auto-fill type.
enum FoodAutoFillType { generic, product }

/// Data Transfer Object for food autocomplete entries.
class FoodAutoFillEntity {
  /// Unique identifier (UUID as string).
  final String id;

  /// Name of the food item.
  final String name;

  /// Type of the entry: 'generic' or 'product'
  final FoodAutoFillType type;

  const FoodAutoFillEntity({
    required this.id,
    required this.name,
    required this.type,
  });

  factory FoodAutoFillEntity.fromJson(Map<String, dynamic> json) => FoodAutoFillEntity(
        id: json['id'] as String,
        name: json['name'] as String,
        type: (json['type'] as String) == 'product' ? FoodAutoFillType.product : FoodAutoFillType.generic,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'type': type.name,
      };

  /// Returns a copy of this entity with optional property overrides.
  FoodAutoFillEntity copyWith({
    String? id,
    String? name,
    FoodAutoFillType? type,
  }) {
    return FoodAutoFillEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      type: type ?? this.type,
    );
  }
}

/// Domain entity for a food product (packaged food).
class FoodProductEntity {
  /// Unique identifier (UUID as string).
  final String id;

  /// Name of the product.
  final String name;

  /// Nutrition information.
  final NutritionEntity nutrition;

  /// Barcode number of the product.
  final String barcode;

  /// Display quantity (e.g. '500g', '1L').
  final String quantity;

  /// Brand name of the product.
  final String brand;

  const FoodProductEntity({
    required this.id,
    required this.name,
    required this.nutrition,
    required this.barcode,
    required this.quantity,
    required this.brand,
  });

  /// Returns a copy of this entity with optional property overrides.
  FoodProductEntity copyWith({
    String? id,
    String? name,
    NutritionEntity? nutrition,
    String? barcode,
    String? quantity,
    String? brand,
  }) {
    return FoodProductEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      nutrition: nutrition ?? this.nutrition,
      barcode: barcode ?? this.barcode,
      quantity: quantity ?? this.quantity,
      brand: brand ?? this.brand,
    );
  }
}

class CustomFoodEntity {
  final String name;
  final NutritionEntity nutrition;

  const CustomFoodEntity({
    required this.name,
    required this.nutrition,
  });

  CustomFoodEntity copyWith({
    String? name,
    NutritionEntity? nutrition,
  }) {
    return CustomFoodEntity(
      name: name ?? this.name,
      nutrition: nutrition ?? this.nutrition,
    );
  }
}
