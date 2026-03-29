import '../../domain/models/journal_entry.dart';
import '../database/tables/journal_entries_table.dart';

JournalEntry mapToDomain(JournalEntriesData row) {
  return JournalEntry(
    id: row.id,
    emotionLevel1: row.emotionLevel1,
    emotionLevel2: row.emotionLevel2,
    emotionLevel3: row.emotionLevel3,
    text: row.text,
    createdAt: row.createdAt,
    updatedAt: row.updatedAt,
  );
}
