import 'package:personal_hub_app/domain/entities/comms_check_entry_entity.dart';

abstract class CommsCheckEntryRepository {
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
  });

  Stream<List<CommsCheckEntryEntity>> watchAllEntries();

  Future<List<CommsCheckEntryEntity>> getAllEntries();

  Future<void> deleteEntry(String entryId);
}

