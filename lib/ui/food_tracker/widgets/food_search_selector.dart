import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:personal_hub_app/domain/entities/food/food_entities.dart';
import 'package:personal_hub_app/ui/food_tracker/view_models/food_search_view_model.dart';
import 'package:personal_hub_app/ui/food_tracker/widgets/food_autofill_widget.dart';

/// Widget for searching and selecting a food product (without quantity)
class FoodSearchSelector extends ConsumerStatefulWidget {
  final ValueChanged<FoodProductEntity?> onFoodSelected;
  const FoodSearchSelector({super.key, required this.onFoodSelected});
  @override
  ConsumerState<FoodSearchSelector> createState() => _FoodSearchSelectorState();
}

class _FoodSearchSelectorState extends ConsumerState<FoodSearchSelector> {

  @override
  Widget build(BuildContext context) {
    final productAsync = ref.watch(foodSearchViewModelProvider);
    final searchNotifier = ref.read(foodSearchViewModelProvider.notifier);

    ref.listen(foodSearchViewModelProvider, (prev, next) {
      next.whenData((foodProduct) {
        widget.onFoodSelected(foodProduct);
      });
    });

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        FoodAutofillWidget(
          labelText: 'Search food',
          onSelected: (selected, inputText) {
            if (selected != null) {
              searchNotifier.fetchProductById(selected.id);
            } else {
              searchNotifier.clear();
              widget.onFoodSelected(null);
            }
          },
        ),
        const SizedBox(height: 16),

        productAsync.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, stack) => Text(error.toString()),
          data: (foodProduct) {
            if (foodProduct == null) return const SizedBox.shrink();

            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Food Name: ${foodProduct.name}\nBrand: ${foodProduct.brand}',
              ),
            );
          },
        ),
      ],
    );
  }
}
