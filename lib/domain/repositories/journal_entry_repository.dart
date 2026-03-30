import '../entities/journal_entry_entity.dart';

abstract class JournalEntryRepository {
    Future<void> insertEntry(JournalEntryEntity entry);
    Stream<List<JournalEntryEntity>> watchAllEntries();
}
