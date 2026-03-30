import 'package:personal_hub_app/data/database/daos/journal_dao.dart';
import 'package:personal_hub_app/data/mappers/journal_mapper.dart';
import 'package:personal_hub_app/domain/entities/journal_entry_entity.dart';
import 'package:personal_hub_app/domain/repositories/journal_entry_repository.dart';

class JournalEntryReporsitoryImpl implements JournalEntryRepository {
  final JournalDao journalDao;

  JournalEntryReporsitoryImpl(this.journalDao);

  @override
  Future<void> insertEntry(JournalEntryEntity entry) {
    return journalDao.insertEntry(entry.toCompanion());
  }

  @override
  Stream<List<JournalEntryEntity>> watchAllEntries() {
    return journalDao.watchAll().map(
      (entries) => entries.map((entry) => entry.toEntity()).toList(),
    );
  }
}
