import 'dart:async';
import 'package:just_audio/just_audio.dart';
import 'package:personal_hub_app/domain/entities/audio_file.dart';

/// Abstraction class for cross-audio-source playback.
/// Use this via [AudioPlayerService] Riverpod provider, not directly.
///
/// Provides position, duration and (optional) controls for playing
/// multiple audio files as if they were one long track.
class AudioPlayerService {
  final AudioPlayer _player = AudioPlayer();
  List<Duration> _durations = [];

  /// Emits the current position as a global Duration (across all sources).
  late final Stream<Duration> positionStream;

  /// Emits the full sequence duration.
  Duration get duration =>
      _durations.fold(Duration.zero, (a, b) => a + b);

  /// Emits the current player state (playing/paused/idle).
  Stream<PlayerState> get playerStateStream => _player.playerStateStream;
  Stream<bool> get playingStream => _player.playingStream;

  AudioPlayerService() {
    positionStream = _player.positionStream.asyncMap(_mapPositionToGlobal);
  }

  Future<void> setAudioSources(List<AudioFile> files) async {
    final sources = files.map((source) => AudioSource.asset(source.path)).toList();
    final durations = files.map((source) => source.duration).toList();
    await _player.setAudioSources(sources, preload: true);

    _loadDurations(durations);
  }

  /// Load multiple audio files with repetition (tuples of [filepath, count]).
  Future<void> setAudioSourcesWithRepetitions(List<(AudioFile, int)> sources) async {
    final expanded = <AudioSource>[];
    final durations = <Duration>[];
    for (final (file, times) in sources) {
      expanded.addAll(List.generate(times, (_) => AudioSource.asset(file.path)));
      durations.add(file.duration);
    }
    await _player.setAudioSources(expanded, preload: true);

    _loadDurations(durations);
  }

  /// Play.
  Future<void> play() => _player.play();

  /// Pause.
  Future<void> pause() => _player.pause();

  /// Stop.
  Future<void> stop() => _player.stop();

  /// Seek to a global position across all sources.
  Future<void> seek(Duration target) async {
    if (_durations.isEmpty) return;
    Duration acc = Duration.zero;
    for (int i = 0; i < _durations.length; i++) {
      final next = acc + _durations[i];
      if (target < next) {
        await _player.seek(target - acc, index: i);
        return;
      }
      acc = next;
    }
    // If we reach here, go to end
    await _player.seek(_durations.last, index: _durations.length - 1);
  }

  /// Map just_audio position to "global timeline position"
  Future<Duration> _mapPositionToGlobal(Duration position) async {
    final index = _player.currentIndex ?? 0;
    Duration acc = Duration.zero;
    for (int i = 0; i < index; i++) {
      acc += _durations.length > i ? _durations[i] : Duration.zero;
    }
    return acc + position;
  }

  void _loadDurations(List<Duration> durations) {
    _durations = durations;
  }

  /// Dispose of resources (call from provider).
  Future<void> dispose() => _player.dispose();
}
