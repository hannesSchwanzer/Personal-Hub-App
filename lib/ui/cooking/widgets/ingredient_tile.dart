import 'package:flutter/material.dart';
import 'package:personal_hub_app/domain/entities/cooking/recipe_entity.dart';

/// Widget for editing ingredient row: uses Flutter's Autocomplete for name entry and a dropdown for unit type.
class IngredientTile extends StatefulWidget {
  final IngredientEntity ingredient;
  final ValueChanged<IngredientEntity> onChanged;
  final VoidCallback onRemove;
  final List<String> ingredientNameRecommendations;

  const IngredientTile({
    super.key,
    required this.ingredient,
    required this.onChanged,
    required this.onRemove,
    required this.ingredientNameRecommendations,
  });

  @override
  State<IngredientTile> createState() => _IngredientTileState();
}

class _IngredientTileState extends State<IngredientTile> {
  late TextEditingController _nameController;
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.ingredient.name);
    _focusNode = FocusNode();
  }

  @override
  void didUpdateWidget(covariant IngredientTile oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.ingredient.name != widget.ingredient.name) {
      _nameController.text = widget.ingredient.name;
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Ingredient name with autocomplete
        Expanded(
          child: RawAutocomplete<String>(
            textEditingController: _nameController,
            focusNode: _focusNode,
            optionsBuilder: (TextEditingValue textEditingValue) {
              if (textEditingValue.text.isEmpty) {
                return const Iterable<String>.empty();
              }
              return widget.ingredientNameRecommendations.where((
                String option,
              ) {
                return option.toLowerCase().contains(
                  textEditingValue.text.toLowerCase(),
                );
              });
            },
            displayStringForOption: (option) => option,
            fieldViewBuilder:
                (
                  BuildContext context,
                  TextEditingController fieldTextEditingController,
                  FocusNode fieldFocusNode,
                  VoidCallback onFieldSubmitted,
                ) {
                  return TextFormField(
                    controller: fieldTextEditingController,
                    focusNode: fieldFocusNode,
                    decoration: const InputDecoration(labelText: 'Name'),
                    onChanged: (v) {
                      widget.onChanged(widget.ingredient.copyWith(name: v));
                    },
                    onFieldSubmitted: (v) {
                      widget.onChanged(widget.ingredient.copyWith(name: v));
                    },
                  );
                },
            optionsViewBuilder:
                (
                  BuildContext context,
                  AutocompleteOnSelected<String> onSelected,
                  Iterable<String> options,
                ) {
                  if (options.isEmpty) {
                    return const SizedBox.shrink();
                  }
                  return Align(
                    alignment: Alignment.topLeft,
                    child: Material(
                      elevation: 4.0,
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(maxHeight: 200),
                        child: ListView.builder(
                          shrinkWrap: true,
                          padding: EdgeInsets.zero,
                          itemCount: options.length,
                          itemBuilder: (BuildContext context, int index) {
                            final String option = options.elementAt(index);
                            return ListTile(
                              title: Text(option),
                              onTap: () => onSelected(option),
                            );
                          },
                        ),
                      ),
                    ),
                  );
                },
            onSelected: (String selection) {
              _nameController.text = selection;
              widget.onChanged(widget.ingredient.copyWith(name: selection));
            },
          ),
        ),
        const SizedBox(width: 8),
        SizedBox(
          width: 60,
          child: TextFormField(
            initialValue: widget.ingredient.quantity.toString(),
            decoration: const InputDecoration(labelText: 'Q'),
            keyboardType: TextInputType.number,
            onChanged: (v) => widget.onChanged(
              widget.ingredient.copyWith(
                            quantity: double.tryParse(v) ?? widget.ingredient.quantity,
              ),
            ),
          ),
        ),
        const SizedBox(width: 8),
        SizedBox(
          width: 90,
          child: DropdownButtonFormField<UnitType>(
            value: widget.ingredient.unit,
            items: UnitType.values
                .map(
                  (unit) => DropdownMenuItem(
                    value: unit,
                    child: Text(unit.abbreviation),
                  ),
                )
                .toList(),
            onChanged: (u) =>
                widget.onChanged(widget.ingredient.copyWith(unit: u)),
            decoration: const InputDecoration(labelText: 'Unit'),
          ),
        ),
        IconButton(
          icon: const Icon(Icons.remove_circle),
          onPressed: widget.onRemove,
        ),
      ],
    );
  }
}

