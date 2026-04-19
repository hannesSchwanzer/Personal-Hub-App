import 'package:drift/drift.dart';

/// Many-to-many relationship: which tags are attached to which recipes.
class RecipeTags extends Table {
  TextColumn get recipeId => text()(); // FK to RecipeTable.id
  TextColumn get tag => text()(); // FK to TagTable.tag

  @override
  Set<Column> get primaryKey => {recipeId, tag};
}

