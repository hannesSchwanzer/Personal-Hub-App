import 'package:flutter/material.dart';
import 'package:personal_hub_app/domain/entities/cooking/recipe_entity.dart';

/// Editor for ingredients inside a step.
/// Only allows choosing from ingredients in recipe, and takes number (not percent).
class StepIngredientsEditor extends StatefulWidget {
  final List<StepIngredientEntity> ingredients;
  final ValueChanged<List<StepIngredientEntity>> onChanged;
  final List<IngredientEntity> availableIngredients;

  const StepIngredientsEditor({
    super.key,
    required this.ingredients,
    required this.onChanged,
    required this.availableIngredients,
  });

  @override
  State<StepIngredientsEditor> createState() => _StepIngredientsEditorState();
}

class _StepIngredientsEditorState extends State<StepIngredientsEditor> {
  late List<StepIngredientEntity> _ings;

  @override
  void initState() {
    super.initState();
    _ings = List.of(widget.ingredients);
  }

  void _addIng() {
    setState(() {
      // Default to first available ingredient
      final name = widget.availableIngredients.isNotEmpty
          ? widget.availableIngredients[0].name
          : '';
      _ings.add(StepIngredientEntity(name: name, quantityPercent: 100.0));
      widget.onChanged(_ings);
    });
  }

  void _removeIng(int idx) {
    setState(() {
      _ings.removeAt(idx);
      widget.onChanged(_ings);
    });
  }

  void _onChanged(int idx, StepIngredientEntity updated) {
    setState(() {
      _ings[idx] = updated;
      widget.onChanged(_ings);
    });
  }

  @override
  Widget build(BuildContext context) {
    // Map ingredient name -> quantity
    final ingredientMap = {
      for (final ing in widget.availableIngredients) ing.name: ing,
    };

    return Column(
      children: [
        ..._ings
            .asMap()
            .map(
              (i, ing) => MapEntry(
                i,
                Row(
                  children: [
                    // Ingredient selection dropdown (cannot invent new!)
                    Flexible(
                      flex: 3,
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 180),
                        child: DropdownButtonFormField<String>(
                          value: widget.availableIngredients.any((element) => element.name == ing.name)
                              ? ing.name
                              : (widget.availableIngredients.isNotEmpty
                                  ? widget.availableIngredients.first.name
                                  : ""),
                          items: widget.availableIngredients
                              .map(
                                (ing) => DropdownMenuItem<String>(
                                  value: ing.name,
                                  child: Text(ing.name, overflow: TextOverflow.ellipsis, maxLines: 1),
                                ),
                              )
                              .toList(),
                          selectedItemBuilder: (context) => widget.availableIngredients
                              .map((ing) => Container(
                                    alignment: Alignment.centerLeft,
                                    constraints: const BoxConstraints(maxWidth: 140), // Ensure the button view has a width limit (<= field width)
                                    child: Text(
                                      ing.name,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      style: Theme.of(context).textTheme.bodyMedium,
                                      softWrap: false,
                                    ),
                                  ))
                              .toList(),
                          onChanged: (newName) {
                            if (newName != null) {
                              _onChanged(i, ing.copyWith(name: newName));
                            }
                          },
                          decoration: const InputDecoration(
                            labelText: 'Ingredient',
                            isDense: true,
                            contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    SizedBox(
                      width: 75,
                      child: TextFormField(
                        initialValue: ing.quantityPercent.toStringAsFixed(0),
                        decoration: const InputDecoration(labelText: 'Percent'),
                        keyboardType:
                            const TextInputType.numberWithOptions(decimal: false),
                        onChanged: (v) {
                          final q = int.tryParse(v) ?? 0;
                          // Calculate percent for display
                          final base = ingredientMap[ing.name]?.quantity ?? 1;
                          final percent = base > 0 ? (q * 100.0 / base) : 100.0;
                          _onChanged(i, ing.copyWith(quantityPercent: percent));
                        },
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.remove_circle_outline),
                      onPressed: () => _removeIng(i),
                    ),
                  ],
                ),
              ),
            )
            .values,
        ElevatedButton.icon(
          onPressed: widget.availableIngredients.isEmpty ? null : _addIng,
          icon: const Icon(Icons.add),
          label: const Text('Add Ingredient'),
        ),
      ],
    );
  }
}

