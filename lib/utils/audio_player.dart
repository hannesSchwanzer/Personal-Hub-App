import 'package:just_audio/just_audio.dart';

class CustomAudioPlayer {
  final AudioPlayer _player = AudioPlayer();
  List<Duration> _durations = List.empty();

  Duration? get duration => _totalDuration();

  List<Duration> _getDurations() {
    final sequence = _player.sequence;

    return sequence.map((s) => s.duration ?? Duration.zero).toList();
  }

  Duration _totalDuration() {
    return _durations.fold(Duration.zero, (a, b) => a + b);
  }

  void _update() {
    _durations = _getDurations();
  }

  Future<void> setAudioSources(List<String> audioSources) async {
    final audioSourcesProcessed = audioSources
        .map((source) => AudioSource.file(source))
        .toList();

    await _player.setAudioSources(audioSourcesProcessed);
    _update();
  }

  Future<void> setAudioSourcesWithRepetitions(
    List<(String, int)> audioSources,
  ) async {
    final audioSourcesProcessed = List<AudioSource>.empty(growable: true);
    for (var source in audioSources) {
      final (audioSource, repetitions) = source;
      for (int i = 0; i < repetitions; i++) {
        final audioSourceProcessed = AudioSource.file(audioSource);
        audioSourcesProcessed.add(audioSourceProcessed);
      }
    }

    await _player.setAudioSources(audioSourcesProcessed);
    _update();
  }

  Stream<Duration> get positionStream async* {
    await for (final position in _player.positionStream) {
      final currentIndex = _player.currentIndex;
      if (currentIndex == null || currentIndex >= _durations.length) {
        assert(false); // TODO: Handle later
      } 

      final prevDuration = _durations.sublist(0, currentIndex).fold(Duration.zero, (a, b) => a + b);
      yield prevDuration + position;
    }
  }


  Future<void> seek(final Duration position) async {
    if (position <= duration!) return; // TODO: Maybe throw error?

    Duration currDuration = Duration();
    int index = 0;
    for (int i = 0; i < _durations.length; i++) {
      final nextDuration = _durations[i]
      final nextDurationSum = currDuration + nextDuration;
      if (nextDuration > position) break;

      currDuration = nextDurationSum;
      index = i;
    }

    final realPosition = position - currDuration;
    await _player.seek(realPosition, index: index);
  }
}
