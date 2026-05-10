import 'package:personal_hub_app/domain/entities/food/food_tracking_entity.dart';
import 'package:personal_hub_app/data/database/daos/food_tracking_dao.dart';
import 'package:personal_hub_app/data/mappers/food_tracking_mapper.dart';
import 'package:personal_hub_app/domain/repositories/food_tracking_repository.dart';
import 'package:uuid/uuid.dart';

/// Implements [FoodTrackingRepository] using Drift and the provided DAO.
class FoodTrackingRepositoryImpl implements FoodTrackingRepository {
  final FoodTrackingDao _dao;

  FoodTrackingRepositoryImpl({required FoodTrackingDao dao}) : _dao = dao;

  @override
  Future<FoodTrackingEntity?> getFoodTracking(String id) async {
    final row = await _dao.getFoodTracking(id);
    return row == null ? null : foodTrackingFromDb(row);
  }

  @override
  Future<List<FoodTrackingEntity>> getAllFoodTrackings() async {
    final rows = await _dao.getAllFoodTrackings();
    return rows.map((row) => foodTrackingFromDb(row)).toList();
  }

  @override
  Stream<List<FoodTrackingEntity>> watchAllFoodTrackings() {
    return _dao.watchAllFoodTrackings().map((rows) => rows.map((row) => foodTrackingFromDb(row)).toList());
  }

  @override
  Future<void> insertFoodTracking(FoodTrackingEntity entity) async {
    final id = entity.id.isEmpty ? const Uuid().v4() : entity.id;
    final now = DateTime.now();
    await _dao.insertFoodTracking(
      foodTrackingToDb(
        entity.copyWith(id: id, trackedAt: now),
      ),
    );
  }

  @override
  Future<void> updateFoodTracking(FoodTrackingEntity entity) async {
    await _dao.updateFoodTracking(foodTrackingToDb(entity));
  }

  @override
  Future<void> deleteFoodTracking(String id) async {
    await _dao.deleteFoodTracking(id);
  }

  @override
  Stream<List<FoodTrackingEntity>> watchFoodTrackingsForDate(DateTime date) {
    return _dao.watchFoodTrackingsForDate(date)
      .map((rows) => rows.map((row) => foodTrackingFromDb(row)).toList());
  }

  @override
  Future<List<FoodTrackingEntity>> getFoodTrackingsForDate(DateTime date) async {
    final rows = await _dao.getFoodTrackingsForDate(date);
    return rows.map((row) => foodTrackingFromDb(row)).toList();
  }
}

