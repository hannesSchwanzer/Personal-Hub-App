import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import 'daos/journal_dao.dart';
import 'daos/journal_reflection_dao.dart';
import 'daos/comms_check_dao.dart';
import 'tables/journal_entries_table.dart';
import 'tables/journal_reflection_table.dart';
import 'tables/comms_check_entries_table.dart';

part 'app_database.g.dart';

@DriftDatabase(
  tables: [JournalEntries, JournalReflections, CommsCheckEntries],
  daos: [JournalDao, JournalReflectionDao, CommsCheckDao],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'app.sqlite'));
    return NativeDatabase(file);
  });
}
