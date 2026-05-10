import 'package:drift/drift.dart';
import 'package:personal_hub_app/data/database/app_database.dart';
import 'package:personal_hub_app/data/database/tables/food_tracking_table.dart';

part 'food_tracking_dao.g.dart';

/// DAO for managing food tracking entries in the app database.
@DriftAccessor(tables: [FoodTrackings])
class FoodTrackingDao extends DatabaseAccessor<AppDatabase>
    with _$FoodTrackingDaoMixin {
  FoodTrackingDao(super.db);

  /// Insert a new food tracking entry (trackedAt must be set in the companion).
  Future<void> insertFoodTracking(FoodTrackingsCompanion entry) async {
    await into(foodTrackings).insert(entry, mode: InsertMode.insertOrReplace);
  }

  /// Update a food tracking entry.
  Future<void> updateFoodTracking(FoodTrackingsCompanion entry) async {
    await update(foodTrackings).replace(entry);
  }

  /// Delete a food tracking entry by ID.
  Future<void> deleteFoodTracking(String id) async {
    await (delete(foodTrackings)..where((tbl) => tbl.id.equals(id))).go();
  }

  /// Retrieve a single food tracking entry by ID.
  Future<FoodTracking?> getFoodTracking(String id) async {
    return (select(foodTrackings)..where((tbl) => tbl.id.equals(id))).getSingleOrNull();
  }

  /// Retrieve all food tracking entries.
  Future<List<FoodTracking>> getAllFoodTrackings() async {
    return select(foodTrackings).get();
  }

  /// Watch all food tracking entries in real-time.
  Stream<List<FoodTracking>> watchAllFoodTrackings() {
    return select(foodTrackings).watch();
  }

  /// Retrieve all food tracking entries for the specified tracked day (local time).
  Future<List<FoodTracking>> getFoodTrackingsForDate(DateTime date) async {
    final start = DateTime(date.year, date.month, date.day);
    final end = start.add(const Duration(days: 1));
    return (select(foodTrackings)
      ..where((tbl) => tbl.trackedAt.isBiggerOrEqualValue(start) & tbl.trackedAt.isSmallerThanValue(end)))
      .get();
  }

  /// Watch all food tracking entries for the specified tracked day (local time).
  Stream<List<FoodTracking>> watchFoodTrackingsForDate(DateTime date) {
    final start = DateTime(date.year, date.month, date.day);
    final end = start.add(const Duration(days: 1));
    return (select(foodTrackings)
      ..where((tbl) => tbl.trackedAt.isBiggerOrEqualValue(start) & tbl.trackedAt.isSmallerThanValue(end)))
      .watch();
  }
}

