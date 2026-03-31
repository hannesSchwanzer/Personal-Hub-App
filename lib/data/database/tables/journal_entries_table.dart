import 'package:drift/drift.dart';

class JournalEntries extends Table {
  TextColumn get id => text()();

  TextColumn get emotionLevel1 => text().nullable()();
  TextColumn get emotionLevel2 => text().nullable()();
  TextColumn get emotionLevel3 => text().nullable()();

  TextColumn get entry  => text()();

  TextColumn get bodyMapDrawing => text().nullable()();

  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}
