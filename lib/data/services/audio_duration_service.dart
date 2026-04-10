import 'package:just_audio/just_audio.dart';

/// Service for fetching durations of audio files by path.
class AudioDurationService {
  /// Returns the duration of an audio asset or file.
  /// [path] can be an asset or file path, [isAsset] distinguishes type.
  Future<Duration?> getDuration(String path, {bool isAsset = true}) async {
    final player = AudioPlayer();
    try {
      if (isAsset) {
        await player.setAudioSource(AudioSource.asset(path));
      } else {
        await player.setAudioSource(AudioSource.file(path));
      }
      final duration = player.duration;
      return duration;
    } finally {
      await player.dispose();
    }
  }
}
