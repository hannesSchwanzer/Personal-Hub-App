import 'package:drift/drift.dart';
import 'package:personal_hub_app/data/database/app_database.dart';
import 'package:personal_hub_app/domain/entities/comms_check_entry_entity.dart';

extension CommsCheckMapper on CommsCheckEntry {
  CommsCheckEntryEntity toEntity() {
    return CommsCheckEntryEntity(
      id: id,
      targetInfos: targetInfos,
      message: message,
      feelingLevel1Id: feelingLevel1Id,
      feelingLevel2Id: feelingLevel2Id,
      feelingLevel3Id: feelingLevel3Id,
      expectedReaction: expectedReaction,
      wantedReaction: wantedReaction,
      responseAfterReaction: responseAfterReaction,
      reflection: reflection,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}

extension CommsCheckEntityMapper on CommsCheckEntryEntity {
  CommsCheckEntriesCompanion toCompanion() {
    return CommsCheckEntriesCompanion(
      id: Value(id),
      targetInfos: Value(targetInfos),
      message: Value(message),
      feelingLevel1Id: Value(feelingLevel1Id),
      feelingLevel2Id: Value(feelingLevel2Id),
      feelingLevel3Id: Value(feelingLevel3Id),
      expectedReaction: Value(expectedReaction),
      wantedReaction: Value(wantedReaction),
      responseAfterReaction: Value(responseAfterReaction),
      reflection: Value(reflection),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }
}

