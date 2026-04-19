import 'package:flutter/material.dart';

/// Widget for editing a list of ingredient names (with autocomplete) as simple chips.
/// UI/UX matches TagsEditor but for strings only.
class IngredientNamesEditor extends StatefulWidget {
  final List<String> initialIngredients;
  final ValueChanged<List<String>> onChanged;
  final List<String> ingredientRecommendations;

  const IngredientNamesEditor({
    Key? key,
    required this.initialIngredients,
    required this.onChanged,
    required this.ingredientRecommendations,
  }) : super(key: key);

  @override
  State<IngredientNamesEditor> createState() => _IngredientNamesEditorState();
}

class _IngredientNamesEditorState extends State<IngredientNamesEditor> {
  late List<String> _ingredients;
  String? _editingIngredient;
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _ingredients = List.of(widget.initialIngredients);
  }

  void _startAdding() {
    setState(() {
      _editingIngredient = '';
      _controller.clear();
    });
    FocusScope.of(context).requestFocus(_focusNode);
  }

  void _commit([String? value]) {
    String ing = value ?? _controller.text;
    ing = ing.trim();
    if (ing.isEmpty || _ingredients.contains(ing)) {
      setState(() => _editingIngredient = null);
      _controller.clear();
      return;
    }
    setState(() {
      _ingredients.add(ing);
      _editingIngredient = null;
      _controller.clear();
    });
    widget.onChanged(_ingredients);
  }

  void _remove(String ing) {
    setState(() {
      _ingredients.remove(ing);
    });
    widget.onChanged(_ingredients);
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 4,
      children: [
        ..._ingredients.map((ing) => Chip(
              label: Text(ing),
              onDeleted: () => _remove(ing),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            )),
        if (_editingIngredient != null)
          SizedBox(
            width: 140,
            child: RawAutocomplete<String>(
              focusNode: _focusNode,
              textEditingController: _controller,
              optionsBuilder: (TextEditingValue textEditingValue) {
                if (textEditingValue.text.isEmpty) {
                  return const Iterable<String>.empty();
                }
                return widget.ingredientRecommendations
                    .where((option) => option
                        .toLowerCase()
                        .contains(textEditingValue.text.toLowerCase()))
                    .where((name) => !_ingredients.contains(name));
              },
              displayStringForOption: (option) => option,
              fieldViewBuilder: (
                BuildContext context,
                TextEditingController fieldTextEditingController,
                FocusNode fieldFocusNode,
                VoidCallback onFieldSubmitted,
              ) {
                return Chip(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  label: SizedBox(
                    width: 110,
                    child: TextField(
                      autofocus: true,
                      controller: fieldTextEditingController,
                      focusNode: fieldFocusNode,
                      decoration: const InputDecoration(
                        isDense: true,
                        border: InputBorder.none,
                        hintText: 'Ingredient',
                      ),
                      onSubmitted: (val) => _commit(val),
                      onEditingComplete: _commit,
                    ),
                  ),
                );
              },
              optionsViewBuilder: (
                BuildContext context,
                AutocompleteOnSelected<String> onSelected,
                Iterable<String> options,
              ) {
                if (options.isEmpty) return const SizedBox.shrink();
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
                        itemBuilder: (context, index) {
                          final String option = options.elementAt(index);
                          return ListTile(
                            title: Text(option),
                            onTap: () {
                              _controller.text = option;
                              _commit(option);
                            },
                          );
                        },
                      ),
                    ),
                  ),
                );
              },
              onSelected: (String selection) {
                _controller.text = selection;
                _commit(selection);
              },
            ),
          ),
        if (_editingIngredient == null)
          ActionChip(
            avatar: const Icon(Icons.add, size: 20, color: Colors.white),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            backgroundColor: Theme.of(context).colorScheme.primary,
            label: const Text('Add', style: TextStyle(color: Colors.white)),
            onPressed: _startAdding,
          ),
      ],
    );
  }
}

