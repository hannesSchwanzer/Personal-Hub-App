import 'dart:io';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;

/// Service responsible for saving images to app storage.
///
/// Usage:
///   final savedImagePath = await ImageSaveService.saveImage(sourceImageFile);
class ImageService {
  static const String imageSubdirectory = "images";

  /// Saves the [imageFile] into the app's documents directory with a unique filename.
  /// Returns the absolute path of the saved image.
  ///
  /// The [imageFile] can be from gallery, camera, or any source.
  Future<String> saveImage(File imageFile) async {
    final imageDirPath = await _ensureImageDirectoryExists();
    final fileName =
        "${DateTime.now().millisecondsSinceEpoch}_${path.basename(imageFile.path)}";
    final savedImage = await imageFile.copy(path.join(imageDirPath, fileName));
    return savedImage.path;
  }

  Future<String?> downloadImage(String imageUrl) async {
    final response = await http.get(Uri.parse(imageUrl));

    if (response.statusCode != 200) {
      return null;
    }

    final bytes = response.bodyBytes;

    final imageDirPath = await _ensureImageDirectoryExists();

    final fileName =
        "${DateTime.now().millisecondsSinceEpoch}_${Uri.parse(imageUrl).pathSegments.last}";

    final filePath = path.join(imageDirPath, fileName);
    final file = File(filePath);
    await file.writeAsBytes(bytes);

    return filePath;
  }

  Future<String> _ensureImageDirectoryExists() async {
    final appDir = await getApplicationDocumentsDirectory();
    final imageDir = Directory(path.join(appDir.path, imageSubdirectory));
    if (!imageDir.existsSync()) {
      imageDir.createSync(recursive: true);
    }
    return imageDir.path;
  }
}
