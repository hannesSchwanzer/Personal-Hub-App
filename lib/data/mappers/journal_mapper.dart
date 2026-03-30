import 'package:drift/drift.dart';
import 'package:personal_hub_app/data/database/app_database.dart';
import 'package:personal_hub_app/domain/entities/journal_entry_entity.dart';

extension JournalMapper on JournalEntry {
  JournalEntryEntity toEntity() {
    return JournalEntryEntity(
      id: id,
      emotionLevel1: emotionLevel1,
      emotionLevel2: emotionLevel2,
      emotionLevel3: emotionLevel3,
      entry: entry,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}

extension JournalEntityMapper on JournalEntryEntity {
  JournalEntriesCompanion toCompanion() {
    return JournalEntriesCompanion(
      id: Value(id),
      emotionLevel1: Value(emotionLevel1),
      emotionLevel2: Value(emotionLevel2),
      emotionLevel3: Value(emotionLevel3),
      entry: Value(entry),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }
}
