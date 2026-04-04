import 'package:personal_hub_app/data/database/daos/journal_dao.dart';
import 'package:personal_hub_app/data/mappers/journal_mapper.dart';
import 'package:personal_hub_app/domain/entities/body_map_drawing.dart';
import 'package:personal_hub_app/domain/entities/journal_entry_entity.dart';
import 'package:personal_hub_app/domain/repositories/journal_entry_repository.dart';
import 'package:uuid/uuid.dart';

class JournalEntryReporsitoryImpl implements JournalEntryRepository {
  final JournalDao journalDao;
  final _uuid = const Uuid();

  JournalEntryReporsitoryImpl(this.journalDao);

  @override
  Stream<List<JournalEntryEntity>> watchAllEntries() {
    return journalDao.watchAll().map(
      (entries) => entries.map((entry) => entry.toEntity()).toList(),
    );
  }

  @override
  Future<void> createEntry({
    required String entry,
    String? emotionLevel1,
    String? emotionLevel2,
    String? emotionLevel3,
    BodyMapDrawing? bodyMapDrawing,
  }) {
    final now = DateTime.now();
    final newEntry = JournalEntryEntity.create(
      id: _uuid.v4(),
      entry: entry,
      emotionLevel1: emotionLevel1,
      emotionLevel2: emotionLevel2,
      emotionLevel3: emotionLevel3,
      now: now,
      bodyMapDrawing: bodyMapDrawing,
    );
    return journalDao.insertEntry(newEntry.toCompanion());
  }

  @override
  Future<void> deleteEntry(String entryId) {
    return journalDao.deleteEntry(entryId);
  }

  @override
  Future<List<JournalEntryEntity>> getAllEntries() {
    return journalDao.getAllEntries().then(
          (entries) => entries.map((entry) => entry.toEntity()).toList(),
        );
  }
}
