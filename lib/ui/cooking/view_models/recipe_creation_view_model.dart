/// View model for recipe creation and editing.
/// Handles both creation of new recipes and editing existing ones.
/// Persists data using the injected RecipeRepository via Riverpod.
import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:personal_hub_app/data/services/recipe_generate_service.dart';
import 'package:personal_hub_app/domain/entities/cooking/recipe_entity.dart';
import 'package:personal_hub_app/domain/repositories/recipe_repository.dart';
import 'package:personal_hub_app/utils/providers.dart';
import 'package:personal_hub_app/data/services/image_service.dart';

/// Provider for the RecipeCreationNotifier via Riverpod, handles async state.
final recipeCreationNotifierProvider =
    AsyncNotifierProvider<RecipeCreationNotifier, RecipeEntity?>(
      RecipeCreationNotifier.new,
    );

/// Providers to get the available ingredient and tag recommendations for autocomplete fields as streams (for real-time updates).
final ingredientNameRecommendationsProvider = StreamProvider<List<String>>((
  ref,
) {
  final repo = ref.read(recipeRepositoryProvider);
  return repo.watchAllIngredientNames();
});

final tagNameRecommendationsProvider = StreamProvider<List<String>>((ref) {
  final repo = ref.read(recipeRepositoryProvider);
  return repo.watchAllTagNames();
});

/// Notifier for recipe creation/editing. Exposes the current RecipeEntity being
/// edited or created. All state changes and persistence are handled here.
class RecipeCreationNotifier extends AsyncNotifier<RecipeEntity?> {
  /// Deletes the currently loaded recipe. Sets state to loading during deletion and error if deletion fails.
  Future<void> deleteRecipe() async {
    final recipe = state.value;
    if (recipe == null || recipe.id.isEmpty) return;
    state = const AsyncLoading();
    try {
      await _repository.deleteRecipe(recipe.id);
      state = const AsyncData(null); // Recipe deleted, clear state
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }

  late RecipeRepository _repository;
  late ImageService _imageService;

  /// Initialize dependencies.
  @override
  Future<RecipeEntity> build() async {
    _repository = ref.read(recipeRepositoryProvider);
    _imageService = ref.read(imageServiceProvider);
    return RecipeEntity(
      id: '',
      name: '',
      description: '',
      ingredients: [],
      steps: [],
      tags: [],
      servings: 1,
      cookingTimeMinutes: 0,
      preparationTimeMinutes: 0,
      nutritionInfo: NutritionInfoEntity(calories: 0),
      imagePath: '',
    );
  }

  /// Loads a recipe for editing, or starts a new one if [recipeId] is null or empty.
  Future<void> load(String? recipeId) async {
    state = const AsyncLoading();
    if (recipeId == null || recipeId.isEmpty) {
      // New recipe
      state = AsyncData(
        RecipeEntity(
          id: '',
          name: '',
          description: '',
          ingredients: [],
          steps: [],
          tags: [],
          servings: 1,
          cookingTimeMinutes: 0,
          preparationTimeMinutes: 0,
          nutritionInfo: NutritionInfoEntity(calories: 0),
          imagePath: '',
        ),
      );
      return;
    }
    try {
      final existing = await _repository.getRecipe(recipeId);
      if (existing != null) {
        state = AsyncData(existing);
      } else {
        state = AsyncError("Recipe not found", StackTrace.current);
      }
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }

  /// Persists the current recipe; creates if new (id == ''), updates otherwise.
  Future<void> persist() async {
    final recipe = state.value;
    if (recipe == null) return;
    state = const AsyncLoading();
    try {
      if (recipe.id.isEmpty) {
        await _repository.insertRecipe(recipe.copyWith(id: ''));
      } else {
        await _repository.updateRecipe(recipe);
      }
      // Optionally, reload or clear state after saving
      state = AsyncData(recipe);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }

  void setRecipe(RecipeEntity recipe) {
    state = AsyncData(recipe);
  }

  // UI setters for each recipe field
  void setName(String name) {
    _updateRecipe((r) => r.copyWith(name: name));
  }

  void setDescription(String description) {
    _updateRecipe((r) => r.copyWith(description: description));
  }

  void setServings(int servings) {
    _updateRecipe((r) => r.copyWith(servings: servings));
  }

  void setCookingTimeMinutes(int minutes) {
    _updateRecipe((r) => r.copyWith(cookingTimeMinutes: minutes));
  }

  void setPreparationTimeMinutes(int minutes) {
    _updateRecipe((r) => r.copyWith(preparationTimeMinutes: minutes));
  }

  void setImageUrl(String url) {
    _updateRecipe((r) => r.copyWith(imagePath: url));
  }

  /// Save the picked image internally and update recipe imageUrl with path.
  Future<void> saveImageAndSetPath(File file) async {
    try {
      final savedPath = await _imageService.saveImage(file);
      setImageUrl(savedPath);
    } catch (e) {
      // Optionally, handle error
    }
  }

  void setNutritionInfo(NutritionInfoEntity info) {
    _updateRecipe((r) => r.copyWith(nutritionInfo: info));
  }

  void setIngredients(List<IngredientEntity> ingredients) {
    _updateRecipe((r) => r.copyWith(ingredients: ingredients));
  }

  void addIngredient(IngredientEntity ing) {
    _updateRecipe(
      (r) => r.copyWith(
        ingredients: List<IngredientEntity>.from(r.ingredients)..add(ing),
      ),
    );
  }

  void removeIngredient(int index) {
    _updateRecipe((r) {
      final list = List<IngredientEntity>.from(r.ingredients)..removeAt(index);
      return r.copyWith(ingredients: list);
    });
  }

  void setSteps(List<StepEntity> steps) {
    _updateRecipe((r) => r.copyWith(steps: steps));
  }

  void addStep(StepEntity step) {
    _updateRecipe(
      (r) => r.copyWith(steps: List<StepEntity>.from(r.steps)..add(step)),
    );
  }

  void removeStep(int index) {
    _updateRecipe((r) {
      final list = List<StepEntity>.from(r.steps)..removeAt(index);
      return r.copyWith(steps: list);
    });
  }

  void setTags(List<String> tags) {
    _updateRecipe((r) => r.copyWith(tags: tags));
  }

  /// Returns true if the recipe has unsaved changes (i.e., edits compared to a pristine/newly loaded state).
  /// For simplicity, this checks if the state.hasValue and the recipeId is empty, or compares with the last loaded entity.
  /// Adapt comparison logic as needed for deep-diff in the future.
  bool hasUnsavedChanges() {
    // In a real app, this should compare the current state.recipe to the original loaded one.
    // Here, we simply check if id is empty or any field has likely changed (as a basic heuristic).
    final recipe = state.value;
    if (recipe == null) return false;
    // If id is still empty after loading, consider it new/unsaved.
    return recipe.id.isEmpty ||
        recipe.name.isNotEmpty ||
        recipe.ingredients.isNotEmpty ||
        recipe.steps.isNotEmpty;
  }

  /// Helper to safely update the recipe if present.
  void _updateRecipe(RecipeEntity Function(RecipeEntity) update) {
    final recipe = state.value;
    if (recipe == null) return;
    state = AsyncData(update(recipe));
  }
}
