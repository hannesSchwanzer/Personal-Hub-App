import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:personal_hub_app/ui/cooking/screens/recipe_creation_screen.dart';
import 'package:personal_hub_app/ui/cooking/screens/recipe_detail_screen.dart';
import 'package:personal_hub_app/ui/cooking/view_models/recipe_index_view_model.dart';
import 'package:personal_hub_app/ui/cooking/widgets/advanced_search_panel.dart';
import 'package:personal_hub_app/domain/entities/cooking/recipe_entity.dart';

/// The main screen for browsing recipes.
class RecipeIndexScreen extends ConsumerStatefulWidget {
  const RecipeIndexScreen({super.key});

  @override
  ConsumerState<RecipeIndexScreen> createState() => _RecipeIndexScreenState();
}

class _RecipeIndexScreenState extends ConsumerState<RecipeIndexScreen> {
  final _searchController = TextEditingController();

  /// Resets all search filters and controllers to their initial state.
  void _clearFilters() {
    _searchController.clear();
    ref
        .read(recipeIndexViewModelProvider.notifier)
        .setFilters(const RecipeSearchFilters());
    setState(() {
      // AdvancedSearchPanel and filter state will be reset by provider update
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _onSearch(String? value) {
    final prev = ref.read(recipeIndexViewModelProvider.notifier).filters;
    ref
        .read(recipeIndexViewModelProvider.notifier)
        .setFilters(
          prev.copyWith(searchString: value?.isEmpty ?? true ? null : value),
        );
  }

  @override
  Widget build(BuildContext context) {
    final asyncRecipes = ref.watch(recipeIndexViewModelProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Recipes')),
      body: Column(
        children: [
          // Search and filters row
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    // Search field
                    Expanded(
                      child: TextField(
                        controller: _searchController,
                        decoration: InputDecoration(
                          labelText: 'Search',
                          prefixIcon: const Icon(Icons.search),
                          border: const OutlineInputBorder(),
                          isDense: true,
                        ),
                        onChanged: _onSearch,
                      ),
                    ),
                    const SizedBox(width: 8),
                    // Clear button
                    ElevatedButton(
                      onPressed: _clearFilters,
                      child: const Text('Clear'),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                // Advanced Search Expansion
                AdvancedSearchPanel(
                  filters: ref
                      .read(recipeIndexViewModelProvider.notifier)
                      .filters,
                  onFiltersChanged: (newFilters) {
                    ref
                        .read(recipeIndexViewModelProvider.notifier)
                        .setFilters(newFilters);
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: asyncRecipes.when(
              data: (recipes) => recipes.isEmpty
                  ? const Center(child: Text('No recipes found'))
                  : GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount:
                                2, // Two columns, adjust as necessary
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10,
                            childAspectRatio: 0.95, // Control grid tile height
                          ),
                      padding: const EdgeInsets.all(8),
                      itemCount: recipes.length,
                      itemBuilder: (context, idx) {
                        return RecipeGridTile(recipe: recipes[idx]);
                      },
                    ),
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, st) => Center(child: Text('Error loading recipes')),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Create new recipe',
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const RecipeCreationScreen(),
            ),
          );
        },
      ),
    );
  }
}

/// Shows a single recipe as a list tile with image (if available), name, and a truncated description.
/// Tapping navigates to details (not implemented yet).
/// A tile widget that displays image, title, and cooking time in a fixed grid layout.
class RecipeGridTile extends StatelessWidget {
  final RecipeEntity recipe;
  const RecipeGridTile({required this.recipe, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => RecipeDetailScreen(recipeId: recipe.id),
          ),
        );
      },
      borderRadius: BorderRadius.circular(12),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.03),
              blurRadius: 3,
              offset: const Offset(1, 2),
            ),
          ],
        ),
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Recipe Image
            SizedBox(
              height: 90,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: recipe.imagePath.isNotEmpty
                    ? Image.file(
                        File(recipe.imagePath),
                        width: double.infinity,
                        fit: BoxFit.cover,
                        errorBuilder: (c, e, st) => Container(
                          color: Colors.grey[300],
                          child: const Icon(
                            Icons.image_not_supported,
                            size: 38,
                          ),
                        ),
                      )
                    : Container(
                        color: Colors.grey[200],
                        child: const Icon(Icons.restaurant_menu, size: 40),
                      ),
              ),
            ),
            const SizedBox(height: 8),
            Flexible(
              child: Center(
                child: Text(
                  recipe.name,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.titleMedium,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                const Icon(Icons.schedule, size: 18, color: Colors.grey),
                const SizedBox(width: 4),
                Text(
                  '${recipe.preparationTimeMinutes + recipe.cookingTimeMinutes} min',
                  style: Theme.of(
                    context,
                  ).textTheme.bodySmall?.copyWith(color: Colors.grey[700]),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
