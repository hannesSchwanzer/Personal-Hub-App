import 'package:drift/drift.dart';

/// Unique tags for recipes.
class Tags extends Table {
  TextColumn get tag => text()();

  @override
  Set<Column> get primaryKey => {tag};
}

