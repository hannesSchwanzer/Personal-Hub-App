import 'package:drift/drift.dart';
import 'package:personal_hub_app/data/database/tables/cooking/recipe_table.dart';

class Steps extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get recipeId => text().references(Recipes, #id, onDelete: KeyAction.cascade)();
  IntColumn get position => integer()();
  TextColumn get instruction => text()();
  TextColumn get imageUrl => text().nullable()();
}

