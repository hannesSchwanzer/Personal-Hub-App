import 'package:drift/drift.dart';
import '../app_database.dart';
import '../tables/comms_check_entries_table.dart';

part 'comms_check_dao.g.dart';

@DriftAccessor(tables: [CommsCheckEntries])
class CommsCheckDao extends DatabaseAccessor<AppDatabase> with _$CommsCheckDaoMixin {
  CommsCheckDao(super.attachedDatabase);

  /// Insert a new comms check entry
  Future<void> insertEntry(CommsCheckEntriesCompanion entry) {
    return into(commsCheckEntries).insert(entry);
  }

  /// Watch all entries reactively
  Stream<List<CommsCheckEntry>> watchAll() {
    return select(commsCheckEntries).watch();
  }

  /// Delete an entry by ID
  Future<void> deleteEntry(String id) {
    return (delete(commsCheckEntries)..where((t) => t.id.equals(id))).go();
  }

  Future<List<CommsCheckEntry>> getAllEntries() {
    return select(commsCheckEntries).get();
  }
}

