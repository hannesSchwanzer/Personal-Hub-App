import 'package:personal_hub_app/domain/entities/meditation_entry.dart';
import 'package:personal_hub_app/domain/entities/audio_file.dart';
import 'package:personal_hub_app/domain/repositories/meditation_repository.dart';
import 'package:personal_hub_app/data/services/audio_duration_service.dart';

/// Handles workflow for creating [MeditationEntry]s from plain user input.
/// Fetches audio durations, builds [AudioFile]s, and persists entry.
class MeditationEntryCreationService {
  final AudioDurationService _durationService;
  final MeditationRepository _repo;

  MeditationEntryCreationService(
    this._durationService,
    this._repo,
  );

  /// Creates and persists a [MeditationEntry].
  /// All provided audio files (if any) must include [path] and a [FileType].
  /// Returns when operation is complete.
  Future<void> createEntryWithPaths({
    required String title,
    required String description,
    required MeditationType type,
    ChakraType? chakraType,
    required List<CognitiveType> cognitiveTypes,
    required MeditationLevel level,
    String? audioCompletePath,
    FileType? audioCompleteType,
    String? audioBeginningPath,
    FileType? audioBeginningType,
    String? audioRepeatingPath,
    FileType? audioRepeatingType,
    String? audioEndPath,
    FileType? audioEndType,
    String? tutorialVideoPath,
  }) async {
    // Helper to construct AudioFile if path and type are provided
    Future<AudioFile?> buildAudioFile(String? path, FileType? type) async {
      if (path == null || type == null) return null;
      Duration? duration;
      switch (type) {
        case FileType.asset:
          duration = await _durationService.getDuration(path, isAsset: true);
          break;
        case FileType.file:
          duration = await _durationService.getDuration(path, isAsset: false);
          break;
        case FileType.network:
          // Extend if network support is needed; otherwise throw
          throw UnimplementedError('Network audio not yet supported.');
      }
      if (duration == null) {
        throw Exception('Could not determine duration for $path');
      }
      return AudioFile(path: path, duration: duration, type: type);
    }

    final audioComplete   = await buildAudioFile(audioCompletePath, audioCompleteType);
    final audioBeginning  = await buildAudioFile(audioBeginningPath, audioBeginningType);
    final audioRepeating  = await buildAudioFile(audioRepeatingPath, audioRepeatingType);
    final audioEnd        = await buildAudioFile(audioEndPath, audioEndType);

    await _repo.createEntry(
      title: title,
      description: description,
      type: type,
      chakraType: chakraType,
      cognitiveTypes: cognitiveTypes,
      level: level,
      audioComplete: audioComplete,
      audioBeginning: audioBeginning,
      audioRepeating: audioRepeating,
      audioEnd: audioEnd,
      tutorialVideoPath: tutorialVideoPath,
    );
  }

  /// Creates and persists multiple [MeditationEntry]s efficiently.
  /// Uses a cache to prevent duplicate audio duration lookups per (path, type).
  /// Each item in [entries] should contain named parameters as in [createEntryWithPaths].
  Future<void> createMultipleEntriesWithPaths(
    List<({
      String title,
      String description,
      MeditationType type,
      ChakraType? chakraType,
      List<CognitiveType> cognitiveTypes,
      MeditationLevel level,
      String? audioCompletePath,
      FileType? audioCompleteType,
      String? audioBeginningPath,
      FileType? audioBeginningType,
      String? audioRepeatingPath,
      FileType? audioRepeatingType,
      String? audioEndPath,
      FileType? audioEndType,
      String? tutorialVideoPath,
    })> entries,
  ) async {
    // Cache for (path, FileType) => Duration
    final Map<String, Future<Duration?>> durationCache = {};

    /// Key generator for the cache.
    String audioKey(String? path, FileType? type) => path == null || type == null ? '' : '$path|${type.name}';

    // Builds audio files using cache for durations
    Future<AudioFile?> buildAudioFile(String? path, FileType? type) async {
      if (path == null || type == null) return null;
      final cacheKey = audioKey(path, type);

      Future<Duration?> getDuration() async {
        switch (type) {
          case FileType.asset:
            return _durationService.getDuration(path, isAsset: true);
          case FileType.file:
            return _durationService.getDuration(path, isAsset: false);
          case FileType.network:
            throw UnimplementedError('Network audio not yet supported.');
        }
      }

      durationCache[cacheKey] ??= getDuration();
      final duration = await durationCache[cacheKey];
      if (duration == null) {
        throw Exception('Could not determine duration for $path');
      }
      return AudioFile(path: path, duration: duration, type: type);
    }

    for (final entry in entries) {
      final audioComplete   = await buildAudioFile(entry.audioCompletePath, entry.audioCompleteType);
      final audioBeginning  = await buildAudioFile(entry.audioBeginningPath, entry.audioBeginningType);
      final audioRepeating  = await buildAudioFile(entry.audioRepeatingPath, entry.audioRepeatingType);
      final audioEnd        = await buildAudioFile(entry.audioEndPath, entry.audioEndType);

      await _repo.createEntry(
        title: entry.title,
        description: entry.description,
        type: entry.type,
        chakraType: entry.chakraType,
        cognitiveTypes: entry.cognitiveTypes,
        level: entry.level,
        audioComplete: audioComplete,
        audioBeginning: audioBeginning,
        audioRepeating: audioRepeating,
        audioEnd: audioEnd,
        tutorialVideoPath: entry.tutorialVideoPath,
      );
    }
  }
}

