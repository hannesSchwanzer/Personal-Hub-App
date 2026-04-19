import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:personal_hub_app/domain/entities/cooking/recipe_entity.dart';
import 'package:personal_hub_app/domain/repositories/recipe_repository.dart';
import 'package:personal_hub_app/utils/providers.dart';

/// State for servings and ingredient scaling for a recipe detail view.
class RecipeDetailState {
  final int servings;
  final RecipeEntity recipe;

  const RecipeDetailState({required this.servings, required this.recipe});

  RecipeDetailState copyWith({int? servings, RecipeEntity? recipe}) =>
      RecipeDetailState(
        servings: servings ?? this.servings,
        recipe: recipe ?? this.recipe,
      );
}

/// Notifier for managing and fetching recipe details using Riverpod 3 best practices (async, family by recipeId).
class RecipeDetailNotifier extends AsyncNotifier<RecipeDetailState?> {
  static const int minServings = 1;
  static const int maxServings = 20;
  late final RecipeRepository _repository;
  final String recipeId;

  RecipeDetailNotifier(this.recipeId);

  @override
  Future<RecipeDetailState?> build() async {
    _repository = ref.read(recipeRepositoryProvider);
    _repository.watchRecipe(recipeId).listen((recipe) {
      if (recipe == null) {
        state = const AsyncValue.data(null);
      } else {
        final oldServings = state.value?.servings ?? recipe.servings;
        state = AsyncValue.data(
          RecipeDetailState(servings: oldServings, recipe: recipe),
        );
      }
    });
    final first = await _repository.getRecipe(recipeId);
    if (first == null) return null;
    return RecipeDetailState(servings: first.servings, recipe: first);
  }

  /// Updates the servings and notifies listeners. Clamps state within min/max.
  void setServings(int value) {
    if (state.value == null) return;
    if (value < minServings || value > maxServings) return;
    state = AsyncValue.data(state.value!.copyWith(servings: value));
  }

  void increment() => setServings((state.value?.servings ?? minServings) + 1);
  void decrement() => setServings((state.value?.servings ?? minServings) - 1);

  double get scalingFactor {
    if (state.value == null) return 1.0;
    return state.value!.servings / (state.value!.recipe.servings == 0 ? 1 : state.value!.recipe.servings);
  }

  /// Returns the list of ingredients, scaled for current servings.
  List<IngredientEntity> get scaledIngredients {
    if (state.value == null) return [];
    return state.value!.recipe.ingredients
            .map((i) => i.copyWith(quantity: i.quantity * scalingFactor))
        .toList();
  }
}

final recipeDetailProvider = AsyncNotifierProvider.autoDispose
    .family<RecipeDetailNotifier, RecipeDetailState?, String>(
      RecipeDetailNotifier.new
    );
