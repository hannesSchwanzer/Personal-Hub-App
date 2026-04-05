// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'emotion_explorer_map_dao.dart';

// ignore_for_file: type=lint
mixin _$EmotionExplorerMapDaoMixin on DatabaseAccessor<AppDatabase> {
  $EmotionExplorerMapsTable get emotionExplorerMaps =>
      attachedDatabase.emotionExplorerMaps;
  EmotionExplorerMapDaoManager get managers =>
      EmotionExplorerMapDaoManager(this);
}

class EmotionExplorerMapDaoManager {
  final _$EmotionExplorerMapDaoMixin _db;
  EmotionExplorerMapDaoManager(this._db);
  $$EmotionExplorerMapsTableTableManager get emotionExplorerMaps =>
      $$EmotionExplorerMapsTableTableManager(
        _db.attachedDatabase,
        _db.emotionExplorerMaps,
      );
}
