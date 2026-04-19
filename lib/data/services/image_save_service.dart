import 'dart:io';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';

/// Service responsible for saving images to app storage.
///
/// Usage:
///   final savedImagePath = await ImageSaveService.saveImage(sourceImageFile);
class ImageSaveService {
  /// Saves the [imageFile] into the app's documents directory with a unique filename.
  /// Returns the absolute path of the saved image.
  ///
  /// The [imageFile] can be from gallery, camera, or any source.
  static Future<String> saveImage(File imageFile) async {
    final appDir = await getApplicationDocumentsDirectory();
    final fileName =
        "${DateTime.now().millisecondsSinceEpoch}_${path.basename(imageFile.path)}";
    final savedImage = await imageFile.copy(path.join(appDir.path, fileName));
    return savedImage.path;
  }
}

