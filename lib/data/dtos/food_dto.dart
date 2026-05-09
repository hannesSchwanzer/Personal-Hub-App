import 'package:personal_hub_app/data/dtos/nutrition_dto.dart';
import 'package:personal_hub_app/domain/entities/food/food_entities.dart';

/// Data Transfer Object for a generic food entity.
class GenericFoodDto {
  /// Unique identifier (UUID as string).
  final String id;

  /// Name of the food item.
  final String name;

  /// Nutrition information.
  final NutritionDto nutrition;

  const GenericFoodDto({
    required this.id,
    required this.name,
    required this.nutrition,
  });

  factory GenericFoodDto.fromJson(Map<String, dynamic> json) => GenericFoodDto(
        id: json['id'] as String,
        name: json['name'] as String,
        nutrition: NutritionDto.fromJson(json['nutrition'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'nutrition': nutrition.toJson(),
      };
}

/// Data Transfer Object for a food product (packaged food item).
class FoodProductDto {
  /// Unique identifier (UUID as string).
  final String id;

  /// Name of the product.
  final String name;

  /// Nutrition information.
  final NutritionDto nutrition;

  /// Barcode number of the product.
  final String barcode;

  /// Display quantity (e.g. '500g', '1L').
  final String quantity;

  /// Brand name of the product.
  final String brand;

  const FoodProductDto({
    required this.id,
    required this.name,
    required this.nutrition,
    required this.barcode,
    required this.quantity,
    required this.brand,
  });

  factory FoodProductDto.fromJson(Map<String, dynamic> json) => FoodProductDto(
        id: json['id'] as String,
        name: json['name'] as String,
        nutrition: NutritionDto.fromJson(json['nutrition'] as Map<String, dynamic>),
        barcode: json['barcode'] as String,
        quantity: json['quantity'] as String,
        brand: json['brand'] as String,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'nutrition': nutrition.toJson(),
        'barcode': barcode,
        'quantity': quantity,
        'brand': brand,
      };
}

/// Data Transfer Object for food autocomplete entries.
class FoodAutoFillDto {
  /// Unique identifier (UUID as string).
  final String id;

  /// Name of the food item.
  final String name;

  /// Type of the entry: 'generic' or 'product'
  final FoodAutoFillType type;

  const FoodAutoFillDto({
    required this.id,
    required this.name,
    required this.type,
  });

  factory FoodAutoFillDto.fromJson(Map<String, dynamic> json) => FoodAutoFillDto(
        id: json['id'] as String,
        name: json['name'] as String,
        type: (json['type'] as String) == 'product' ? FoodAutoFillType.product : FoodAutoFillType.generic,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'type': type.name,
      };
}

