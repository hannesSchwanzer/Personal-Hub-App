import 'package:flutter/material.dart';
import 'package:personal_hub_app/domain/entities/cooking/recipe_entity.dart';
import 'step_ingredients_editor.dart';
import 'recipe_image_picker.dart';
import 'dart:io';

/// Step tile widget. Pass the current recipe ingredients for ingredient selection in steps.
class StepTile extends StatelessWidget {
  final StepEntity step;
  final ValueChanged<StepEntity> onChanged;
  final VoidCallback onRemove;
  final List<IngredientEntity> recipeIngredients;

  const StepTile({
    super.key,
    required this.step,
    required this.onChanged,
    required this.onRemove,
    required this.recipeIngredients,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              
              RecipeImagePicker(
                imagePath: step.imagePath,
                onImagePicked: (file) async {
                  onChanged(step.copyWith(imagePath: file.path));
                },
              ),
              const SizedBox(height: 12),
              TextFormField(
                initialValue: step.instruction,
                decoration: const InputDecoration(labelText: 'Instruction'),
                minLines: 2,
                maxLines: null,
                keyboardType: TextInputType.multiline,
                onChanged: (v) => onChanged(step.copyWith(instruction: v)),
              ),
              const SizedBox(height: 12),
            StepIngredientsEditor(
              ingredients: step.ingredients,
              onChanged: (newList) =>
                  onChanged(step.copyWith(ingredients: newList)),
              availableIngredients: recipeIngredients,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                icon: const Icon(Icons.delete),
                onPressed: onRemove,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

