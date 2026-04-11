import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:personal_hub_app/data/database/daos/emotion_explorer_map_dao.dart';
import 'package:personal_hub_app/data/database/tables/emotion_explorer_maps_table.dart';

import 'daos/journal_dao.dart';
import 'daos/journal_reflection_dao.dart';
import 'daos/comms_check_dao.dart';
import 'daos/meditation_dao.dart';
import 'tables/journal_entries_table.dart';
import 'tables/journal_reflection_table.dart';
import 'tables/comms_check_entries_table.dart';
import 'tables/meditation_table.dart';

part 'app_database.g.dart';

@DriftDatabase(
  tables: [JournalEntries, JournalReflections, CommsCheckEntries, EmotionExplorerMaps, Meditations],
  daos: [JournalDao, JournalReflectionDao, CommsCheckDao, EmotionExplorerMapDao, MeditationDao],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 2;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onUpgrade: (migrator, from, to) async {
      if (from == 1 && to == 2) {
        await migrator.createTable(emotionExplorerMaps);
      } 
      if (from == 2 && to == 3) {
        await migrator.createTable(meditations);
      }
    },
  );
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'app.sqlite'));
    return NativeDatabase(file);
  });
}
