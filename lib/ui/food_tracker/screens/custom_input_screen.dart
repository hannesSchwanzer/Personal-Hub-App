import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:personal_hub_app/domain/entities/food/nutrition_entity.dart';
import 'package:personal_hub_app/domain/entities/food/unit_type.dart';
import 'package:personal_hub_app/ui/cooking/widgets/nutrition_editor.dart';
import 'package:personal_hub_app/ui/food_tracker/ui_models/food_search_result.dart';

/// Screen for searching a food product by name, selecting it, and entering quantity.
/// Returns a [FoodSearchResult] via Navigator.pop when done.
class CustomInputScreen extends ConsumerStatefulWidget {
  const CustomInputScreen({super.key});

  @override
  ConsumerState<CustomInputScreen> createState() => _CustomInputScreenState();
}

class _CustomInputScreenState extends ConsumerState<CustomInputScreen> {
  final TextEditingController _nameController = TextEditingController();
  NutritionEntity _nutrition = NutritionEntity(
    energyKcal: 0,
    carbohydrates: 0,
    proteins: 0,
    fat: 0,
    perQuantity: 1,
    quantityUnit: UnitType.pieces,
  );

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Search Food Product')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Name:", style: Theme.of(context).textTheme.titleMedium),
              TextField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Food Name'),
              ),
              const SizedBox(height: 12),
              NutritionEditor(
                initial: _nutrition,
                onChanged: ((n) => _nutrition = n),
              ),
              const SizedBox(height: 12),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop(
                    CustomFoodSearchResult(
                      name: _nameController.text,
                      nutrition: _nutrition,
                    ),
                  );
                },
                child: const Text('Done'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
