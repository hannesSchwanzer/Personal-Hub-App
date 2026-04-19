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
    ref.read(recipeIndexViewModelProvider.notifier).setFilters(const RecipeSearchFilters());
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
                  filters: ref.read(recipeIndexViewModelProvider.notifier).filters,
                  onFiltersChanged: (newFilters) {
                    ref.read(recipeIndexViewModelProvider.notifier).setFilters(newFilters);
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: asyncRecipes.when(
              data: (recipes) => recipes.isEmpty
                  ? const Center(child: Text('No recipes found'))
                  : ListView.separated(
                      itemCount: recipes.length,
                      separatorBuilder: (_, _) => const Divider(height: 0),
                      itemBuilder: (context, idx) {
                        return _RecipeListTile(recipe: recipes[idx]);
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
class _RecipeListTile extends StatelessWidget {
  final RecipeEntity recipe;
  static const int maxDescriptionLength = 120;

  const _RecipeListTile({required this.recipe});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: recipe.imagePath.isNotEmpty
          ? ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Image.file(
                File(recipe.imagePath),
                width: 54,
                height: 54,
                fit: BoxFit.cover,
                errorBuilder: (c, e, st) =>
                    const Icon(Icons.image_not_supported),
              ),
            )
          : Container(
              width: 54,
              height: 54,
              decoration: BoxDecoration(
                color: Colors.grey[250],
                borderRadius: BorderRadius.circular(6),
              ),
              child: const Icon(Icons.restaurant_menu, size: 32),
            ),
      title: Text(recipe.name, maxLines: 1, overflow: TextOverflow.ellipsis),
      subtitle: Text(
        _truncDesc(recipe.description),
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => RecipeDetailScreen(recipeId: recipe.id),
          ),
        );
      },
    );
  }

  /// Truncate description safely to [maxDescriptionLength]
  String _truncDesc(String desc) {
    if (desc.length <= maxDescriptionLength) return desc;
    return '${desc.substring(0, maxDescriptionLength - 1)}…';
  }
}

