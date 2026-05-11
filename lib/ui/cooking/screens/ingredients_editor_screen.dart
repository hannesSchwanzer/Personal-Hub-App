import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:personal_hub_app/domain/entities/food/recipe_entity.dart';
import 'package:personal_hub_app/domain/entities/food/unit_type.dart';
import 'package:personal_hub_app/ui/cooking/widgets/ingredient_tile.dart';

class IngredientsEditorScreen extends ConsumerStatefulWidget {
  final RecipeEntity recipe;

  const IngredientsEditorScreen({
    super.key,
    required this.recipe,
  });

  @override
  ConsumerState<IngredientsEditorScreen> createState() =>
      _IngredientsEditorScreenState();
}

class _IngredientsEditorScreenState
    extends ConsumerState<IngredientsEditorScreen> {
  late RecipeEntity _recipe;

  @override
  void initState() {
    super.initState();

    _recipe = widget.recipe.copyWith(
      ingredients: List<IngredientEntity>.from(widget.recipe.ingredients),
      steps: List<StepEntity>.from(widget.recipe.steps),
    );
  }

  void _done() {
    Navigator.of(context).pop(_recipe);
  }

  void _addIngredient() {
    setState(() {
      _recipe = _recipe.addIngredient(
        IngredientEntity(
          name: '',
          quantity: 1,
          unit: UnitType.pieces,
        ),
      );
    });
  }

  void _removeIngredient(int index) {
    final ingredient = _recipe.ingredients[index];

    setState(() {
      _recipe = _recipe.removeIngredient(ingredient.name);
    });
  }

  void _updateIngredient(
    int index,
    IngredientEntity updated,
  ) {
    final currentIngredient = _recipe.ingredients[index];

    RecipeEntity updatedRecipe = _recipe;

    // Rename everywhere (ingredients + step references)
    if (currentIngredient.name != updated.name) {
      updatedRecipe = updatedRecipe.renameIngredient(
        currentIngredient.name,
        updated.name,
      );
    }

    // Update quantity/unit in ingredients list
    final updatedIngredients =
        List<IngredientEntity>.from(updatedRecipe.ingredients);

    final ingredientIndex = updatedIngredients.indexWhere(
      (e) => e.name == updated.name,
    );

    if (ingredientIndex != -1) {
      updatedIngredients[ingredientIndex] = updated;
    }

    setState(() {
      _recipe = updatedRecipe.copyWith(
        ingredients: updatedIngredients,
      );
    });
  }

  void _reorderIngredients(int oldIndex, int newIndex) {
    setState(() {
      if (newIndex > oldIndex) {
        newIndex--;
      }

      final updatedIngredients =
          List<IngredientEntity>.from(_recipe.ingredients);

      final item = updatedIngredients.removeAt(oldIndex);

      updatedIngredients.insert(newIndex, item);

      _recipe = _recipe.copyWith(
        ingredients: updatedIngredients,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final ingredients = _recipe.ingredients;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Edit Ingredients'),
        actions: [
          TextButton(
            onPressed: _done,
            child: const Text('Done'),
          ),
        ],
      ),
      body: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () => FocusScope.of(context).unfocus(),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: ReorderableListView.builder(
            itemCount: ingredients.length + 1,
            onReorder: _reorderIngredients,
            itemBuilder: (context, index) {
              if (index == ingredients.length) {
                return ListTile(
                  key: const ValueKey('add-ingredient'),
                  title: Center(
                    child: ElevatedButton.icon(
                      onPressed: _addIngredient,
                      icon: const Icon(Icons.add),
                      label: const Text('Add ingredient'),
                    ),
                  ),
                );
              }

              final ingredient = ingredients[index];

              return IngredientTile(
                key: ValueKey(
                  '${ingredient.name}_$index',
                ),
                ingredient: ingredient,
                onChanged: (updated) {
                  _updateIngredient(index, updated);
                },
                onRemove: () {
                  _removeIngredient(index);
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
