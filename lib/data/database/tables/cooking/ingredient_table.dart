import 'package:drift/drift.dart';
import 'package:personal_hub_app/data/database/tables/cooking/recipe_table.dart';

class Ingredients extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get recipeId => text().references(Recipes, #id, onDelete: KeyAction.cascade)();
  TextColumn get name => text()();
  RealColumn get quantity => real()();
  TextColumn get unit => text()();
}

