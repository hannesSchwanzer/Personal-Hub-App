import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

/// Widget to allow picking or capturing an image for a recipe.
/// Displays the current image (if any) and lets the user pick/capture a photo.
/// Returns errors with SnackBar.
/// 
/// [onImagePicked] returns the saved File on success.
class RecipeImagePicker extends StatefulWidget {
  final String? imagePath;
  final Future<void> Function(File) onImagePicked;

  /// A modern image picker for recipes. Always shows at the top with placeholder if no image,
  /// and a central overlay for adding or changing the image. Follows Material and Riverpod best practices.
  const RecipeImagePicker({
    Key? key,
    required this.imagePath,
    required this.onImagePicked,
  }) : super(key: key);

  @override
  State<RecipeImagePicker> createState() => _RecipeImagePickerState();
}

class _RecipeImagePickerState extends State<RecipeImagePicker> {
  bool _loading = false;

  Future<void> _pickImage(BuildContext context, ImageSource source) async {
    setState(() => _loading = true);
    try {
      final picker = ImagePicker();
      final picked = await picker.pickImage(source: source, imageQuality: 85);
      if (picked != null) {
        await widget.onImagePicked(File(picked.path));
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to load image: $e')),
        );
      }
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  void _showImageSourceSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (ctx) {
        return SafeArea(
          child: Wrap(
            children: [
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Choose from gallery'),
                onTap: _loading
                    ? null
                    : () {
                        Navigator.of(ctx).pop();
                        _pickImage(context, ImageSource.gallery);
                      },
              ),
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: const Text('Take a picture'),
                onTap: _loading
                    ? null
                    : () {
                        Navigator.of(ctx).pop();
                        _pickImage(context, ImageSource.camera);
                      },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final hasImage = widget.imagePath != null && widget.imagePath!.isNotEmpty;
    return Column(
      children: [
        GestureDetector(
          onTap: _loading ? null : () => _showImageSourceSheet(context),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: double.infinity,
                height: 180,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: hasImage
                    ? Image.file(
                        File(widget.imagePath!),
                        fit: BoxFit.contain,
                        errorBuilder: (_, __, ___) =>
                            const Center(child: Text('Could not load image')),
                      )
                    : Container(
                        color: Colors.grey[200],
                        child: Center(
                          child: Icon(
                            Icons.image_not_supported,
                            size: 64,
                            color: Colors.grey[400],
                          ),
                        ),
                      ),
              ),
              if (!hasImage)
                Positioned(
                  child: Column(
                    children: const [
                      Icon(Icons.add_a_photo, size: 40, color: Colors.black54),
                      SizedBox(height: 4),
                      Text('Add Image', style: TextStyle(color: Colors.black54)),
                    ],
                  ),
                ),
              if (_loading)
                const Positioned.fill(
                  child: DecoratedBox(
                    decoration: BoxDecoration(color: Colors.black38),
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                ),
            ],
          ),
        ),
        const SizedBox(height: 12),
      ],
    );
  }
}

