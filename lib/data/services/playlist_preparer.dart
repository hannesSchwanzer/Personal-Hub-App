import 'package:personal_hub_app/domain/entities/audio_file.dart';

import 'audio_duration_service.dart';

class PlaylistPreparer {
  final AudioDurationService durationService;

  PlaylistPreparer(this.durationService);

  /// Prepares a list of [AudioFileWithDuration] given paths and repetitions.
  Future<List<AudioFile>> preparePlaylist(
    List<(String, int)> filesWithCounts,
    {bool isAsset = true}
  ) async {
    final List<AudioFile> result = [];
    for (final (path, count) in filesWithCounts) {
      final duration = await durationService.getDuration(path, isAsset: isAsset) ?? Duration.zero;
      for (int i = 0; i < count; i++) {
        result.add(AudioFile(path: path, duration: duration));
      }
    }
    return result;
  }
}
