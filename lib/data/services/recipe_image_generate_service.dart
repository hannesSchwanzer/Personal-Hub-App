import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:personal_hub_app/domain/entities/cooking/recipe_entity.dart';

/// Service to generate a recipe by uploading one or more images to the backend API.
class RecipeImageGenerateService {
  /// The base URL of the backend API. Must be updated or injected as necessary.
  final String baseUrl;

  RecipeImageGenerateService({required this.baseUrl});

  /// Calls the /generate-recipe endpoint to create a recipe from images.
  ///
  /// [images] is a list of image files to upload.
  /// [inputLanguage] and [outputLanguage] are optional language hints for the backend.
  /// Throws an exception upon HTTP or decoding error.
  Future<RecipeEntity> generateRecipeFromImages(
    List<File> images, {
    String? inputLanguage,
    String? outputLanguage,
  }) async {
    final url = Uri.parse('$baseUrl/generate-recipe');
    final request = http.MultipartRequest('POST', url);

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
    if (inputLanguage != null) {
      request.fields['input_language'] = inputLanguage;
    }
    if (outputLanguage != null) {
      request.fields['output_language'] = outputLanguage;
    }

    final streamedResponse = await request.send();
    final response = await http.Response.fromStream(streamedResponse);
    if (response.statusCode >= 400) {
      throw Exception('Failed to generate recipe: ${response.body}');
    }
    final Map<String, dynamic> jsonData = jsonDecode(response.body);
    return _parseRecipeEntity(jsonData);
  }

  /// Heuristic MIME type lookup from file extension (can improve by using package:mime if needed)
  String? _lookupMimeType(String path) {
    final ext = path.toLowerCase();
    if (ext.endsWith('.jpg') || ext.endsWith('.jpeg')) return 'image/jpeg';
    if (ext.endsWith('.png')) return 'image/png';
    if (ext.endsWith('.gif')) return 'image/gif';
    return null;
  }

  /// Converts the API Map<String,dynamic> JSON to a RecipeEntity.
  RecipeEntity _parseRecipeEntity(Map<String, dynamic> json) {
    return RecipeEntity(
      id: '',
      name: json['name'] as String? ?? '',
      description: json['description'] as String? ?? '',
      ingredients: (json['ingredients'] as List<dynamic>? ?? [])
          .map((i) => _parseIngredient(i))
          .toList(),
      steps: (json['steps'] as List<dynamic>? ?? [])
          .map((s) => _parseStep(s))
          .toList(),
      tags: const [],
      servings: json['servings'] as int? ?? 1,
      cookingTimeMinutes: json['cookingTimeMinutes'] as int? ?? 0,
      preparationTimeMinutes: json['preparationTimeMinutes'] as int? ?? 0,
      nutritionInfo: _parseNutrition(json['nutritionInfo'] as Map<String, dynamic>? ?? {}),
      imagePath: '',
    );
  }

  IngredientEntity _parseIngredient(Map<String, dynamic> json) {
    return IngredientEntity(
      name: json['name'] as String? ?? '',
      quantity: (json['quantity'] as num?)?.toDouble() ?? 0,
      unit: UnitType.fromString(json['unit'] as String? ?? '') ?? UnitType.pieces,
    );
  }

  StepEntity _parseStep(Map<String, dynamic> json) {
    return StepEntity(
      ingredients: (json['ingredients'] as List<dynamic>? ?? [])
          .map((si) => _parseStepIngredient(si))
          .toList(),
      instruction: json['instruction'] as String? ?? '',
      imagePath: null,
    );
  }

  StepIngredientEntity _parseStepIngredient(Map<String, dynamic> json) {
    return StepIngredientEntity(
      name: json['name'] as String? ?? '',
      quantityPercent: (json['quantityPercent'] as num?)?.toDouble() ?? 0,
    );
  }

  NutritionInfoEntity _parseNutrition(Map<String, dynamic> json) {
    return NutritionInfoEntity(
      calories: json['calories'] as int?,
      carbohydratesGrams: (json['carbohydratesGrams'] as num?)?.toDouble(),
      proteinGrams: (json['proteinGrams'] as num?)?.toDouble(),
      fatGrams: (json['fatGrams'] as num?)?.toDouble(),
    );
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
