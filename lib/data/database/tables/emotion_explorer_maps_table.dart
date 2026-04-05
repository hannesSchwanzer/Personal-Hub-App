import 'package:drift/drift.dart';

class EmotionExplorerMaps extends Table {
  IntColumn get id => integer()();
  TextColumn get data => text()();

  @override
  Set<Column> get primaryKey => {id};
}
