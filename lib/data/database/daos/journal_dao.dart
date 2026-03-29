import 'package:drift/drift.dart';
import '../app_database.dart';

part 'journal_dao.g.dart';

@DriftAccessor(tables: [JournalEntries])
class JournalDao extends DatabaseAccessor<AppDatabase> with _$JournalDaoMixin {
  JournalDao(AppDatabase db) : super(db);

  /// Insert a new journal entry
  Future<void> insertEntry(JournalEntriesCompanion entry) {
    return into(journalEntries).insert(entry);
  }

  /// Watch all entries reactively
  Stream<List<JournalEntry>> watchAll() {
    return select(journalEntries).watch().map(
      (rows) => rows.map((row) => JournalEntry(
        id: row.id,
        emotionLevel1: row.emotionLevel1,
        emotionLevel2: row.emotionLevel2,
        emotionLevel3: row.emotionLevel3,
        text: row.text,
        createdAt: row.createdAt,
        updatedAt: row.updatedAt,
      )).toList(),
    );
  }

  /// Delete an entry by ID
  Future<void> deleteEntry(String id) {
    return (delete(journalEntries)..where((t) => t.id.equals(id))).go();
  }
}
