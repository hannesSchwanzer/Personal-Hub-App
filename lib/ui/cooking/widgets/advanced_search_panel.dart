import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:personal_hub_app/ui/cooking/widgets/ingredient_names_editor.dart';
import 'package:personal_hub_app/ui/cooking/widgets/tags_editor.dart';
import 'package:personal_hub_app/ui/cooking/view_models/recipe_creation_view_model.dart';
import 'package:personal_hub_app/ui/cooking/view_models/recipe_index_view_model.dart';

/// An advanced search panel for setting detailed recipe filters including fuzzy search,
/// ingredient/tag controls, and matching options.
///
/// All fields of [RecipeSearchFilters] are supported.
/// Accepts updated filters via [onFiltersChanged].
class AdvancedSearchPanel extends ConsumerStatefulWidget {
  final RecipeSearchFilters filters;
  final ValueChanged<RecipeSearchFilters> onFiltersChanged;

  const AdvancedSearchPanel({
    Key? key,
    required this.filters,
    required this.onFiltersChanged,
  }) : super(key: key);

  @override
  ConsumerState<AdvancedSearchPanel> createState() => _AdvancedSearchPanelState();
}

class _AdvancedSearchPanelState extends ConsumerState<AdvancedSearchPanel> {
  late bool _fuzzy;
  late List<String> _ingredientList;
  late bool _ingredientAllMustMatch;
  late List<String> _tagList;
  late bool _tagAllMustMatch;

  @override
  void initState() {
    super.initState();
    _initFields();
  }

  @override
  void didUpdateWidget(covariant AdvancedSearchPanel oldWidget) {
    if (oldWidget.filters != widget.filters) {
      _initFields();
    }
    super.didUpdateWidget(oldWidget);
  }

  void _initFields() {
    _fuzzy = widget.filters.fuzzy;
    _ingredientList = List.of(widget.filters.ingredientList ?? []);
    _ingredientAllMustMatch = widget.filters.ingredientAllMustMatch;
    _tagList = List.of(widget.filters.tagList ?? []);
    _tagAllMustMatch = widget.filters.tagAllMustMatch;
    setState(() {});
  }

  void _notifyChange() {
    widget.onFiltersChanged(
      widget.filters.copyWith(
        fuzzy: _fuzzy,
        ingredientList: _ingredientList,
        ingredientAllMustMatch: _ingredientAllMustMatch,
        tagList: _tagList,
        tagAllMustMatch: _tagAllMustMatch,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final ingredientAsync = ref.watch(ingredientNameRecommendationsProvider);
    final tagAsync = ref.watch(tagNameRecommendationsProvider);
    return ExpansionTile(
      title: const Text('Advanced Search'),
      childrenPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      initiallyExpanded: false,
      children: [
        CheckboxListTile(
          value: _fuzzy,
          onChanged: (v) => setState(() {
            _fuzzy = v ?? false;
            _notifyChange();
          }),
          title: const Text('Fuzzy search'),
          controlAffinity: ListTileControlAffinity.leading,
        ),
        ingredientAsync.when(
          data: (suggestions) => IngredientNamesEditor(
            initialIngredients: _ingredientList,
            onChanged: (list) {
              setState(() {
                _ingredientList = list;
                _notifyChange();
              });
            },
            ingredientRecommendations: suggestions,
          ),
          loading: () => const LinearProgressIndicator(),
          error: (e, st) => const Text('Failed to load ingredient suggestions'),
        ),
        CheckboxListTile(
          value: _ingredientAllMustMatch,
          onChanged: (v) => setState(() {
            _ingredientAllMustMatch = v ?? false;
            _notifyChange();
          }),
          title: const Text('Require all ingredients'),
          controlAffinity: ListTileControlAffinity.leading,
        ),
        const Divider(),
        tagAsync.when(
          data: (suggestions) => TagsEditor(
            initialTags: _tagList,
            onTagsChanged: (list) {
              setState(() {
                _tagList = list;
                _notifyChange();
              });
            },
            tagRecommendations: suggestions,
          ),
          loading: () => const LinearProgressIndicator(),
          error: (e, st) => const Text('Failed to load tag suggestions'),
        ),
        CheckboxListTile(
          value: _tagAllMustMatch,
          onChanged: (v) => setState(() {
            _tagAllMustMatch = v ?? false;
            _notifyChange();
          }),
          title: const Text('Require all tags'),
          controlAffinity: ListTileControlAffinity.leading,
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}

