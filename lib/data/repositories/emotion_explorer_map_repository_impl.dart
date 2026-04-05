import 'package:personal_hub_app/data/database/daos/emotion_explorer_map_dao.dart';
import 'package:personal_hub_app/data/mappers/emotion_explorer_map_mapper.dart';
import 'package:personal_hub_app/domain/entities/emotion_explorer_map_entity.dart';
import 'package:personal_hub_app/domain/repositories/emotion_explorer_map_repository.dart';

class EmotionExplorerMapRepositoryImpl implements EmotionExplorerMapRepository {
  final EmotionExplorerMapDao dao;

  EmotionExplorerMapRepositoryImpl(this.dao);

  @override
  Future<EmotionExplorerMapEntity?> getMap() async {
    final row = await dao.getMap();
    return row?.toEntity();
  }

  @override
  Stream<EmotionExplorerMapEntity?> watchMap() {
    return dao.watchMap().map((row) => row?.toEntity());
  }

  @override
  Future<void> upsertMap(EmotionExplorerMapEntity entity) {
    return dao.upsertMap(entity.toJson());
  }

  @override
  Future<void> clearMap() {
    return dao.clearMap();
  }
}

