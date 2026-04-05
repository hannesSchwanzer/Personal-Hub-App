import 'package:personal_hub_app/data/database/daos/comms_check_dao.dart';
import 'package:personal_hub_app/data/mappers/comms_check_mapper.dart';
import 'package:personal_hub_app/domain/entities/comms_check_entry_entity.dart';
import 'package:personal_hub_app/domain/repositories/comms_check_entry_repository.dart';
import 'package:uuid/uuid.dart';

class CommsCheckEntryRepositoryImpl implements CommsCheckEntryRepository {
  final CommsCheckDao commsCheckDao;
  final _uuid = const Uuid();

  CommsCheckEntryRepositoryImpl(this.commsCheckDao);

  @override
  Stream<List<CommsCheckEntryEntity>> watchAllEntries() {
    return commsCheckDao.watchAll().map(
      (entries) => entries.map((entry) => entry.toEntity()).toList(),
    );
  }

  @override
  Future<void> createEntry({
    required String targetInfos,
    required String message,
    String? feelingLevel1Id,
    String? feelingLevel2Id,
    String? feelingLevel3Id,
    required String expectedReaction,
    required String wantedReaction,
    required String responseAfterReaction,
    required String reflection,
  }) {
    final now = DateTime.now();
    final newEntry = CommsCheckEntryEntity.create(
      id: _uuid.v4(),
      targetInfos: targetInfos,
      message: message,
      feelingLevel1Id: feelingLevel1Id,
      feelingLevel2Id: feelingLevel2Id,
      feelingLevel3Id: feelingLevel3Id,
      expectedReaction: expectedReaction,
      wantedReaction: wantedReaction,
      responseAfterReaction: responseAfterReaction,
      reflection: reflection,
      now: now,
    );
    return commsCheckDao.insertEntry(newEntry.toCompanion());
  }

  @override
  Future<void> deleteEntry(String entryId) {
    return commsCheckDao.deleteEntry(entryId);
  }

  @override
  Future<List<CommsCheckEntryEntity>> getAllEntries() {
    return commsCheckDao.getAllEntries().then(
      (entries) => entries.map((entry) => entry.toEntity()).toList(),
    );
  }
}

