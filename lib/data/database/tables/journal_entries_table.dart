import 'package:drift/drift.dart';

class JournalEntries extends Table {
  TextColumn get id => text()(); // Use UUID for unique ID

  TextColumn get emotionLevel1 => text().nullable()();
  TextColumn get emotionLevel2 => text().nullable()();
  TextColumn get emotionLevel3 => text().nullable()();

  TextColumn get text => text()();

  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}
