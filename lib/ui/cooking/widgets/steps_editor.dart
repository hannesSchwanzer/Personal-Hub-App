import 'package:flutter/material.dart';
import 'package:personal_hub_app/domain/entities/cooking/recipe_entity.dart';
import 'step_tile.dart';

/// Widget for editing the list of steps. Pass current recipe ingredients for cross-linking step ingredients.
class StepsEditor extends StatefulWidget {
  final List<StepEntity> steps;
  final ValueChanged<List<StepEntity>> onChanged;
  final List<IngredientEntity> availableIngredients;

  const StepsEditor({
    super.key,
    required this.steps,
    required this.onChanged,
    required this.availableIngredients,
  });

  @override
  State<StepsEditor> createState() => _StepsEditorState();
}

class _StepsEditorState extends State<StepsEditor> {
  late List<StepEntity> _steps;

  @override
  void initState() {
    super.initState();
    _steps = List.of(widget.steps);
  }

  void _addStep() {
    setState(() {
      _steps.add(StepEntity(ingredients: [], instruction: '', imagePath: null));
      widget.onChanged(_steps);
    });
  }

  void _removeStep(int i) {
    setState(() {
      _steps.removeAt(i);
      widget.onChanged(_steps);
    });
  }

  void _onStepChanged(int i, StepEntity step) {
    setState(() {
      _steps[i] = step;
      widget.onChanged(_steps);
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<IngredientEntity> recipeIngredients = widget.availableIngredients;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Steps', style: TextStyle(fontWeight: FontWeight.bold)),
        ..._steps
            .asMap()
            .map(
              (i, step) => MapEntry(
                i,
                StepTile(
                  step: step,
                  onChanged: (upd) => _onStepChanged(i, upd),
                  onRemove: () => _removeStep(i),
                  recipeIngredients: recipeIngredients,
                ),
              ),
            )
            .values,
        ElevatedButton.icon(
          onPressed: _addStep,
          icon: const Icon(Icons.add),
          label: const Text('Add Step'),
        ),
      ],
    );
  }
}

