import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

/// Screen for picking multiple images from device (gallery or camera) to generate a recipe.
/// Shows previews of selected images and allows confirmation.
/// Integrate into flow by calling onImagesPicked callback when the user confirms selection.
class RecipeFromImagesScreen extends StatefulWidget {
  /// Called with the picked images on confirmation
  final void Function(List<XFile> images) onImagesPicked;

  /// Optional: warning that the recipe will be overwritten if already edited
  final bool showEditWarning;

  const RecipeFromImagesScreen({
    Key? key,
    required this.onImagesPicked,
    this.showEditWarning = false,
  }) : super(key: key);

  @override
  State<RecipeFromImagesScreen> createState() => _RecipeFromImagesScreenState();
}

class _RecipeFromImagesScreenState extends State<RecipeFromImagesScreen> {
  final ImagePicker _picker = ImagePicker();
  final List<XFile> _images = [];
  bool _loading = false;
  String? _error;

  /// Pick multiple images from gallery
  Future<void> _pickImagesFromGallery() async {
    final selected = await _picker.pickMultiImage();
    if (selected.isNotEmpty) {
      setState(() {
        _images.addAll(selected);
        _error = null;
      });
    }
  }

  /// Pick a single image using the camera
  Future<void> _pickImageFromCamera() async {
    final picked = await _picker.pickImage(source: ImageSource.camera);
    if (picked != null) {
      setState(() {
        _images.add(picked);
        _error = null;
      });
    }
  }

  void _onConfirm() {
    if (_images.isEmpty) {
      setState(() {
        _error = 'Please select at least one image.';
      });
      return;
    }
    widget.onImagesPicked(_images);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Images'),
      ),
      body: Column(
        children: [
          if (widget.showEditWarning)
            Container(
              color: Colors.yellow[200],
              padding: const EdgeInsets.all(12),
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: const Text(
                'Warning: Generating a recipe from images will overwrite any current changes.',
                style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
              ),
            ),
          if (_error != null)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(_error!, style: const TextStyle(color: Colors.red)),
            ),
          Expanded(
            child: _images.isEmpty
                ? const Center(child: Text('No images selected.'))
                : GridView.builder(
                    padding: const EdgeInsets.all(10),
                    itemCount: _images.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                    ),
                    itemBuilder: (context, i) {
                      return Stack(
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
                              icon: const Icon(Icons.cancel, color: Colors.black54),
                              onPressed: () {
                                setState(() => _images.removeAt(i));
                              },
                            ),
                          ),
                        ],
                      );
                    },
                  ),
          ),
          if (_loading)
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
                onPressed: _loading ? null : _pickImagesFromGallery,
              ),
              ElevatedButton.icon(
                icon: const Icon(Icons.camera_alt),
                label: const Text('Camera'),
                onPressed: _loading ? null : _pickImageFromCamera,
              ),
              ElevatedButton.icon(
                icon: const Icon(Icons.done),
                label: const Text('Confirm'),
                onPressed: _loading ? null : _onConfirm,
              ),
            ],
          ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}

