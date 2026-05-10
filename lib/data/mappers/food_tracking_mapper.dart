import 'package:personal_hub_app/data/database/app_database.dart';
import 'package:personal_hub_app/domain/entities/food/food_tracking_entity.dart';
import 'package:personal_hub_app/domain/entities/food/nutrition_entity.dart';
import 'package:drift/drift.dart';

/// Maps a [FoodTracking] (Drift row) to a domain [FoodTrackingEntity].
FoodTrackingEntity foodTrackingFromDb(FoodTracking row) {
  return FoodTrackingEntity(
    id: row.id,
    name: row.name,
    nutrition: NutritionEntity.fromJsonString(row.nutritionJson),
    trackedAt: row.trackedAt,
    quantity: row.quantity,
    source: FoodTrackingSource.values[row.source],
    referenceId: row.referenceId,
  );
}

/// Maps a domain [FoodTrackingEntity] to a [FoodTrackingsCompanion] for DB writes.
FoodTrackingsCompanion foodTrackingToDb(FoodTrackingEntity entity) {
  return FoodTrackingsCompanion(
    id: Value(entity.id),
    name: Value(entity.name),
    nutritionJson: Value(entity.nutrition.toJsonString()),
    trackedAt: Value(entity.trackedAt),
    quantity: Value(entity.quantity),
    source: Value(entity.source.index),
    referenceId: Value(entity.referenceId),
  );
}

