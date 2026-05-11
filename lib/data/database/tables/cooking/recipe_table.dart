import 'package:drift/drift.dart';

/// Table for storing Recipe objects as JSON blobs. Only `id` is used for lookup,
/// all other fields are in the JSON string, handled by the mappers/DAOs.
/// Table for storing Recipes. Simple fields are stored in their own columns.
/// Nested collections or objects are stored as JSON-encoded text columns handled in the mappers/DAOs.
class Recipes extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get description => text()();
  TextColumn get imagePath => text()();
  IntColumn get servings => integer()();
  TextColumn get ingredientsJson => text()(); // List<IngredientEntity> as JSON
  TextColumn get stepsJson => text()();      // List<StepEntity> as JSON
  TextColumn get nutritionJson => text()(); // NutritionEntity as JSON
  TextColumn get durationJson => text()();      // DurationEntity as JSON

  @override
  Set<Column> get primaryKey => {id};
}

