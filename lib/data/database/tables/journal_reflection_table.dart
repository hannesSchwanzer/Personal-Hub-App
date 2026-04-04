import 'package:drift/drift.dart';
// ignore: unused_import
import 'journal_entries_table.dart';

class JournalReflections extends Table {
  TextColumn get id => text()();

  TextColumn get guessedEmotionLevel1 => text().nullable()();
  TextColumn get guessedEmotionLevel2 => text().nullable()();
  TextColumn get guessedEmotionLevel3 => text().nullable()();

  TextColumn get currentEmotionLevel1 => text().nullable()();
  TextColumn get currentEmotionLevel2 => text().nullable()();
  TextColumn get currentEmotionLevel3 => text().nullable()();

  TextColumn get reflection  => text()();

  TextColumn get journalEntryId => text().customConstraint('REFERENCES journal_entries(id) NOT NULL')();

  DateTimeColumn get createdAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}

