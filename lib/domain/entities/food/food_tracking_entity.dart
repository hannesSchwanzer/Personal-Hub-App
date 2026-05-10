import 'package:personal_hub_app/domain/entities/food/nutrition_entity.dart';
import 'package:personal_hub_app/domain/entities/food/unit_type.dart';

enum FoodTrackingSource { recipe, manual, product, generic }

class FoodTrackingEntity {
  final String id;

  final String name;
  final NutritionEntity nutrition;
  final DateTime trackedAt;

  /// The unit of the quantity mentioned in the NutritionEntity, e.g., 'gram', 'ml'.
  final double quantity;

  final FoodTrackingSource source;

  /// The reference ID is the ID of the source entity (e.g., recipe ID, product ID) that this tracking entry is based on. It can be null for manual entries. Product and Generic ids are mangaged by the server, while recipe ids are local.
  final String? referenceId;

  FoodTrackingEntity({
    required this.id,
    required this.name,
    required this.nutrition,
    required this.trackedAt,
    required this.quantity,
    required this.source,
    this.referenceId,
  });

  FoodTrackingEntity copyWith({
    String? id,
    String? name,
    NutritionEntity? nutrition,
    DateTime? trackedAt,
    double? quantity,
    FoodTrackingSource? source,
    String? referenceId,
  }) {
    return FoodTrackingEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      nutrition: nutrition ?? this.nutrition,
      trackedAt: trackedAt ?? this.trackedAt,
      quantity: quantity ?? this.quantity,
      source: source ?? this.source,
      referenceId: referenceId ?? this.referenceId,
    );
  }

  NutritionEntity get totalNutrition {
    if (nutrition.quantityUnit == null || nutrition.perQuantity == null) {
      return nutrition;
    }
    final factor = quantity / nutrition.perQuantity!;
    return NutritionEntity(
      energyKcal: nutrition.energyKcal != null ? nutrition.energyKcal! * factor : null,
      carbohydrates: nutrition.carbohydrates != null ? nutrition.carbohydrates! * factor : null,
      proteins: nutrition.proteins != null ? nutrition.proteins! * factor : null,
      fat: nutrition.fat != null ? nutrition.fat! * factor : null,
      sugars: nutrition.sugars != null ? nutrition.sugars! * factor : null,
      saturatedFat: nutrition.saturatedFat != null ? nutrition.saturatedFat! * factor : null,
      sodium: nutrition.sodium != null ? nutrition.sodium! * factor : null,
      quantityUnit: UnitType.pieces,
      perQuantity: 1, // Total nutrition is for the entire quantity, so perQuantity is set to 1 unit of the quantityUnit
    );
  }
}
