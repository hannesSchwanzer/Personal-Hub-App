import 'package:drift/drift.dart';

class CommsCheckEntries extends Table {
  TextColumn get id => text()();

  TextColumn get targetInfos => text()();
  TextColumn get message => text()();

  TextColumn get feelingLevel1Id => text().nullable()();
  TextColumn get feelingLevel2Id => text().nullable()();
  TextColumn get feelingLevel3Id => text().nullable()();

  TextColumn get expectedReaction => text()();
  TextColumn get wantedReaction => text()();
  TextColumn get responseAfterReaction => text()();
  TextColumn get reflection => text()();

  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}

