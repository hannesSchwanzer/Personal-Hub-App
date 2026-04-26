import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:personal_hub_app/domain/entities/cooking/recipe_entity.dart';
import 'package:personal_hub_app/ui/cooking/view_models/recipe_generation_view_model.dart';
import 'package:personal_hub_app/ui/cooking/widgets/language_selector.dart';

class RecipeFromUrlScreen extends ConsumerStatefulWidget {
  final void Function(RecipeEntity recipe) onRecipeGenerated;
  final bool showEditWarning;

  const RecipeFromUrlScreen({
    Key? key,
    required this.onRecipeGenerated,
    this.showEditWarning = false,
  }) : super(key: key);

  @override
  ConsumerState<RecipeFromUrlScreen> createState() =>
      _RecipeFromUrlScreenState();
}

class _RecipeFromUrlScreenState
    extends ConsumerState<RecipeFromUrlScreen> {
  final TextEditingController _urlController = TextEditingController();

  String? _inputLanguage;
  String? _outputLanguage;
  bool _useAiParsing = false;

  String? _error;

  Future<void> _onConfirm() async {
    if (_urlController.text.trim().isEmpty) {
      setState(() => _error = 'Please enter a URL.');
      return;
    }

    final notifier = ref.read(recipeGenerationNotifierProvider.notifier);

    try {
      final recipe = await notifier.generateFromUrl(
        _urlController.text.trim(),
        inputLanguage: _inputLanguage,
        outputLanguage: _outputLanguage,
        useAiForParsing: _useAiParsing,
      );

      if (!mounted) return;
      widget.onRecipeGenerated(recipe);
    } catch (e) {
      setState(() => _error = 'Failed: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(recipeGenerationNotifierProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Import from URL')),
      body: Column(
        children: [
          if (widget.showEditWarning)
            _warning(),

          if (_error != null)
            _errorText(),

          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: _urlController,
              decoration: const InputDecoration(
                labelText: 'Recipe URL',
                border: OutlineInputBorder(),
              ),
            ),
          ),

          _languageSection(),

          Row(
            children: [
              Checkbox(
                value: _useAiParsing,
                onChanged: (v) => setState(() => _useAiParsing = v ?? false),
              ),
              const Expanded(child: Text('Use AI for parsing')),
            ],
          ),

          if (state.isLoading)
            const Padding(
              padding: EdgeInsets.all(12),
              child: CircularProgressIndicator(),
            ),

          ElevatedButton.icon(
            icon: const Icon(Icons.done),
            label: const Text('Generate'),
            onPressed: state.isLoading ? null : _onConfirm,
          ),
        ],
      ),
    );
  }

  Widget _languageSection() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            LanguageSelector(
              label: 'Input Language',
              onChanged: (v) => _inputLanguage = v,
            ),
            const SizedBox(height: 12),
            LanguageSelector(
              label: 'Output Language',
              onChanged: (v) => _outputLanguage = v,
            ),
          ],
        ),
      );

  Widget _warning() => Container(
        color: Colors.yellow[200],
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.all(16),
        child: const Text(
          'Warning: This will overwrite current changes.',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      );

  Widget _errorText() => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(_error!, style: const TextStyle(color: Colors.red)),
      );
}
