import 'package:drift/drift.dart';
import 'package:personal_hub_app/data/database/tables/cooking/step_table.dart';

class StepIngredients extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get stepId => integer().references(Steps, #id, onDelete: KeyAction.cascade)();
  TextColumn get name => text()();
  RealColumn get quantityPercent => real()();
}

