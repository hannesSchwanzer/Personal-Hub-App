import 'package:personal_hub_app/domain/entities/food/nutrition_entity.dart';

/// Passes food selection details from selector widgets to the add screen.
class FoodSelection {
  final String name;
  final NutritionEntity nutrition;
  final Object? originalEntity; // original food, product, or recipe entity, if any
  const FoodSelection({
    required this.name,
    required this.nutrition,
    this.originalEntity,
  });
}

