import 'package:drift/drift.dart';
import '../app_database.dart';
import '../tables/journal_reflection_table.dart';

part 'journal_reflection_dao.g.dart';

@DriftAccessor(tables: [JournalReflections])
class JournalReflectionDao extends DatabaseAccessor<AppDatabase> with _$JournalReflectionDaoMixin {
  JournalReflectionDao(super.attachedDatabase);

  Future<void> insertReflection(JournalReflectionsCompanion reflection) {
    return into(journalReflections).insert(reflection);
  }

  Stream<List<JournalReflection>> watchAll() {
    return select(journalReflections).watch();
  }

  Stream<List<JournalReflection>> watchByJournalEntryId(String entryId) {
    return (select(journalReflections)..where((tbl) => tbl.journalEntryId.equals(entryId))).watch();
  }

  Future<List<JournalReflection>> getByJournalEntryId(String entryId) {
    return (select(journalReflections)..where((tbl) => tbl.journalEntryId.equals(entryId))).get();
  }
}
