import 'package:drift/drift.dart';

/// Represents a tracked food entry (meal, ingredient, product, manual, etc).
class FoodTrackings extends Table {
  /// Unique ID for this food tracking entry.
  TextColumn get id => text()();

  /// The display name of the tracked food.
  TextColumn get name => text()();

  /// Nutrition info is stored as a JSON string, matching NutritionEntity spec. Use mappers for (de)serialization.
  TextColumn get nutritionJson => text()();

  /// The amount in the unit below (see documentation of NutritionEntity's base quantity unit).
  RealColumn get quantity => real()();

  /// The source: 0=recipe, 1=manual, 2=product, 3=generic
  IntColumn get source => integer()();

  /// The reference id (recipe/product/generic id). Allow null for manual entries. Uuid or server id.
  TextColumn get referenceId => text().nullable()();

  /// The timestamp when this food was tracked.
  DateTimeColumn get trackedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}

