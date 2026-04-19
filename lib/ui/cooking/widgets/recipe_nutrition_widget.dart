import 'package:flutter/material.dart';
import 'package:personal_hub_app/domain/entities/cooking/recipe_entity.dart';

/// Widget to display nutrition information in a nice row, only for present fields.
class RecipeNutritionWidget extends StatelessWidget {
  final NutritionInfoEntity nutrition;

  const RecipeNutritionWidget({Key? key, required this.nutrition}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final items = <Widget>[];
    if (nutrition.calories != null) {
      items.add(_single('Calories', '${nutrition.calories} kcal'));
    }
    if (nutrition.carbohydratesGrams != null) {
      items.add(_single('Carbs', '${nutrition.carbohydratesGrams!.toStringAsFixed(1)}g'));
    }
    if (nutrition.proteinGrams != null) {
      items.add(_single('Protein', '${nutrition.proteinGrams!.toStringAsFixed(1)}g'));
    }
    if (nutrition.fatGrams != null) {
      items.add(_single('Fat', '${nutrition.fatGrams!.toStringAsFixed(1)}g'));
    }
    return items.isEmpty
        ? const SizedBox.shrink()
        : Card(
            margin: EdgeInsets.zero,
            elevation: 0,
            color: Theme.of(context).colorScheme.primary.withOpacity(0.06),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
              child: Row(children: items.map((e) => Padding(padding: const EdgeInsets.only(right: 16.0), child: e)).toList()),
            ),
          );
  }

  Widget _single(String label, String value) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(label, style: const TextStyle(fontSize: 12, color: Colors.black54)),
      Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
    ],
  );
}

