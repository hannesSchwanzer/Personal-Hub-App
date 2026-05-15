import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:personal_hub_app/domain/entities/food/recipe_entity.dart';
import 'package:personal_hub_app/domain/entities/food/nutrition_entity.dart';
import 'package:personal_hub_app/ui/food_tracker/view_models/recipe_provider.dart';

/// Selector widget for searching and picking a recipe.
class RecipeSelector extends ConsumerStatefulWidget {
  final ValueChanged<RecipeEntity?> onFoodSelected;
  const RecipeSelector({super.key, required this.onFoodSelected});
  @override
  ConsumerState<RecipeSelector> createState() => _RecipeSelectorState();
}

class _RecipeSelectorState extends ConsumerState<RecipeSelector> {
  RecipeEntity? _selectedRecipe;

  @override
  Widget build(BuildContext context) {
    final recipesAsync = ref.watch(recipeListProvider);

    return recipesAsync.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stack) => Padding(
        padding: const EdgeInsets.all(16),
        child: Text(error.toString(), style: const TextStyle(color: Colors.red)),
      ),
      data: (recipes) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Autocomplete<RecipeEntity>(
              displayStringForOption: (r) => r.name,
              optionsBuilder: (TextEditingValue textEditingValue) {
                if (textEditingValue.text.isEmpty) return const Iterable<RecipeEntity>.empty();
                return recipes.where(
                  (option) => option.name.toLowerCase().contains(textEditingValue.text.toLowerCase()),
                );
              },
              onSelected: (RecipeEntity selection) {
                setState(() {
                  _selectedRecipe = selection;
                });
                widget.onFoodSelected(_selectedRecipe != null
                    ? selection
                    : null);
              },
              fieldViewBuilder: (context, controller, focusNode, onSubmit) {
                return TextField(
                  controller: controller,
                  focusNode: focusNode,
                  decoration: const InputDecoration(
                    labelText: 'Search Recipe',
                    border: OutlineInputBorder(),
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
            if (_selectedRecipe != null)
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _selectedRecipe!.name,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      if (_selectedRecipe!.description.isNotEmpty)
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                            _selectedRecipe!.description,
                            style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                          ),
                        ),
                      const SizedBox(height: 12),
                      _NutritionInfoWidget(nutrition: _selectedRecipe!.nutritionInfo),
                    ],
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}

class _NutritionInfoWidget extends StatelessWidget {
  final NutritionEntity nutrition;
  const _NutritionInfoWidget({required this.nutrition});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (nutrition.energyKcal != null)
          Text('Calories:  	${nutrition.energyKcal!.toStringAsFixed(0)} kcal'),
        if (nutrition.proteins != null)
          Text('Protein:   ${nutrition.proteins!.toStringAsFixed(1)} g'),
        if (nutrition.carbohydrates != null)
          Text('Carbs:     ${nutrition.carbohydrates!.toStringAsFixed(1)} g'),
        if (nutrition.fat != null)
          Text('Fat:       ${nutrition.fat!.toStringAsFixed(1)} g'),
      ],
    );
  }
}

