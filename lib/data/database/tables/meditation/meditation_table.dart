import 'package:drift/drift.dart';

class Meditations extends Table {
  TextColumn get id => text()();

  BoolColumn get favorite => boolean()();
  TextColumn get title => text()();
  TextColumn get description => text()();

  TextColumn get type => text()();
  TextColumn get chakraType => text().nullable()();
  TextColumn get cognitiveType => text()();
  TextColumn get level => text()();

  TextColumn get audioSections => text()();

  TextColumn get tutorialVideoPath => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
