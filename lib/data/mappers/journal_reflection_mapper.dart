import 'package:drift/drift.dart';

import 'package:personal_hub_app/data/database/app_database.dart';
import 'package:personal_hub_app/domain/entities/journal_reflection.dart';

extension JournalReflectionMapper on JournalReflection {
  JournalReflectionEntity toEntity() {
    return JournalReflectionEntity(
      id: id,
      guessedEmotionLevel1: guessedEmotionLevel1,
      guessedEmotionLevel2: guessedEmotionLevel2,
      guessedEmotionLevel3: guessedEmotionLevel3,
      currentEmotionLevel1: currentEmotionLevel1,
      currentEmotionLevel2: currentEmotionLevel2,
      currentEmotionLevel3: currentEmotionLevel3,
      reflection: reflection,
      journalEntryId: journalEntryId,
      createdAt: createdAt,
    );
  }
}

extension JournalReflectionEntityMapper on JournalReflectionEntity {
  JournalReflectionsCompanion toCompanion() {
    return JournalReflectionsCompanion(
      id: Value(id),
      guessedEmotionLevel1: Value(guessedEmotionLevel1),
      guessedEmotionLevel2: Value(guessedEmotionLevel2),
      guessedEmotionLevel3: Value(guessedEmotionLevel3),
      currentEmotionLevel1: Value(currentEmotionLevel1),
      currentEmotionLevel2: Value(currentEmotionLevel2),
      currentEmotionLevel3: Value(currentEmotionLevel3),
      reflection: Value(reflection),
      journalEntryId: Value(journalEntryId),
      createdAt: Value(createdAt),
    );
  }
}
