import 'package:drift/drift.dart';
import '../app_database.dart';
import '../tables/emotion_explorer_maps_table.dart';

part 'emotion_explorer_map_dao.g.dart';

@DriftAccessor(tables: [EmotionExplorerMaps])
class EmotionExplorerMapDao extends DatabaseAccessor<AppDatabase> with _$EmotionExplorerMapDaoMixin {
  EmotionExplorerMapDao(super.attachedDatabase);

  Future<EmotionExplorerMap?> getMap() async {
    return await (select(emotionExplorerMaps)..limit(1)).getSingleOrNull();
  }

  Stream<EmotionExplorerMap?> watchMap() {
    return (select(emotionExplorerMaps)..limit(1)).watchSingleOrNull();
  }

  Future<void> upsertMap(String json) async {
    // Enforces only one row, always uses id 1
    await into(emotionExplorerMaps).insertOnConflictUpdate(
      EmotionExplorerMapsCompanion(
        id: const Value(1),
        data: Value(json),
      ),
    );
  }

  Future<void> clearMap() async {
    await delete(emotionExplorerMaps).go();
  }
}

