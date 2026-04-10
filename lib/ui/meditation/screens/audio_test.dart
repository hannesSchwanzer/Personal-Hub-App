import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:personal_hub_app/data/services/audio_duration_service.dart';
import 'package:personal_hub_app/data/services/playlist_preparer.dart';
import 'package:personal_hub_app/ui/core/widgets/audio_player_controls.dart';
import 'package:personal_hub_app/utils/providers.dart';

/// Test page for audio player. Demonstrates loading and playback of
/// multiple audio sources as one.
///
/// Loads the playlist on init, shows loading spinner until ready,
/// and renders global controls.
class AudioTestPage extends ConsumerStatefulWidget {
  const AudioTestPage({super.key});

  @override
  ConsumerState<AudioTestPage> createState() => _AudioTestPageState();
}

class _AudioTestPageState extends ConsumerState<AudioTestPage> {
  bool _isInitialized = false;

  // You can configure your playlist and repetitions here:
  static const int repeatCount = 3;
  static const String startAsset = 'assets/audio/prana-shuddhi-start.mp3';
  static const String middleAsset = 'assets/audio/prana-shuddhi-middle.mp3';
  static const String endAsset = 'assets/audio/prana-shuddhi-end.mp3';

  @override
  void initState() {
    super.initState();
    _initAudio();
  }

  /// Initializes the audio source using the [AudioPlayerService] Riverpod provider.
  Future<void> _initAudio() async {
    final audioPlayerService = ref.read(audioPlayerServiceProvider);

    // Concatenate: start, middle x repeatCount, end
    final preparer = PlaylistPreparer(AudioDurationService());
    final playlist = await preparer.preparePlaylist([
      ('assets/audio/prana-shuddhi-start.mp3', 1),
      ('assets/audio/prana-shuddhi-middle.mp3', 3),
      ('assets/audio/prana-shuddhi-end.mp3', 1),
    ]);


    // Flatten into list of (filepath, repetitions)
    await audioPlayerService.setAudioSources(playlist);

    setState(() {
      _isInitialized = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Audio Test')),
      body: Center(
        child: _isInitialized
            ? const Padding(
                padding: EdgeInsets.all(16.0),
                child: AudioPlayerControls(sliderEnabled: true,),
              )
            : const CircularProgressIndicator(),
      ),
    );
  }
}
