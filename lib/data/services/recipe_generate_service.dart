import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:personal_hub_app/data/dtos/recipe_dto.dart';
import 'package:personal_hub_app/data/mappers/recipe_mapper.dart';
import 'package:personal_hub_app/data/services/image_service.dart';
import 'package:personal_hub_app/domain/entities/cooking/recipe_entity.dart';

/// Service to generate a recipe by uploading one or more images to the backend API.
class RecipeGenerateService {
  /// The base URL of the backend API. Must be updated or injected as necessary.
  final String baseUrl;
  final ImageService _imageService;

  RecipeGenerateService({
    required ImageService imageService,
    required this.baseUrl,
  }) : _imageService = imageService;

  /// Calls the /generate-recipe endpoint to create a recipe from images.
  ///
  /// [images] is a list of image files to upload.
  /// [inputLanguage] and [outputLanguage] are optional language hints for the backend.
  /// Throws an exception upon HTTP or decoding error.
  Future<RecipeEntity> generateRecipeFromImages(
    List<File> images, {
    String? inputLanguage,
    String? outputLanguage,
    bool? keepOriginalSize,
  }) async {
    final queryParams = {
      'input_language': ?inputLanguage,
      'output_language': ?outputLanguage,
      if (keepOriginalSize != null)
        'keep_original_size': keepOriginalSize.toString(),
    };

    final uri = Uri.parse(
      '$baseUrl/generate/images',
    ).replace(queryParameters: queryParams);

    final request = http.MultipartRequest('POST', uri);

    for (final image in images) {
      final mimeType = _lookupMimeType(image.path);

      request.files.add(
        await http.MultipartFile.fromPath(
          'files',
          image.path,
          contentType: mimeType == null ? null : http.MediaType.parse(mimeType),
        ),
      );
    }

    final streamedResponse = await request.send();
    final response = await http.Response.fromStream(streamedResponse);

    if (response.statusCode >= 400) {
      throw Exception('Failed to generate recipe: ${response.body}');
    }

    final Map<String, dynamic> jsonData = jsonDecode(response.body);
    return await _parseRecipeEntity(jsonData);
  }

  Future<RecipeEntity> generateRecipeFromText(
    String recipeText, {
    String? inputLanguage,
    String? outputLanguage,
  }) async {
    final queryParams = {
      'recipe_text': recipeText,
      'input_language': ?inputLanguage,
      'output_language': ?outputLanguage,
    };

    final uri = Uri.parse(
      '$baseUrl/generate/text',
    ).replace(queryParameters: queryParams);

    final response = await http.post(uri);

    if (response.statusCode >= 400) {
      throw Exception('Failed to generate recipe: ${response.body}');
    }

    final Map<String, dynamic> jsonData = jsonDecode(response.body);
    return await _parseRecipeEntity(jsonData);
  }

  Future<RecipeEntity> generateRecipeFromUrl(
    String recipeUrl, {
    String? inputLanguage,
    String? outputLanguage,
    bool? useAiForParsing,
  }) async {
    final queryParams = {
      'url': recipeUrl,
      'input_language': ?inputLanguage,
      'output_language': ?outputLanguage,
      if (useAiForParsing != null) 'use_ai': useAiForParsing.toString(),
    };

    final uri = Uri.parse(
      '$baseUrl/generate/url',
    ).replace(queryParameters: queryParams);

    final response = await http.post(uri);

    if (response.statusCode >= 400) {
      throw Exception('Failed to generate recipe: ${response.body}');
    }

    final Map<String, dynamic> jsonData = jsonDecode(response.body);
    return await _parseRecipeEntity(jsonData);
  }

  /// Heuristic MIME type lookup from file extension (can improve by using package:mime if needed)
  String? _lookupMimeType(String path) {
    final ext = path.toLowerCase();
    if (ext.endsWith('.jpg') || ext.endsWith('.jpeg')) return 'image/jpeg';
    if (ext.endsWith('.png')) return 'image/png';
    if (ext.endsWith('.gif')) return 'image/gif';
    return null;
  }

  Future<RecipeEntity> _parseRecipeEntity(Map<String, dynamic> json) async {
    final recipeDto = RecipeDto.fromJson(json);
    String? localImagePath;
    if (recipeDto.imageUrl != null && recipeDto.imageUrl!.isNotEmpty) {
      localImagePath = await _imageService.downloadImage(recipeDto.imageUrl!);
    }

    return recipeDto.toEntity(localImagePath: localImagePath);
  }
}

// /// Needed for some content type construction (if not already imported)
// class MediaType {
//   final String type;
//   final String subtype;
//
//   MediaType(this.type, this.subtype);
//
//   static MediaType parse(String raw) {
//     final parts = raw.split('/');
//     if (parts.length != 2) throw Exception('Invalid MediaType');
//     return MediaType(parts[0], parts[1]);
//   }
//
//   @override
//   String toString() => '$type/$subtype';
// }
//
