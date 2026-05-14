import 'dart:io';

import 'package:personal_hub_app/domain/entities/food/recipe_entity.dart';

enum RecipeGenerationJobStatus {
  queued,
  running,
  completed,
  failed,
  cancelled,
}

enum RecipeGenerationCompletionAction {
  none,
  saveAsDraft,
  createRecipe,
}

class RecipeGenerationJob {
  final String id;

  final RecipeGenerationSource source;

  final RecipeGenerationJobStatus status;

  final RecipeGenerationCompletionAction completionAction;

  final DateTime createdAt;

  final DateTime? startedAt;

  final DateTime? completedAt;

  final RecipeEntity? result;

  final String? errorMessage;

  final String? targetDraftId;


  RecipeGenerationJob({
    required this.id,
    required this.source,
    required this.status,
    this.completionAction = RecipeGenerationCompletionAction.none,
    required this.createdAt,
    this.startedAt,
    this.completedAt,
    this.result,
    this.errorMessage,
    this.targetDraftId,
  });

 RecipeGenerationJob copyWith({
    String? id,
    RecipeGenerationSource? source,
    RecipeGenerationJobStatus? status,
    RecipeGenerationCompletionAction? completionAction,
    DateTime? createdAt,
    DateTime? startedAt,
    DateTime? completedAt,
    Object? result = _unset,
    String? errorMessage,
    Object? targetDraftId = _unset,
  }) {
    return RecipeGenerationJob(
      id: id ?? this.id,
      source: source ?? this.source,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      startedAt: startedAt ?? this.startedAt,
      completedAt: completedAt ?? this.completedAt,
      result: result == _unset ? this.result : result as RecipeEntity?,
      errorMessage: errorMessage ?? this.errorMessage,
      targetDraftId: targetDraftId == _unset
          ? this.targetDraftId
          : targetDraftId as String?,
      completionAction: completionAction ?? this.completionAction,
    );
  }
}

abstract class RecipeGenerationSource {
  const RecipeGenerationSource();
}

class RecipeGenerationFromImagesSource extends RecipeGenerationSource {
  final List<String> imagePaths;

  final String? inputLanguage;

  final String? outputLanguage;

  final bool? keepOriginalSize;

  const RecipeGenerationFromImagesSource({
    required this.imagePaths,
    this.inputLanguage,
    this.outputLanguage,
    this.keepOriginalSize = false,
  });
}

const _unset = Object();

class RecipeGenerationFromUrlSource extends RecipeGenerationSource {
  final String url;

  final String? inputLanguage;

  final String? outputLanguage;

  final bool? useAiForParsing;

  const RecipeGenerationFromUrlSource({
    required this.url,
    this.inputLanguage,
    this.outputLanguage,
    this.useAiForParsing = false,
  });
}

class RecipeGenerationFromTextSource extends RecipeGenerationSource {
  final String text;

  final String? inputLanguage;

  final String? outputLanguage;

  const RecipeGenerationFromTextSource({
    required this.text,
    this.inputLanguage,
    this.outputLanguage,
  });
}

