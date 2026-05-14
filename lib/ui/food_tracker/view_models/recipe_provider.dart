import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:personal_hub_app/domain/entities/food/recipe_entity.dart';
import 'package:personal_hub_app/utils/providers.dart';


/// Riverpod provider for accessing available recipes (replace with repo access later).
final recipeListProvider = StreamProvider<List<RecipeEntity>>((ref) {
  final repo = ref.read(recipeRepositoryProvider);
  return repo.watchAllRecipes();
});

