import 'package:drift/drift.dart';

class Recipes extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get description => text().nullable()();
  IntColumn get servings => integer()();
  IntColumn get cookingTimeMinutes => integer()();
  IntColumn get preparationTimeMinutes => integer()();
  TextColumn get nutritionInfoJson => text()();
  TextColumn get imageUrl => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

