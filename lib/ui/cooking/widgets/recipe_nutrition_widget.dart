import 'package:flutter/material.dart';
import 'package:personal_hub_app/domain/entities/food/nutrition_entity.dart';

/// Widget to display nutrition information in a card with all fields and reference amount.
class NutritionDisplayWidget extends StatelessWidget {
  final NutritionEntity nutrition;

  const NutritionDisplayWidget({Key? key, required this.nutrition}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<_NutritionItem> nutritionItems = [
      _NutritionItem('Calories', nutrition.energyKcal, postfix: ' kcal', round: false),
      _NutritionItem('Carbs', nutrition.carbohydrates, postfix: 'g'),
      _NutritionItem('Sugars', nutrition.sugars, postfix: 'g'),
      _NutritionItem('Protein', nutrition.proteins, postfix: 'g'),
      _NutritionItem('Fat', nutrition.fat, postfix: 'g'),
      _NutritionItem('Saturated Fat', nutrition.saturatedFat, postfix: 'g'),
      _NutritionItem('Sodium', nutrition.sodium, postfix: 'mg'),
    ];
    final List<Widget> items = nutritionItems
        .where((item) => item.value != null)
        .map((item) => _single(item.label, item.valueString()))
        .toList();

    String referenceInfo = _referenceString(nutrition);

    return Card(
      margin: EdgeInsets.zero,
      elevation: 0,
      color: Theme.of(context).colorScheme.primary.withOpacity(0.06),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (referenceInfo.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: Text(
                  referenceInfo,
                  style: const TextStyle(fontSize: 13, color: Colors.black45),
                ),
              ),
            if (items.isNotEmpty)
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: items.map((e) => Padding(padding: const EdgeInsets.only(right: 16.0), child: e)).toList(),
                ),
              )
            else
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Text(
                  'Nutritional information not available',
                  style: TextStyle(color: Colors.black45, fontStyle: FontStyle.italic, fontSize: 14),
                ),
              ),
          ],
        ),
      ),
    );
  }

  /// Renders a single nutrition field with its label and value.
  Widget _single(String label, String value) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(fontSize: 12, color: Colors.black54)),
          Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      );

  /// Formats the reference amount for the nutrition data.
  static String _referenceString(NutritionEntity n) {
    if (n.perQuantity != null && n.quantityUnit != null) {
      final unitStr = _unitString(n.quantityUnit!);
      final quantity = n.perQuantity!;
      return 'for ${quantity % 1 == 0 ? quantity.toStringAsFixed(0) : quantity.toString()} $unitStr';
    }
    return '';
  }

  /// Maps the UnitType to a readable string.
  static String _unitString(dynamic unit) {
    final str = unit.toString().split('.').last;
    switch (str) {
      case 'grams':
      case 'g':
        return 'g';
      case 'ml':
      case 'milliliters':
        return 'ml';
      case 'piece':
      case 'pieces':
        return 'piece(s)';
      default:
        return str;
    }
  }
}

/// Helper class for nutrition items for display.
class _NutritionItem {
  final String label;
  final double? value;
  final String postfix;
  final bool round;

  _NutritionItem(this.label, this.value, {this.postfix = '', this.round = true});

  String valueString() {
    if (value == null) return '';
    if (round) {
      return value!.toStringAsFixed(1) + postfix;
    } else {
      return value!.toStringAsFixed(0) + postfix;
    }
  }
}

