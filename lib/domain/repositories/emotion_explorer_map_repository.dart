import 'package:personal_hub_app/domain/entities/emotion_explorer_map_entity.dart';

abstract class EmotionExplorerMapRepository {
  Future<EmotionExplorerMapEntity?> getMap();
  Stream<EmotionExplorerMapEntity?> watchMap();
  Future<void> upsertMap(EmotionExplorerMapEntity entity);
  Future<void> clearMap();
}

