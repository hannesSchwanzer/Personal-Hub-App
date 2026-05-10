// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_tracking_dao.dart';

// ignore_for_file: type=lint
mixin _$FoodTrackingDaoMixin on DatabaseAccessor<AppDatabase> {
  $FoodTrackingsTable get foodTrackings => attachedDatabase.foodTrackings;
  FoodTrackingDaoManager get managers => FoodTrackingDaoManager(this);
}

class FoodTrackingDaoManager {
  final _$FoodTrackingDaoMixin _db;
  FoodTrackingDaoManager(this._db);
  $$FoodTrackingsTableTableManager get foodTrackings =>
      $$FoodTrackingsTableTableManager(_db.attachedDatabase, _db.foodTrackings);
}
