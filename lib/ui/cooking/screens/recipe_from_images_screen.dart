import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:personal_hub_app/ui/cooking/view_models/recipe_generation_view_model.dart';
import 'package:personal_hub_app/domain/entities/cooking/recipe_entity.dart';
import 'package:personal_hub_app/ui/cooking/widgets/language_selector.dart';

class RecipeFromImagesScreen extends ConsumerStatefulWidget {
  final void Function(RecipeEntity recipe) onRecipeGenerated;
  final bool showEditWarning;

  const RecipeFromImagesScreen({
    Key? key,
    required this.onRecipeGenerated,
    this.showEditWarning = false,
  }) : super(key: key);

  @override
  ConsumerState<RecipeFromImagesScreen> createState() =>
      _RecipeFromImagesScreenState();
}

class _RecipeFromImagesScreenState
    extends ConsumerState<RecipeFromImagesScreen> {
  final ImagePicker _picker = ImagePicker();
  final List<XFile> _images = [];
  String? _inputLanguage;
  String? _outputLanguage;
  bool _keepOriginalSize = false;

  String? _error;

  Future<void> _pickImagesFromGallery() async {
    final selected = await _picker.pickMultiImage();
    if (selected.isNotEmpty) {
      setState(() {
        _images.addAll(selected);
        _error = null;
      });
    }
  }

  Future<void> _pickImageFromCamera() async {
    final picked = await _picker.pickImage(source: ImageSource.camera);
    if (picked != null) {
      setState(() {
        _images.add(picked);
        _error = null;
      });
    }
  }

  Future<void> _onConfirm() async {
    if (_images.isEmpty) {
      setState(() {
        _error = 'Please select at least one image.';
      });
      return;
    }

    final notifier = ref.read(recipeGenerationNotifierProvider.notifier);

    try {
      final files = _images.map((x) => File(x.path)).toList();

      final recipe = await notifier.generateFromImages(files, inputLanguage: _inputLanguage, outputLanguage: _outputLanguage, keepOriginalSize: _keepOriginalSize);

      if (!mounted) return;

      widget.onRecipeGenerated(recipe);
    } catch (e) {
      setState(() {
        _error = 'Failed to generate recipe: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(recipeGenerationNotifierProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Select Images')),
      body: Column(
        children: [
          if (widget.showEditWarning)
            Container(
              color: Colors.yellow[200],
              padding: const EdgeInsets.all(12),
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: const Text(
                'Warning: This will overwrite current changes.',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),

          if (_error != null)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(_error!, style: const TextStyle(color: Colors.red)),
            ),

          // 🔥 NEW SETTINGS SECTION
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                LanguageSelector(
                  label: 'Input Language',
                  onChanged: (value) => _inputLanguage = value,
                ),
                const SizedBox(height: 12),
                LanguageSelector(
                  label: 'Output Language',
                  onChanged: (value) => _outputLanguage = value,
                ),
                const SizedBox(height: 12),

                Row(
                  children: [
                    Checkbox(
                      value: _keepOriginalSize,
                      onChanged: (value) {
                        setState(() {
                          _keepOriginalSize = value ?? false;
                        });
                      },
                    ),
                    const Expanded(child: Text('Keep original image size')),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 8),

          Expanded(
            child: _images.isEmpty
                ? const Center(child: Text('No images selected.'))
                : GridView.builder(
                    padding: const EdgeInsets.all(10),
                    itemCount: _images.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 8,
                        ),
                    itemBuilder: (_, i) => Stack(
                      children: [
                        Positioned.fill(
                          child: Image.file(
                            File(_images[i].path),
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          right: 0,
                          top: 0,
                          child: IconButton(
                            icon: const Icon(Icons.cancel),
                            onPressed: () =>
                                setState(() => _images.removeAt(i)),
                          ),
                        ),
                      ],
                    ),
                  ),
          ),

          if (state.isLoading)
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: CircularProgressIndicator(),
            ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton.icon(
                icon: const Icon(Icons.photo),
                label: const Text('Gallery'),
                onPressed: state.isLoading ? null : _pickImagesFromGallery,
              ),
              ElevatedButton.icon(
                icon: const Icon(Icons.camera_alt),
                label: const Text('Camera'),
                onPressed: state.isLoading ? null : _pickImageFromCamera,
              ),
              ElevatedButton.icon(
                icon: const Icon(Icons.done),
                label: const Text('Confirm'),
                onPressed: state.isLoading ? null : _onConfirm,
              ),
            ],
          ),

          const SizedBox(height: 12),
        ],
      ),
    );
  }
}
