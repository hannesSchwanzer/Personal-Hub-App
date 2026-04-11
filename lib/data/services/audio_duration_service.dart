import 'dart:developer';

import 'package:personal_hub_app/data/services/audio_player_service.dart';
import 'package:personal_hub_app/domain/entities/audio_file.dart';

/// Service for fetching durations of audio files by path.
class AudioDurationService {
  final AudioPlayerService _player;

  AudioDurationService(this._player);
  /// Returns the duration of an audio asset or file.
  /// [path] can be an asset or file path, [isAsset] distinguishes type.
  Future<Duration?> getDuration(String path, {bool isAsset = true}) async {
    await _player.setAudioSourcePath(path, type: isAsset ? FileType.asset : FileType.file);
    final duration = _player.duration;
    log('Fetched duration for $path: $duration');

    return duration;
  }
}
