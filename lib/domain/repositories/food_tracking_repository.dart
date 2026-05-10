import 'package:personal_hub_app/domain/entities/food/food_tracking_entity.dart';

/// Abstract repository for food tracking operations.
abstract class FoodTrackingRepository {
  /// Retrieves a single food tracking entry by its [id].
  Future<FoodTrackingEntity?> getFoodTracking(String id);

  /// Retrieves all food tracking entries.
  Future<List<FoodTrackingEntity>> getAllFoodTrackings();

  /// Watches all food tracking entries as a stream, emitting updates whenever data changes.
  Stream<List<FoodTrackingEntity>> watchAllFoodTrackings();

  /// Retrieves all food tracking entries for the specified date (local time).
  Future<List<FoodTrackingEntity>> getFoodTrackingsForDate(DateTime date);

  /// Watches food tracking entries for the specified date (local time).
  Stream<List<FoodTrackingEntity>> watchFoodTrackingsForDate(DateTime date);

  /// Inserts a new food tracking entry.
  Future<void> insertFoodTracking(FoodTrackingEntity entity);

  /// Updates an existing food tracking entry.
  Future<void> updateFoodTracking(FoodTrackingEntity entity);

  /// Deletes a food tracking entry by its [id].
  Future<void> deleteFoodTracking(String id);
}

