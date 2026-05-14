import 'dart:async';
import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:personal_hub_app/data/services/image_service.dart';
import 'package:personal_hub_app/data/services/recipe_generate_service.dart';
import 'package:personal_hub_app/domain/entities/food/recipe_entity.dart';
import 'package:personal_hub_app/domain/entities/food/recipe_generation_entities.dart';
import 'package:personal_hub_app/domain/repositories/recipe_repository.dart';
import 'package:personal_hub_app/utils/providers.dart';
import 'package:uuid/uuid.dart';
import 'package:collection/collection.dart';

final recipeGenerationQueueProvider =
    NotifierProvider<RecipeGenerationQueueNotifier, List<RecipeGenerationJob>>(
      RecipeGenerationQueueNotifier.new,
    );

class RecipeGenerationQueueNotifier
    extends Notifier<List<RecipeGenerationJob>> {
  late RecipeGenerateService _generationService;
  late ImageService _imageService;
  late RecipeRepository _recipeRepository;
  final Map<String, Completer<RecipeEntity>> _jobCompleters = {};

  @override
  List<RecipeGenerationJob> build() {
    _generationService = ref.read(recipeGenerateServiceProvider);
    _imageService = ref.read(imageServiceProvider);
    _recipeRepository = ref.read(recipeRepositoryProvider);

    return [];
  }

  Future<RecipeEntity> waitForJob(String jobId) {
    final job = _findJob(jobId);

    if (job == null) {
      throw Exception('Unknown job');
    }

    if (job.status == RecipeGenerationJobStatus.completed &&
        job.result != null) {
      return Future.value(job.result!);
    }

    if (job.status == RecipeGenerationJobStatus.failed) {
      return Future.error(job.errorMessage ?? 'Unknown error');
    }

    final completer = _jobCompleters[jobId];

    if (completer == null) {
      throw Exception('Job not awaitable');
    }

    return completer.future;
  }

  Future<String> enqueueFromImages(
    List<File> images, {
    String? inputLanguage,
    String? outputLanguage,
    bool? keepOriginalSize,
    String? targetDraftId,
    bool autoSave = false,
  }) async {
    final persistedPaths = await _persistImages(images);

    final source = RecipeGenerationFromImagesSource(
      imagePaths: persistedPaths,
      inputLanguage: inputLanguage,
      outputLanguage: outputLanguage,
      keepOriginalSize: keepOriginalSize,
    );

    final job = RecipeGenerationJob(
      id: Uuid().v4(),
      source: source,
      status: RecipeGenerationJobStatus.queued,
      createdAt: DateTime.now(),
      targetDraftId: targetDraftId,
      completionAction: autoSave
          ? RecipeGenerationCompletionAction.createRecipe
          : RecipeGenerationCompletionAction.none,
    );

    state = [...state, job];

    unawaited(_runJob(job.id));

    final completer = Completer<RecipeEntity>();
    _jobCompleters[job.id] = completer;

    return job.id;
  }

  Future<String> enqueueFromUrl(
    String url, {
    String? inputLanguage,
    String? outputLanguage,
    bool? useAiForParsing,
    String? targetDraftId,
    bool autoSave = false,
  }) async {
    final source = RecipeGenerationFromUrlSource(
      url: url,
      inputLanguage: inputLanguage,
      outputLanguage: outputLanguage,
      useAiForParsing: useAiForParsing,
    );

    final job = RecipeGenerationJob(
      id: Uuid().v4(),
      source: source,
      status: RecipeGenerationJobStatus.queued,
      createdAt: DateTime.now(),
      targetDraftId: targetDraftId,
      completionAction: autoSave
          ? RecipeGenerationCompletionAction.createRecipe
          : RecipeGenerationCompletionAction.none,
    );

    state = [...state, job];

    unawaited(_runJob(job.id));

    final completer = Completer<RecipeEntity>();
    _jobCompleters[job.id] = completer;

    return job.id;
  }

  Future<String> enqueueFromText(
    String text, {
    String? inputLanguage,
    String? outputLanguage,
    String? targetDraftId,
    bool autoSave = false,
  }) async {
    final source = RecipeGenerationFromTextSource(
      text: text,
      inputLanguage: inputLanguage,
      outputLanguage: outputLanguage,
    );

    final job = RecipeGenerationJob(
      id: Uuid().v4(),
      source: source,
      status: RecipeGenerationJobStatus.queued,
      createdAt: DateTime.now(),
      targetDraftId: targetDraftId,
      completionAction: autoSave
          ? RecipeGenerationCompletionAction.createRecipe
          : RecipeGenerationCompletionAction.none,
    );

    state = [...state, job];

    unawaited(_runJob(job.id));

    final completer = Completer<RecipeEntity>();
    _jobCompleters[job.id] = completer;

    return job.id;
  }

  Future<void> _runJob(String jobId) async {
    final job = _findJob(jobId);
    if (job == null) return;

    _updateJob(
      jobId,
      (job) => job.copyWith(
        status: RecipeGenerationJobStatus.running,
        startedAt: DateTime.now(),
      ),
    );

    RecipeEntity? result;

    if (job.source is RecipeGenerationFromImagesSource) {
      final source = job.source as RecipeGenerationFromImagesSource;
      try {
        result = await _generationService.generateRecipeFromImages(
          source.imagePaths.map((path) => File(path)).toList(),
          inputLanguage: source.inputLanguage,
          outputLanguage: source.outputLanguage,
          keepOriginalSize: source.keepOriginalSize,
        );

        _jobSucceeded(jobId, result);
      } catch (e, st) {
        _jobFailed(jobId, e, st);
      } finally {
        await _deletePersistedImages(source.imagePaths);
      }
    } else if (job.source is RecipeGenerationFromUrlSource) {
      final source = job.source as RecipeGenerationFromUrlSource;
      try {
        result = await _generationService.generateRecipeFromUrl(
          source.url,
          inputLanguage: source.inputLanguage,
          outputLanguage: source.outputLanguage,
          useAiForParsing: source.useAiForParsing,
        );

        _jobSucceeded(jobId, result);
      } catch (e, st) {
        _jobFailed(jobId, e, st);
      }
    } else if (job.source is RecipeGenerationFromTextSource) {
      final source = job.source as RecipeGenerationFromTextSource;
      try {
        result = await _generationService.generateRecipeFromText(
          source.text,
          inputLanguage: source.inputLanguage,
          outputLanguage: source.outputLanguage,
        );

        _jobSucceeded(jobId, result);
      } catch (e, st) {
        _jobFailed(jobId, e, st);
      }
    } else {
      _updateJob(
        jobId,
        (job) => job.copyWith(
          status: RecipeGenerationJobStatus.failed,
          completedAt: DateTime.now(),
          errorMessage: 'Unsupported job source type',
        ),
      );
      return;
    }

    if (result != null) {
      if (job.completionAction ==
          RecipeGenerationCompletionAction.createRecipe) {
        await _recipeRepository.insertRecipe(result);
      } else if (job.completionAction ==
          RecipeGenerationCompletionAction.saveAsDraft) {
        throw UnimplementedError('Draft saving not implemented yet');
      }
    }
  }

  Future<List<String>> _persistImages(List<File> images) async {
    final paths = <String>[];
    for (final image in images) {
      final path = await _imageService.saveImage(image);
      paths.add(path);
    }
    return paths;
  }

  Future<void> _deletePersistedImages(List<String> paths) async {
    for (final path in paths) {
      await _imageService.deleteImage(path);
    }
  }

  RecipeGenerationJob? _findJob(String jobId) {
    return state.firstWhereOrNull((job) => job.id == jobId);
  }

  void _updateJob(
    String id,
    RecipeGenerationJob Function(RecipeGenerationJob) transform,
  ) {
    state = [
      for (final job in state)
        if (job.id == id) transform(job) else job,
    ];
  }

  void _jobSucceeded(String jobId, RecipeEntity result) {
    _updateJob(
      jobId,
      (job) => job.copyWith(
        status: RecipeGenerationJobStatus.completed,
        completedAt: DateTime.now(),
        result: result,
      ),
    );
    final completer = _jobCompleters.remove(jobId);

    if (completer != null && !completer.isCompleted) {
      completer.complete(result);
    }
  }

  void _jobFailed(String jobId, Object error, StackTrace stackTrace) {
    _updateJob(
      jobId,
      (job) => job.copyWith(
        status: RecipeGenerationJobStatus.failed,
        completedAt: DateTime.now(),
        errorMessage: error.toString(),
      ),
    );

    final completer = _jobCompleters.remove(jobId);

    if (completer != null && !completer.isCompleted) {
      completer.completeError(error, stackTrace);
    }
  }
}
