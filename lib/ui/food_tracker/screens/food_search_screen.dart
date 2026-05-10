import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:personal_hub_app/domain/entities/food/food_entities.dart';
import 'package:personal_hub_app/ui/food_tracker/view_models/food_search_view_model.dart';
import 'package:personal_hub_app/ui/food_tracker/widgets/food_autofill_widget.dart';
import 'package:personal_hub_app/ui/food_tracker/widgets/quantity_input_widget.dart';
import 'package:personal_hub_app/ui/food_tracker/ui_models/food_search_result.dart';

/// Screen for searching a food product by name, selecting it, and entering quantity.
/// Returns a [FoodSearchResult] via Navigator.pop when done.
class FoodSearchScreen extends ConsumerStatefulWidget {
  const FoodSearchScreen({super.key});

  @override
  ConsumerState<FoodSearchScreen> createState() => _FoodSearchScreenState();
}

class _FoodSearchScreenState extends ConsumerState<FoodSearchScreen> {
  final TextEditingController _quantityController = TextEditingController();
  bool _isQuantityValid = false;
  String? _lastUnitAbbr;

  @override
  void dispose() {
    _quantityController.dispose();
    super.dispose();
  }

  void _validateQuantity(String str) {
    final isValid = str.isNotEmpty && num.tryParse(str) != null;
    if (_isQuantityValid != isValid) {
      setState(() {
        _isQuantityValid = isValid;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final productAsync = ref.watch(foodSearchViewModelProvider);
    final searchNotifier = ref.read(foodSearchViewModelProvider.notifier);

    return Scaffold(
      appBar: AppBar(title: const Text('Search Food Product')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FoodAutofillWidget(
                labelText: 'Search food',
                onSelected: (FoodAutoFillEntity? selected, String inputText) {
                  if (selected != null) {
                    searchNotifier.fetchProductById(selected.id);
                  } else {
                    searchNotifier.clear();
                  }
                },
              ),
              const SizedBox(height: 20),
              productAsync.when(
                loading: () => const CircularProgressIndicator(),
                error: (error, stack) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Text(error.toString(), style: const TextStyle(color: Colors.red, fontSize: 16)),
                ),
                data: (foodProduct) {
                  if (foodProduct == null) return const SizedBox.shrink();
                  _lastUnitAbbr = foodProduct.nutrition.quantityUnit?.abbreviation ?? 'unit';
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Food Name: ${foodProduct.name}\nBrand: ${foodProduct.brand}',
                          style: const TextStyle(fontSize: 16),
                        ),
                      ),
                      // You could also add a nutrition summary widget here!
                      QuantityInputWidget(
                        controller: _quantityController,
                        unitAbbreviation: _lastUnitAbbr,
                        isValid: _isQuantityValid,
                        onChanged: _validateQuantity,
                      ),
                      const SizedBox(height: 12),
                      ElevatedButton(
                        onPressed: _isQuantityValid
                            ? () {
                                Navigator.of(context).pop(
                                  FoodSearchResult(
                                    foodProduct: foodProduct,
                                    quantity: double.parse(_quantityController.text),
                                  ),
                                );
                              }
                            : null,
                        child: const Text('Done'),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

