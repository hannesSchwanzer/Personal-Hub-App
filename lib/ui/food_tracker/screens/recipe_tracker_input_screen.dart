import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:personal_hub_app/domain/entities/food/recipe_entity.dart';
import 'package:personal_hub_app/domain/entities/food/nutrition_entity.dart';
import 'package:personal_hub_app/ui/food_tracker/ui_models/food_search_result.dart';
import 'package:personal_hub_app/ui/food_tracker/view_models/recipe_provider.dart';

/// Screen for adding a Recipe to the food tracker.
/// - Allows searching and selecting a recipe from available options.
/// - Displays basic recipe info and nutrition on selection.
/// - Quantity input for number of portions.
class RecipeTrackerInputScreen extends ConsumerStatefulWidget {
  const RecipeTrackerInputScreen({super.key});

  @override
  ConsumerState<RecipeTrackerInputScreen> createState() =>
      _RecipeTrackerInputScreenState();
}

class _RecipeTrackerInputScreenState
    extends ConsumerState<RecipeTrackerInputScreen> {
  RecipeEntity? _selectedRecipe;
  final TextEditingController _quantityController = TextEditingController(
    text: '1',
  );
  bool _isQuantityValid = true;

  void _validateQuantity(String str) {
    final isValid =
        str.isNotEmpty && int.tryParse(str) != null && int.parse(str) > 0;
    if (_isQuantityValid != isValid) {
      setState(() {
        _isQuantityValid = isValid;
      });
    }
  }

  @override
  void dispose() {
    _quantityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final recipesAsync = ref.watch(recipeListProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Add Recipe to Tracker')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: recipesAsync.when(
            loading: () => const CircularProgressIndicator(),
            error: (error, stack) => Text(
              error.toString(),
              style: const TextStyle(color: Colors.red),
            ),
            data: (recipes) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Autocomplete<RecipeEntity>(
                    displayStringForOption: (r) => r.name,
                    optionsBuilder: (TextEditingValue textEditingValue) {
                      if (textEditingValue.text.isEmpty)
                        return const Iterable<RecipeEntity>.empty();
                      return recipes.where(
                        (RecipeEntity option) => option.name
                            .toLowerCase()
                            .contains(textEditingValue.text.toLowerCase()),
                      );
                    },
                    onSelected: (RecipeEntity selection) {
                      setState(() {
                        _selectedRecipe = selection;
                        _quantityController.text = '1';
                        _isQuantityValid = true;
                      });
                    },
                    fieldViewBuilder:
                        (context, controller, focusNode, onSubmit) {
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
                  if (_selectedRecipe != null) ...[
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
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey[700],
                                  ),
                                ),
                              ),
                            const SizedBox(height: 12),
                            _NutritionInfoWidget(
                              nutrition: _selectedRecipe!.nutritionInfo,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      controller: _quantityController,
                      decoration: const InputDecoration(
                        labelText: 'Portions',
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,
                      onChanged: _validateQuantity,
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: _isQuantityValid && _selectedRecipe != null
                          ? () {
                              Navigator.of(context).pop(
                                RecipeSearchResult(
                                  recipe: _selectedRecipe!,
                                  quantity: double.parse(_quantityController.text),
                                ),
                              );
                            }
                          : null,
                      child: const Text('Done'),
                    ),
                  ],
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

/// Displays the nutrition info for a recipe in a simple style.
class _NutritionInfoWidget extends StatelessWidget {
  final NutritionEntity nutrition;
  const _NutritionInfoWidget({required this.nutrition});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (nutrition.energyKcal != null)
          Text('Calories:  ${nutrition.energyKcal!.toStringAsFixed(0)} kcal'),
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
