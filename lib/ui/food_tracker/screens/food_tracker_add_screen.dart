import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:personal_hub_app/ui/food_tracker/view_models/food_tracker_add_view_model.dart';
import 'package:personal_hub_app/ui/food_tracker/widgets/food_search_selector.dart';
import 'package:personal_hub_app/ui/food_tracker/widgets/barcode_selector.dart';
import 'package:personal_hub_app/ui/food_tracker/widgets/recipe_selector.dart';
import 'package:personal_hub_app/ui/food_tracker/widgets/custom_food_selector.dart';
import 'package:personal_hub_app/domain/entities/food/food_entities.dart';
import 'package:personal_hub_app/domain/entities/food/recipe_entity.dart';

class FoodTrackerAddScreen extends ConsumerStatefulWidget {
  const FoodTrackerAddScreen({super.key});
  @override
  ConsumerState<FoodTrackerAddScreen> createState() => _FoodTrackerAddScreenState();
}

enum FoodInputMethod { search, barcode, recipe, custom }

class _FoodTrackerAddScreenState extends ConsumerState<FoodTrackerAddScreen> {
  FoodInputMethod inputMethod = FoodInputMethod.search;
  TextEditingController amountController = TextEditingController();

  @override
  void dispose() {
    amountController.dispose();
    super.dispose();
  }

  Widget _inputWidget(FoodInputMethod method, WidgetRef ref) {
    final notifier = ref.read(foodTrackerAddViewModelProvider.notifier);
    switch (method) {
      case FoodInputMethod.search:
        return FoodSearchSelector(onFoodSelected: (FoodProductEntity? food) {
          notifier.onProductSelected(food);
        });
      case FoodInputMethod.barcode:
        return BarcodeSelector(onFoodSelected: (FoodProductEntity? food) {
          notifier.onProductSelected(food);
        });
      case FoodInputMethod.recipe:
        return RecipeSelector(onFoodSelected: (RecipeEntity? recipe) {
          notifier.onRecipeSelected(recipe);
        });
      case FoodInputMethod.custom:
        return CustomFoodSelector(onFoodSelected: (CustomFoodEntity? food) {
          notifier.onManualFoodSelected(food);
        });
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(foodTrackerAddViewModelProvider);
    final notifier = ref.read(foodTrackerAddViewModelProvider.notifier);
    final food = state.foodTrackingItem;
    return Scaffold(
      appBar: AppBar(title: const Text('Add Food')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Wrap(
              spacing: 8.0,
              children: [
                ChoiceChip(
                  label: const Text('Search'),
                  selected: inputMethod == FoodInputMethod.search,
                  onSelected: (_) => setState(() => inputMethod = FoodInputMethod.search),
                ),
                ChoiceChip(
                  label: const Text('Barcode'),
                  selected: inputMethod == FoodInputMethod.barcode,
                  onSelected: (_) => setState(() => inputMethod = FoodInputMethod.barcode),
                ),
                ChoiceChip(
                  label: const Text('Recipe'),
                  selected: inputMethod == FoodInputMethod.recipe,
                  onSelected: (_) => setState(() => inputMethod = FoodInputMethod.recipe),
                ),
                ChoiceChip(
                  label: const Text('Custom'),
                  selected: inputMethod == FoodInputMethod.custom,
                  onSelected: (_) => setState(() => inputMethod = FoodInputMethod.custom),
                ),
              ],
            ),
            const SizedBox(height: 20),
            _inputWidget(inputMethod, ref),
            const SizedBox(height: 20),
            if (food != null) ...[
              Text('Selected: ${food.name}', style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: 6),
              Text('Kcal: ${food.nutrition.energyKcal?.toStringAsFixed(1) ?? '-'}'),
              Text('Protein: ${food.nutrition.proteins?.toStringAsFixed(1) ?? '-'}g'),
              Text('Carbs: ${food.nutrition.carbohydrates?.toStringAsFixed(1) ?? '-'}g'),
              Text('Fat: ${food.nutrition.fat?.toStringAsFixed(1) ?? '-'}g'),
            ],
            const SizedBox(height: 24),
            TextField(
              controller: amountController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Amount',
                border: OutlineInputBorder(),
              ),
              onChanged: notifier.onAmountChanged,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: state.isSaving
                  ? null
                  : () async {
                      await notifier.saveFoodEntry();
                      if (state.addResult == "Saved!") {
                        amountController.clear();
                      }
                    },
              child: state.isSaving ? const CircularProgressIndicator() : const Text('Add'),
            ),
            if (state.addResult != null)
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text(
                  state.addResult!,
                  style: TextStyle(color: state.addResult == "Saved!" ? Colors.green : Colors.red),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

