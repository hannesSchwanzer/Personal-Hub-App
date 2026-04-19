import 'package:flutter/material.dart';
import 'package:personal_hub_app/domain/entities/cooking/recipe_entity.dart';
import 'ingredient_tile.dart';

/// Widget for editing the list of ingredients, supporting recommendations and dropdown for units.
class IngredientsEditor extends StatefulWidget {
  final List<IngredientEntity> initialIngredients;
  final ValueChanged<List<IngredientEntity>> onIngredientsChanged;
  final List<String> ingredientNameRecommendations;

  const IngredientsEditor({
    super.key,
    required this.initialIngredients,
    required this.onIngredientsChanged,
    required this.ingredientNameRecommendations,
  });

  @override
  State<IngredientsEditor> createState() => _IngredientsEditorState();
}

class _IngredientsEditorState extends State<IngredientsEditor> {
  late List<IngredientEntity> _ingredients;

  @override
  void initState() {
    super.initState();
    _ingredients = List.of(widget.initialIngredients);
  }

  void _addIngredient() {
    setState(() {
      _ingredients.add(
        IngredientEntity(name: '', quantity: 1, unit: UnitType.pieces),
      );
      widget.onIngredientsChanged(_ingredients);
    });
  }

  void _removeIngredient(int index) {
    setState(() {
      _ingredients.removeAt(index);
      widget.onIngredientsChanged(_ingredients);
    });
  }

  void _onChanged(int idx, IngredientEntity updated) {
    setState(() {
      _ingredients[idx] = updated;
      widget.onIngredientsChanged(_ingredients);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Ingredients',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        ..._ingredients
            .asMap()
            .map(
              (i, ing) => MapEntry(
                i,
                IngredientTile(
                  ingredient: ing,
                  onChanged: (upd) => _onChanged(i, upd),
                  onRemove: () => _removeIngredient(i),
                  ingredientNameRecommendations:
                      widget.ingredientNameRecommendations,
                ),
              ),
            )
            .values,
        ElevatedButton.icon(
          onPressed: _addIngredient,
          icon: const Icon(Icons.add),
          label: const Text('Add Ingredient'),
        ),
      ],
    );
  }
}

