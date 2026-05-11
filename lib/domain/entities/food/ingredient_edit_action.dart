import 'package:personal_hub_app/domain/entities/food/recipe_entity.dart';

/// IngredientEditAction defines all possible ingredient mutation intents for RecipeEntity.
/// Supports batch modification scenarios and preserves business logic in one place.
abstract class IngredientEditAction {
  const IngredientEditAction();
}

class AddIngredient extends IngredientEditAction {
  final IngredientEntity ingredient;
  const AddIngredient(this.ingredient);
}

class RenameIngredient extends IngredientEditAction {
  final String oldName;
  final String newName;
  const RenameIngredient(this.oldName, this.newName);
}

class RemoveIngredient extends IngredientEditAction {
  final String name;
  const RemoveIngredient(this.name);
}

