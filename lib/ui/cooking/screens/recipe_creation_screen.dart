import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:personal_hub_app/ui/cooking/screens/recipe_from_text_screen.dart';
import 'package:personal_hub_app/ui/cooking/screens/recipe_from_url_screen.dart';
import 'package:personal_hub_app/ui/cooking/screens/steps_editor_screen.dart';
import 'package:personal_hub_app/ui/cooking/screens/recipe_from_images_screen.dart';
import 'package:personal_hub_app/ui/cooking/view_models/recipe_creation_view_model.dart';
import '../widgets/recipe_image_picker.dart';
import 'package:personal_hub_app/ui/cooking/screens/cooking_times_editor_screen.dart';
import 'package:personal_hub_app/ui/cooking/screens/nutrition_editor_screen.dart';
import '../widgets/tags_editor.dart';
import 'package:personal_hub_app/domain/entities/food/recipe_entity.dart';
import 'package:personal_hub_app/ui/cooking/screens/ingredients_editor_screen.dart';

/// Screen for creating or editing a recipe. Uses Riverpod's RecipeCreationNotifier.
/// Handles async state, field changes, and saving.
class RecipeCreationScreen extends ConsumerStatefulWidget {
  /// Pass a recipeId to edit, or null for a new recipe.
  final String? recipeId;

  const RecipeCreationScreen({super.key, this.recipeId});

  @override
  ConsumerState<RecipeCreationScreen> createState() =>
      _RecipeCreationScreenState();
}

