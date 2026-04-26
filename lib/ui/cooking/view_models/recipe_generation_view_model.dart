import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:personal_hub_app/data/services/recipe_generate_service.dart';
import 'package:personal_hub_app/domain/entities/cooking/recipe_entity.dart';
import 'package:personal_hub_app/utils/providers.dart';

/// Provider for recipe generation (AI/API).
final recipeGenerationNotifierProvider =
    AsyncNotifierProvider<RecipeGenerationNotifier, RecipeEntity?>(
  RecipeGenerationNotifier.new,
);

class RecipeGenerationNotifier extends AsyncNotifier<RecipeEntity?> {
  late RecipeGenerateService _recipeGenerateService;

  @override
  Future<RecipeEntity?> build() async {
    _recipeGenerateService = ref.read(recipeGenerateServiceProvider);
    return null;
  }

  Future<RecipeEntity> generateFromImages(
    List<File> images, {
    String? inputLanguage,
    String? outputLanguage,
    bool? keepOriginalSize,
  }) async {
    state = const AsyncLoading();
    try {
      final recipe = await _recipeGenerateService.generateRecipeFromImages(
        images,
        inputLanguage: inputLanguage,
        outputLanguage: outputLanguage,
        keepOriginalSize: keepOriginalSize,
      );
      state = AsyncData(recipe);
      return recipe;
    } catch (e, st) {
      state = AsyncError(e, st);
      rethrow;
    }
  }

  Future<RecipeEntity> generateFromUrl(
    String url, {
    String? inputLanguage,
    String? outputLanguage,
    bool? useAiForParsing,
  }) async {
    state = const AsyncLoading();
    try {
      final recipe = await _recipeGenerateService.generateRecipeFromUrl(
        url,
        inputLanguage: inputLanguage,
        outputLanguage: outputLanguage,
        useAiForParsing: useAiForParsing,
      );
      state = AsyncData(recipe);
      return recipe;
    } catch (e, st) {
      state = AsyncError(e, st);
      rethrow;
    }
  }

  Future<RecipeEntity> generateFromText(
    String text, {
    String? inputLanguage,
    String? outputLanguage,
  }) async {
    state = const AsyncLoading();
    try {
      final recipe = await _recipeGenerateService.generateRecipeFromText(
        text,
        inputLanguage: inputLanguage,
        outputLanguage: outputLanguage,
      );
      state = AsyncData(recipe);
      return recipe;
    } catch (e, st) {
      state = AsyncError(e, st);
      rethrow;
    }
  }
}
