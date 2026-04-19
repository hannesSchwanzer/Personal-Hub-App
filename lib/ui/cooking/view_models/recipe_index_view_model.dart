import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:personal_hub_app/domain/entities/cooking/recipe_entity.dart';
import 'package:personal_hub_app/domain/repositories/recipe_repository.dart';
import 'package:personal_hub_app/utils/providers.dart';

/// Holds search/filter parameters for the recipe list UI.
class RecipeSearchFilters {
  final String? searchString;
  final bool fuzzy;
  final List<String>? ingredientList;
  final bool ingredientAllMustMatch;
  final List<String>? tagList;
  final bool tagAllMustMatch;

  const RecipeSearchFilters({
    this.searchString,
    this.fuzzy = false,
    this.ingredientList,
    this.ingredientAllMustMatch = false,
    this.tagList,
    this.tagAllMustMatch = false,
  });

  RecipeSearchFilters copyWith({
    String? searchString,
    bool? fuzzy,
    List<String>? ingredientList,
    bool? ingredientAllMustMatch,
    List<String>? tagList,
    bool? tagAllMustMatch,
  }) {
    return RecipeSearchFilters(
      searchString: searchString ?? this.searchString,
      fuzzy: fuzzy ?? this.fuzzy,
      ingredientList: ingredientList ?? this.ingredientList,
      ingredientAllMustMatch: ingredientAllMustMatch ?? this.ingredientAllMustMatch,
      tagList: tagList ?? this.tagList,
      tagAllMustMatch: tagAllMustMatch ?? this.tagAllMustMatch,
    );
  }
}

/// ViewModel for the Recipe Index Screen using Riverpod's AsyncNotifier.
/// Handles loading, searching, filtering recipes, and exposing the filter state.
/// ViewModel for the Recipe Index Screen using Riverpod's StreamNotifier.
/// Handles loading, searching, filtering recipes, and exposing the filter state.
class RecipeIndexViewModel extends StreamNotifier<List<RecipeEntity>> {
  late RecipeRepository _recipeRepository;

  RecipeSearchFilters _filters = const RecipeSearchFilters();

  /// Current filters. Exposed for the UI to read.
  RecipeSearchFilters get filters => _filters;

  /// Override the build method for StreamNotifier.
  @override
  Stream<List<RecipeEntity>> build() {
    _recipeRepository = ref.watch(recipeRepositoryProvider);
    return _watchRecipes();
  }

  /// Watches recipes using the current filters stream, auto-updates as data changes.
  Stream<List<RecipeEntity>> _watchRecipes() {
    return _recipeRepository.watchSearchRecipes(
      searchString: _filters.searchString,
      fuzzy: _filters.fuzzy,
      ingredientList: _filters.ingredientList,
      ingredientAllMustMatch: _filters.ingredientAllMustMatch,
      tagList: _filters.tagList,
      tagAllMustMatch: _filters.tagAllMustMatch,
    );
  }

  /// Sets new filters and triggers stream update.
  Future<void> setFilters(RecipeSearchFilters filters) async {
    _filters = filters;
    // Rebuilds the stream with the new filters.
    state = AsyncLoading();
    ref.invalidateSelf();
  }

  /// Refresh trigger: re-invalidate self so stream reloads.
  Future<void> refresh() async {
    ref.invalidateSelf();
  }
}

/// Provider for the RecipeIndexViewModel (depends on RecipeRepository).
final recipeIndexViewModelProvider = StreamNotifierProvider
    .autoDispose<RecipeIndexViewModel, List<RecipeEntity>>(RecipeIndexViewModel.new);

