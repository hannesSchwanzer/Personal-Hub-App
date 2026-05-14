import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:personal_hub_app/data/services/recipe_generation_queue.dart';
import 'package:personal_hub_app/domain/entities/food/recipe_entity.dart';
import 'package:personal_hub_app/ui/cooking/widgets/language_selector.dart';

class RecipeFromTextScreen extends ConsumerStatefulWidget {
  final void Function(RecipeEntity recipe) onRecipeGenerated;
  final bool showEditWarning;

  const RecipeFromTextScreen({
    super.key,
    required this.onRecipeGenerated,
    this.showEditWarning = false,
  });

  @override
  ConsumerState<RecipeFromTextScreen> createState() =>
      _RecipeFromTextScreenState();
}

class _RecipeFromTextScreenState extends ConsumerState<RecipeFromTextScreen> {
  final TextEditingController _textController = TextEditingController();

  String? _inputLanguage;
  String? _outputLanguage;
  String? _error;
  bool _isProcessing = false;

  Future<void> _onConfirmWaiting() async {
    if (_textController.text.trim().isEmpty) {
      setState(() => _error = 'Please enter recipe text.');
      return;
    }

    setState(() {
      _error = null;
      _isProcessing = true;
    });

    final notifier = ref.read(recipeGenerationQueueProvider.notifier);

    final jobId = await notifier.enqueueFromText(
      _textController.text.trim(),
      inputLanguage: _inputLanguage,
      outputLanguage: _outputLanguage,
    );

    try {
      final recipe = await notifier.waitForJob(jobId);
      widget.onRecipeGenerated(recipe);
    } catch (e) {
      setState(() {
        _error = 'Failed to generate recipe: $e';
      });
    } finally {
      if (mounted) {
        setState(() => _isProcessing = false);
      }
    }
  }

  Future<void> _onConfirmAutoSave() async {
    if (_textController.text.trim().isEmpty) {
      setState(() => _error = 'Please enter recipe text.');
      return;
    }

    setState(() {
      _error = null;
      _isProcessing = true;
    });

    final notifier = ref.read(recipeGenerationQueueProvider.notifier);

    notifier.enqueueFromText(
      _textController.text.trim(),
      inputLanguage: _inputLanguage,
      outputLanguage: _outputLanguage,
    );
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Import from Text')),
      body: Column(
        children: [
          if (widget.showEditWarning) _warning(),

          if (_error != null) _errorText(),

          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: _textController,
              maxLines: 10,
              decoration: const InputDecoration(
                labelText: 'Paste recipe text',
                border: OutlineInputBorder(),
              ),
            ),
          ),

          _languageSection(),

          if (_isProcessing)
            const Padding(
              padding: EdgeInsets.all(12),
              child: CircularProgressIndicator(),
            ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton.icon(
                icon: const Icon(Icons.done),
                label: const Text('Generate'),
                onPressed: _isProcessing ? null : _onConfirmWaiting,
              ),
              ElevatedButton.icon(
                icon: const Icon(Icons.save),
                label: const Text('Auto-Save'),
                onPressed: _isProcessing ? null : _onConfirmAutoSave,
              ),
            ],
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
