import 'dart:developer';

import 'package:personal_hub_app/domain/entities/audio_file.dart';
import 'package:personal_hub_app/domain/entities/meditation/meditation_entry.dart';
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
    required List<(String, FileType, bool)> audioSections,
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

    final List<RepeatingAudio> audioSectionsProcessed = [];
    for (final e in audioSections) {
      final audioFile = await buildAudioFile(e.$1, e.$2);
      if (audioFile != null) {
        audioSectionsProcessed.add(RepeatingAudio(file: audioFile, isRepeating: e.$3));
      }
    }

    await _repo.createEntry(
      title: title,
      description: description,
      type: type,
      chakraType: chakraType,
      cognitiveTypes: cognitiveTypes,
      level: level,
      audioSections: audioSectionsProcessed,
      tutorialVideoPath: tutorialVideoPath,
    );
  }
}

