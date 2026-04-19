import 'dart:io';

import 'package:flutter/material.dart';
import 'package:personal_hub_app/domain/entities/cooking/recipe_entity.dart';

/// Widget for a single recipe step with optional image and per-step ingredient info.
class RecipeStepWidget extends StatelessWidget {
  final int index;
  final StepEntity step;
  final List<IngredientEntity> adjustedIngredients;

  /// If you want to show adjusted ingredient quantities, pass the full recalculated ingredient list.
  const RecipeStepWidget({Key? key, required this.index, required this.step, required this.adjustedIngredients}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Map of ingredient name to ingredient (for easy access)
    final ingredientMap = {for (var i in adjustedIngredients) i.name: i};
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Step ${index + 1}',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            if (step.ingredients.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(left: 4.0, top: 8.0, bottom: 5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Ingredients', style: Theme.of(context).textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w600)),
                    ...step.ingredients.map((stepIng) {
                      final ingredient = ingredientMap[stepIng.name];
                      if (ingredient == null) return const SizedBox();
                      final qty = (ingredient.quantity * stepIng.quantityPercent).toStringAsFixed(1);
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 1.5),
                        child: Text('• $qty ${ingredient.unit.abbreviation} ${ingredient.name}', style: Theme.of(context).textTheme.bodyMedium),
                      );
                    }),
                  ],
                ),
              ),
            // Step description
            Padding(
              padding: const EdgeInsets.only(left: 4.0, top: 7, bottom: 3),
              child: Text(
                step.instruction,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            if (step.imagePath != null && step.imagePath!.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(left: 28.0, top: 10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(7),
                  child: Image.file(
                    File(step.imagePath!),
                    height: 140,
                    width: double.infinity,
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) => Container(
                      height: 140,
                      color: Colors.grey[300],
                      child: const Icon(Icons.broken_image, size: 44),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

