import 'package:drift/drift.dart';
import '../app_database.dart';
import '../tables/journal_entries_table.dart';

part 'journal_dao.g.dart';

@DriftAccessor(tables: [JournalEntries])
class JournalDao extends DatabaseAccessor<AppDatabase> with _$JournalDaoMixin {
  JournalDao(super.attachedDatabase);

  /// Insert a new journal entry
  Future<void> insertEntry(JournalEntriesCompanion entry) {
    return into(journalEntries).insert(entry);
  }

  /// Watch all entries reactively
  Stream<List<JournalEntry>> watchAll() {
    return select(journalEntries).watch();
  }

  /// Delete an entry by ID
  Future<void> deleteEntry(String id) {
    return (delete(journalEntries)..where((t) => t.id.equals(id))).go();
  }
}
