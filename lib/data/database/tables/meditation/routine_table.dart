import 'package:drift/drift.dart';

class Routines extends Table {
  TextColumn get id => text()();

  TextColumn get name => text()();
  TextColumn get description => text().nullable()();
  BoolColumn get visible => boolean().withDefault(const Constant(true))();

  @override
  Set<Column> get primaryKey => {id};
}

