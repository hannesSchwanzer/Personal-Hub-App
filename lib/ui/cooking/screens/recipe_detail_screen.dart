import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:personal_hub_app/ui/cooking/screens/recipe_creation_screen.dart';
import 'package:personal_hub_app/ui/cooking/widgets/info_icon_text.dart';
import 'package:personal_hub_app/ui/cooking/widgets/recipe_nutrition_widget.dart';
import 'package:personal_hub_app/ui/cooking/widgets/recipe_step_widget.dart';
import 'package:personal_hub_app/ui/cooking/view_models/recipe_detail_view_model.dart';

/// Screen for displaying full details of a recipe, responsive to serving count.
class RecipeDetailScreen extends ConsumerWidget {
  final String recipeId;

  /// Displays full details for a recipe given its ID. Automatically updates or pops if recipe is deleted.
  const RecipeDetailScreen({super.key, required this.recipeId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncDetail = ref.watch(recipeDetailProvider(recipeId));
    final notifier = ref.read(recipeDetailProvider(recipeId).notifier);

    return asyncDetail.when(
      loading: () => const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      ),
      error: (error, stack) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (Navigator.of(context).canPop()) Navigator.of(context).pop();
        });
        return const SizedBox.shrink();
      },
      data: (state) {
        if (state == null) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (Navigator.of(context).canPop()) Navigator.of(context).pop();
          });
          return const SizedBox.shrink();
        }
        final recipe = state.recipe;
        final scaledIngredients = notifier.scaledIngredients;

        return Scaffold(
      appBar: AppBar(
        title: Text(recipe.name),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            tooltip: 'Edit',
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => RecipeCreationScreen(recipeId: recipe.id),
                ),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            /// Recipe Image
            if (recipe.imagePath.isNotEmpty)
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.file(
                  File(recipe.imagePath),
                  height: 200,
                  fit: BoxFit.contain,
                  alignment: Alignment.center,
                  errorBuilder: (c, e, st) => Container(
                    height: 200,
                    color: Colors.grey[300],
                    child: const Icon(Icons.image_not_supported, size: 54),
                  ),
                ),
              )
            else
              Container(
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.grey[250],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(Icons.restaurant_menu, size: 54),
              ),
            const SizedBox(height: 16),

            /// Name & tags
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  child: Text(
                    recipe.name,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),
                if (recipe.tags.isNotEmpty)
                  Wrap(
                    spacing: 8,
                    children: recipe.tags
                        .map((tag) => Chip(label: Text(tag)))
                        .toList(),
                  ),
              ],
            ),
            const SizedBox(height: 12),

            /// Description
            if (recipe.description.isNotEmpty)
              Text(
                recipe.description,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            const SizedBox(height: 16),

            // Cooking / Preparation Times & Servings Adjustment
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InfoIconText(
                  icon: Icons.schedule,
                  text:
                      '${recipe.preparationTimeMinutes + recipe.cookingTimeMinutes} min',
                ),
                const SizedBox(width: 16),
                InfoIconText(
                  icon: Icons.restaurant,
                  text: '${state.servings} servings',
                ),
                const Spacer(),
                Container(
                  decoration: BoxDecoration(
                    color: Theme.of(
                      context,
                    ).colorScheme.primary.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child: Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.remove),
                        splashRadius: 22,
                        onPressed: state.servings > 1
                            ? notifier.decrement
                            : null,
                      ),
                      Text(
                        '${state.servings}',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      IconButton(
                        icon: const Icon(Icons.add),
                        splashRadius: 22,
                        onPressed: notifier.increment,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 18),

            /// Nutrition card
            if (recipe.nutritionInfo.calories != null ||
                recipe.nutritionInfo.carbohydratesGrams != null ||
                recipe.nutritionInfo.proteinGrams != null ||
                recipe.nutritionInfo.fatGrams != null)
              RecipeNutritionWidget(nutrition: recipe.nutritionInfo),
            const SizedBox(height: 18),
            // Ingredient List (scaled)
            Text('Ingredients', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 8),
            ...scaledIngredients.map(
              (ingredient) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 2.5),
                child: Row(
                  children: [
                    Text(
                      '${ingredient.quantity} ${ingredient.unit.abbreviation}',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Flexible(child: Text(ingredient.name)),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 22),
            // Steps List
            Text('Steps', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 10),
            ...List.generate(
              recipe.steps.length,
              (i) => RecipeStepWidget(
                index: i,
                step: recipe.steps[i],
                adjustedIngredients: scaledIngredients,
              ),
            ),
          ],
        ),
      ),
    );
  });
}
}
