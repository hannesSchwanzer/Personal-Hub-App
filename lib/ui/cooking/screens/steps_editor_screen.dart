import 'package:flutter/material.dart';
import 'package:personal_hub_app/domain/entities/cooking/recipe_entity.dart';
import 'package:personal_hub_app/ui/cooking/widgets/step_tile.dart';

/// Full-screen editor for modifying the steps of a recipe.
/// Receives initial list and returns updated list on done.
class StepsEditorScreen extends StatefulWidget {
  final List<StepEntity> initialSteps;
  final List<IngredientEntity> availableIngredients;

  const StepsEditorScreen({
    super.key,
    required this.initialSteps,
    required this.availableIngredients,
  });

  @override
  State<StepsEditorScreen> createState() => _StepsEditorScreenState();
}

class _StepsEditorScreenState extends State<StepsEditorScreen> {
  late List<StepEntity> _steps;

  @override
  void initState() {
    super.initState();
    _steps = List<StepEntity>.from(widget.initialSteps);
  }

  void _onStepsChanged(List<StepEntity> updated) {
    setState(() {
      _steps = updated;
    });
  }

  void _done() {
    Navigator.of(context).pop(_steps);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Edit Steps'),
              actions: [
                TextButton(
                  onPressed: _done,
                  child: const Text('Done'),
                ),
              ],
      ),
      body: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () => FocusScope.of(context).unfocus(),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Expanded(
                child: ReorderableListView.builder(
                  itemCount: _steps.length + 1, // one extra for the add button
                  onReorder: (oldIndex, newIndex) {
                    setState(() {
                      if (oldIndex < _steps.length && newIndex > oldIndex) newIndex--;
                      if (oldIndex == _steps.length) return; // Don't allow reordering 'add' button
                      final item = _steps.removeAt(oldIndex);
                      if (newIndex > _steps.length) newIndex = _steps.length;
                      _steps.insert(newIndex, item);
                    });
                  },
                  itemBuilder: (context, index) {
                    if (index == _steps.length) {
                      return ListTile(
                        key: const ValueKey('add-step'),
                        title: Center(
                          child: ElevatedButton.icon(
                            onPressed: () {
                              setState(() {
                                _steps.add(
                                  StepEntity(
                                    instruction: '',
                                    imagePath: null,
                                    ingredients: const [],
                                  ),
                                );
                              });
                            },
                            icon: const Icon(Icons.add),
                            label: const Text('Add step'),
                          ),
                        ),
                      );
                    }
                    final step = _steps[index];
                    return StepTile(
                      key: ValueKey(index),
                      step: step,
                      recipeIngredients: widget.availableIngredients,
                      onChanged: (newStep) {
                        setState(() {
                          _steps[index] = newStep;
                        });
                      },
                      onRemove: () {
                        setState(() {
                          _steps.removeAt(index);
                        });
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

