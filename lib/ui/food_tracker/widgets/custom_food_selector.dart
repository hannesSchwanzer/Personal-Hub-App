import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:personal_hub_app/domain/entities/food/food_entities.dart';
import 'package:personal_hub_app/domain/entities/food/nutrition_entity.dart';
import 'package:personal_hub_app/domain/entities/food/unit_type.dart';
import 'package:personal_hub_app/ui/cooking/widgets/nutrition_editor.dart';

/// Selector widget for entering custom food with nutrition.
class CustomFoodSelector extends ConsumerStatefulWidget {
  final ValueChanged<CustomFoodEntity?> onFoodSelected;
  const CustomFoodSelector({super.key, required this.onFoodSelected});
  @override
  ConsumerState<CustomFoodSelector> createState() => _CustomFoodSelectorState();
}

class _CustomFoodSelectorState extends ConsumerState<CustomFoodSelector> {
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

  void _onChanged() {
    final name = _nameController.text;
    if (name.isNotEmpty) {
      widget.onFoodSelected(CustomFoodEntity(
        name: name,
        nutrition: _nutrition,
      ));
    } else {
      widget.onFoodSelected(null);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Name:", style: Theme.of(context).textTheme.titleMedium),
        TextField(
          controller: _nameController,
          decoration: const InputDecoration(labelText: 'Food Name'),
          onChanged: (val) => _onChanged(),
        ),
        const SizedBox(height: 12),
        NutritionEditor(
          initial: _nutrition,
          onChanged: (n) {
            _nutrition = n;
            _onChanged();
          },
        ),
      ],
    );
  }
}

