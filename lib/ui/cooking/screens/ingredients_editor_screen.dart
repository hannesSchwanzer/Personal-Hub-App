import 'package:flutter/material.dart';
import 'package:personal_hub_app/domain/entities/cooking/recipe_entity.dart';
import 'package:personal_hub_app/ui/cooking/view_models/recipe_creation_view_model.dart';
import 'package:personal_hub_app/ui/cooking/widgets/ingredient_tile.dart';

/// A full-screen editor for modifying a recipe's ingredients. Receives initial list and returns updated list on done.
import 'package:flutter_riverpod/flutter_riverpod.dart';

class IngredientsEditorScreen extends ConsumerStatefulWidget {
  final List<IngredientEntity> initialIngredients;

  const IngredientsEditorScreen({super.key, required this.initialIngredients});

  @override
  ConsumerState<IngredientsEditorScreen> createState() =>
      _IngredientsEditorScreenState();
}

class _IngredientsEditorScreenState
    extends ConsumerState<IngredientsEditorScreen> {
  late List<IngredientEntity> _ingredients;

  @override
  void initState() {
    super.initState();
    _ingredients = List<IngredientEntity>.from(widget.initialIngredients);
  }

  void _done() {
    Navigator.of(context).pop(_ingredients);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Edit Ingredients'),
        actions: [TextButton(onPressed: _done, child: const Text('Done'))],
      ),
      body: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () => FocusScope.of(context).unfocus(),
        child: ref
            .watch(ingredientNameRecommendationsProvider)
            .when(
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, _) => Center(child: Text('Error loading suggestions')),
              data: (ingredientSuggestions) => Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    Expanded(
                      child: ReorderableListView.builder(
                        itemCount: _ingredients.length + 1,
                        onReorder: (oldIndex, newIndex) {
                          setState(() {
                            if (oldIndex < _ingredients.length &&
                                newIndex > oldIndex) {
                              newIndex--;
                            }
                            if (oldIndex == _ingredients.length) return;
                            final item = _ingredients.removeAt(oldIndex);
                            if (newIndex > _ingredients.length) {
                              newIndex = _ingredients.length;
                            }
                            _ingredients.insert(newIndex, item);
                          });
                        },
                        itemBuilder: (context, index) {
                          if (index == _ingredients.length) {
                            return ListTile(
                              key: const ValueKey('add-ingredient'),
                              title: Center(
                                child: ElevatedButton.icon(
                                  onPressed: () {
                                    setState(() {
                                      _ingredients.add(
                                        IngredientEntity(
                                          name: '',
                                          quantity: 1,
                                          unit: UnitType.pieces,
                                        ),
                                      );
                                    });
                                  },
                                  icon: const Icon(Icons.add),
                                  label: const Text('Add ingredient'),
                                ),
                              ),
                            );
                          }
                          final ing = _ingredients[index];
                          return IngredientTile(
                            key: ValueKey(index),
                            ingredient: ing,
                            onChanged: (updated) {
                              setState(() {
                                _ingredients[index] = updated;
                              });
                            },
                            onRemove: () {
                              setState(() {
                                _ingredients.removeAt(index);
                              });
                            },
                            ingredientNameRecommendations: ingredientSuggestions,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
      ),
    );
  }
}
