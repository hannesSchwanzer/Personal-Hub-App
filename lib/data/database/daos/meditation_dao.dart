import 'package:drift/drift.dart';
import '../app_database.dart';
import '../tables/meditation_table.dart';

part 'meditation_dao.g.dart';

@DriftAccessor(tables: [Meditations])
class MeditationDao extends DatabaseAccessor<AppDatabase> with _$MeditationDaoMixin {
  MeditationDao(super.attachedDatabase);

  /// Insert a new meditation entry
  Future<void> insertEntry(MeditationsCompanion entry) {
    return into(meditations).insert(entry);
  }

  /// Watch all entries reactively
  Stream<List<Meditation>> watchAll() {
    return select(meditations).watch();
  }

  /// Delete an entry by ID
  Future<void> deleteEntry(String id) {
    return (delete(meditations)..where((t) => t.id.equals(id))).go();
  }

  Future<List<Meditation>> getAllEntries() {
    return select(meditations).get();
  }

  Future<void> updateEntry(MeditationsCompanion entry) {
    return update(meditations).replace(entry);
  }

  Future<void> deleteAllEntries() {
    return delete(meditations).go();
  }
}