class _RecipeCreationScreenState extends ConsumerState<RecipeCreationScreen> {
  bool _initialized = false;
  bool _isGeneratingFromImage = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!_initialized) {
        ref.read(recipeCreationNotifierProvider.notifier).load(widget.recipeId);
        _initialized = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final recipeAsync = ref.watch(recipeCreationNotifierProvider);
    final notifier = ref.read(recipeCreationNotifierProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.recipeId != null ? 'Edit Recipe' : 'Create Recipe'),
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) async {
              if (value == 'delete' && widget.recipeId != null) {
                if (!mounted) return;
                if (!mounted) return;
                final confirm = await showDialog<bool>(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Delete Recipe'),
                    content: const Text(
                      'Are you sure you want to delete this recipe? This cannot be undone.',
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(false),
                        child: const Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(true),
                        child: const Text('Delete'),
                      ),
                    ],
                  ),
                );
                if (confirm == true) {
                  await notifier.deleteRecipe();
                  final postDelete = ref.read(recipeCreationNotifierProvider);
                  if (mounted &&
                      !postDelete.isLoading &&
                      postDelete.error == null) {
                    Navigator.of(context).pop(true);
                  } else if (postDelete.error != null && mounted) {
                    if (!mounted) return;
                    showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                        title: const Text('Error'),
                        content: Text(postDelete.error.toString()),
                        actions: [
                          TextButton(
                            child: const Text('OK'),
                            onPressed: () => Navigator.of(context).pop(),
                          ),
                        ],
                      ),
                    );
                  }
                }
              } else if (value == 'from_image') {
                final isEdited = notifier.hasUnsavedChanges();

                if (isEdited) {
                  final confirm = await showDialog<bool>(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Overwrite Recipe?'),
                      content: const Text(
                        'This will overwrite current changes. Continue?',
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(false),
                          child: const Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(true),
                          child: const Text('Continue'),
                        ),
                      ],
                    ),
                  );

                  if (confirm != true || !mounted) return;
                }

                final recipe = await Navigator.of(context).push<RecipeEntity>(
                  MaterialPageRoute(
                    builder: (_) => RecipeFromImagesScreen(
                      showEditWarning: isEdited,
                      onRecipeGenerated: (recipe) {
                        Navigator.of(context).pop(recipe);
                      },
                    ),
                  ),
                );

                if (recipe != null && mounted) {
                  notifier.setRecipe(recipe);
                }
              } else if (value == 'from_url') {
                final isEdited = notifier.hasUnsavedChanges();

                if (isEdited) {
                  final confirm = await showDialog<bool>(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Overwrite Recipe?'),
                      content: const Text(
                        'This will overwrite current changes. Continue?',
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(false),
                          child: const Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(true),
                          child: const Text('Continue'),
                        ),
                      ],
                    ),
                  );

                  if (confirm != true || !mounted) return;
                }

                final recipe = await Navigator.of(context).push<RecipeEntity>(
                  MaterialPageRoute(
                    builder: (_) => RecipeFromUrlScreen(
                      showEditWarning: isEdited,
                      onRecipeGenerated: (recipe) {
                        Navigator.of(context).pop(recipe);
                      },
                    ),
                  ),
                );

                if (recipe != null && mounted) {
                  notifier.setRecipe(recipe);
                }
              } else if (value == 'from_text') {
                final isEdited = notifier.hasUnsavedChanges();

                if (isEdited) {
                  final confirm = await showDialog<bool>(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Overwrite Recipe?'),
                      content: const Text(
                        'This will overwrite current changes. Continue?',
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(false),
                          child: const Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(true),
                          child: const Text('Continue'),
                        ),
                      ],
                    ),
                  );

                  if (confirm != true || !mounted) return;
                }

                final recipe = await Navigator.of(context).push<RecipeEntity>(
                  MaterialPageRoute(
                    builder: (_) => RecipeFromTextScreen(
                      showEditWarning: isEdited,
                      onRecipeGenerated: (recipe) {
                        Navigator.of(context).pop(recipe);
                      },
                    ),
                  ),
                );

                if (recipe != null && mounted) {
                  notifier.setRecipe(recipe);
                }
              }
            },
            itemBuilder: (context) => [
              if (widget.recipeId != null)
                const PopupMenuItem<String>(
                  value: 'delete',
                  child: Text('Delete'),
                ),
              const PopupMenuItem<String>(
                value: 'from_image',
                child: Text('Create from image'),
              ),
              const PopupMenuItem<String>(
                value: 'from_url',
                child: Text('Import from URL'),
              ),
              const PopupMenuItem<String>(
                value: 'from_text',
                child: Text('Import from text'),
              ),
            ],
          ),
        ],
      ),
      body: recipeAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(
          child: Text(
            err.toString(),
            style: const TextStyle(color: Colors.red),
          ),
        ),
        data: (recipe) {
          if (recipe == null) {
            return const Center(child: Text('No recipe data'));
          }
          return GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () => FocusScope.of(context).unfocus(),
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  // Show loading indicator when creating from image, or nothing otherwise
                  if (_isGeneratingFromImage)
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: CircularProgressIndicator(),
                    ),
                  RecipeImagePicker(
                    imagePath: recipe.imagePath,
                    onImagePicked: (file) async {
                      await notifier.saveImageAndSetPath(file);
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    initialValue: recipe.name,
                    decoration: const InputDecoration(labelText: 'Name'),
                    onChanged: notifier.setName,
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    initialValue: recipe.description,
                    maxLines: 2,
                    decoration: const InputDecoration(labelText: 'Description'),
                    onChanged: notifier.setDescription,
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    initialValue: recipe.servings.toString(),
                    decoration: const InputDecoration(labelText: 'Servings'),
                    keyboardType: TextInputType.number,
                    onChanged: (v) => notifier.setServings(
                      int.tryParse(v) ?? recipe.servings,
                    ),
                  ),
                  const SizedBox(height: 8),
                  TagsEditor(
                    initialTags: recipe.tags,
                    onTagsChanged: notifier.setTags,
                    tagRecommendations:
                        ref.watch(tagNameRecommendationsProvider).value ?? [],
                  ),
                  const SizedBox(height: 16),
                  // Duration: Tap to edit on a dedicated screen
                  GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () async {
                      final updated = await Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => CookingTimesEditorScreen(
                            preparationTimeMinutes:
                                recipe.preparationTimeMinutes,
                            cookingTimeMinutes: recipe.cookingTimeMinutes,
                          ),
                        ),
                      );
                      if (updated != null && mounted) {
                        notifier.setCookingTimeMinutes(
                          updated['cookingTimeMinutes'] as int,
                        );
                        notifier.setPreparationTimeMinutes(
                          updated['preparationTimeMinutes'] as int,
                        );
                      }
                    },
                    child: SizedBox(
                      width: double.infinity,
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Duration',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'Prep Time: \t${recipe.preparationTimeMinutes} min',
                                style: const TextStyle(fontSize: 16),
                              ),
                              Text(
                                'Cooking Time: \t${recipe.cookingTimeMinutes} min',
                                style: const TextStyle(fontSize: 16),
                              ),
                              const SizedBox(height: 4),
                              const Text(
                                'Tap to edit',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Ingredients Summary: Tap to edit on a dedicated screen
                  GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () async {
                      final updated = await Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => IngredientsEditorScreen(
                            initialIngredients: recipe.ingredients,
                          ),
                        ),
                      );
                      if (updated != null && mounted) {
                        notifier.setIngredients(
                          updated as List<IngredientEntity>,
                        );
                      }
                    },
                    child: SizedBox(
                      width: double.infinity,
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Ingredients',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              ...recipe.ingredients.map(
                                (i) => Text(
                                  '${i.quantity} ${i.unit.abbreviation} ${i.name}',
                                  style: const TextStyle(fontSize: 16),
                                ),
                              ),
                              const SizedBox(height: 4),
                              const Text(
                                'Tap to edit',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Steps Summary: Tap to edit on a dedicated screen
                  GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () async {
                      final updatedSteps = await Navigator.of(context)
                          .push<List<StepEntity>>(
                            MaterialPageRoute(
                              builder: (_) => StepsEditorScreen(
                                initialSteps: recipe.steps,
                                availableIngredients: recipe.ingredients,
                              ),
                            ),
                          );
                      if (updatedSteps != null && mounted) {
                        notifier.setSteps(updatedSteps);
                      }
                    },
                    child: Container(
                      width: double.infinity,
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Steps',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              ...recipe.steps.asMap().entries.map((entry) {
                                final step = entry.value;
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 6,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      if (step.imagePath != null &&
                                          step.imagePath!.isNotEmpty)
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(
                                            8,
                                          ),
                                          child: Image.file(
                                            File(step.imagePath!),
                                            width: double.infinity,
                                            height: 160,
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                      const SizedBox(height: 8),
                                      Text(
                                        '${entry.key + 1}. ${step.instruction}',
                                        style: const TextStyle(fontSize: 16),
                                        softWrap: true,
                                      ),
                                    ],
                                  ),
                                );
                              }),
                              const SizedBox(height: 4),
                              const Text(
                                'Tap to edit',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Nutrition Info Summary: Tap to edit on a dedicated screen
                  GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () async {
                      final updatedNutrition = await Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => NutritionEditorScreen(
                            initial: recipe.nutritionInfo,
                          ),
                        ),
                      );
                      if (updatedNutrition != null && mounted) {
                        notifier.setNutritionInfo(updatedNutrition);
                      }
                    },
                    child: Container(
                      width: double.infinity,
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Nutrition Information',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'Calories: \t${recipe.nutritionInfo.energyKcal ?? '-'} kcal',
                                style: const TextStyle(fontSize: 16),
                              ),
                              Text(
                                'Protein: \t${recipe.nutritionInfo.proteins ?? '-'} g',
                                style: const TextStyle(fontSize: 16),
                              ),
                              Text(
                                'Carbs: \t${recipe.nutritionInfo.carbohydrates ?? '-'} g',
                                style: const TextStyle(fontSize: 16),
                              ),
                              Text(
                                'Fat: \t${recipe.nutritionInfo.fat ?? '-'} g',
                                style: const TextStyle(fontSize: 16),
                              ),
                              const SizedBox(height: 4),
                              const Text(
                                'Tap to edit',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: recipeAsync.isLoading
                        ? null
                        : () async {
                            await notifier.persist();
                            final postSaveState = ref.read(
                              recipeCreationNotifierProvider,
                            );
                            if (mounted &&
                                !postSaveState.isLoading &&
                                postSaveState.error == null) {
                              Navigator.of(context).pop(true);
                            } else if (postSaveState.error != null && mounted) {
                              showDialog(
                                context: context,
                                builder: (_) => AlertDialog(
                                  title: const Text('Error'),
                                  content: Text(postSaveState.error.toString()),
                                  actions: [
                                    TextButton(
                                      child: const Text('OK'),
                                      onPressed: () =>
                                          Navigator.of(context).pop(),
                                    ),
                                  ],
                                ),
                              );
                            }
                          },
                    child: recipeAsync.isLoading
                        ? const CircularProgressIndicator()
                        : const Text('Save'),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
