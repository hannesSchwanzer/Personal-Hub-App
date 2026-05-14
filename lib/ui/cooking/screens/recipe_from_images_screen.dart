import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:personal_hub_app/data/services/recipe_generation_queue.dart';
import 'package:personal_hub_app/domain/entities/food/recipe_entity.dart';
import 'package:personal_hub_app/ui/cooking/widgets/language_selector.dart';

class RecipeFromImagesScreen extends ConsumerStatefulWidget {
  final void Function(RecipeEntity recipe) onRecipeGenerated;
  final bool showEditWarning;

  const RecipeFromImagesScreen({
    super.key,
    required this.onRecipeGenerated,
    this.showEditWarning = false,
  });

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
  bool _isProcessing = false;

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

  Future<void> _onConfirmWaiting() async {
    if (_images.isEmpty) {
      setState(() {
        _error = 'Please select at least one image.';
      });
      return;
    }

    setState(() {
      _isProcessing = true;
      _error = null;
    });

    final notifier = ref.read(recipeGenerationQueueProvider.notifier);

    final files = _images.map((x) => File(x.path)).toList();
    final jobId = await notifier.enqueueFromImages(
      files,
      inputLanguage: _inputLanguage,
      outputLanguage: _outputLanguage,
      keepOriginalSize: _keepOriginalSize,
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
        setState(() {
          _isProcessing = false;
        });
      }
    }
  }

  void _onConfirmAutoSave() {
    if (_images.isEmpty) {
      setState(() {
        _error = 'Please select at least one image.';
      });
      return;
    }

    final notifier = ref.read(recipeGenerationQueueProvider.notifier);

    final files = _images.map((x) => File(x.path)).toList();
    notifier.enqueueFromImages(
      files,
      inputLanguage: _inputLanguage,
      outputLanguage: _outputLanguage,
      keepOriginalSize: _keepOriginalSize,
      autoSave: true,
    );

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    

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

          if (_isProcessing)
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: CircularProgressIndicator(),
            ),

          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton.icon(
                    icon: const Icon(Icons.photo),
                    label: const Text('Gallery'),
                    onPressed: _isProcessing ? null : _pickImagesFromGallery,
                  ),
                  ElevatedButton.icon(
                    icon: const Icon(Icons.camera_alt),
                    label: const Text('Camera'),
                    onPressed: _isProcessing ? null : _pickImageFromCamera,
                  ),
                ],
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton.icon(
                    icon: const Icon(Icons.done),
                    label: const Text('Confirm - Wait'),
                    onPressed: _isProcessing ? null : _onConfirmWaiting,
                  ),
                  ElevatedButton.icon(
                    icon: const Icon(Icons.save),
                    label: const Text('Confirm - Auto Save'),
                    onPressed: _isProcessing ? null : _onConfirmAutoSave,
                  ),
                ],
              ),
            ],
          ),

          const SizedBox(height: 12),
        ],
      ),
    );
  }
}
