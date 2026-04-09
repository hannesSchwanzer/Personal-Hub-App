import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:personal_hub_app/ui/core/widgets/audio_player_controls.dart';

class AudioTestPage extends StatefulWidget {
  const AudioTestPage({super.key});

  @override
  State<AudioTestPage> createState() => _AudioTestPageState();
}

class _AudioTestPageState extends State<AudioTestPage> {
  final AudioPlayer _player = AudioPlayer();

  final int repeatCount = 3;

  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    _initAudio();
  }

  Future<void> _initAudio() async {
    final playlist = ConcatenatingAudioSource(
      children: [
        AudioSource.asset('assets/audio/prana-shuddhi-start.mp3'),

        // Repeat middle part
        LoopingAudioSource(
          count: repeatCount,
          child: AudioSource.asset('assets/audio/prana-shuddhi-middle.mp3'),
        ),

        AudioSource.asset('assets/audio/prana-shuddhi-end.mp3'),
      ],
    );

    await _player.setAudioSource(playlist, preload: true);
    await _player.load();

    setState(() {
      _isInitialized = true;
    });
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Audio Test')),
      body: Center(
        child: _isInitialized
            ? Padding(
                padding: const EdgeInsets.all(16.0),
                child: AudioPlayerControls(player: _player),
              )
            : const CircularProgressIndicator(),
      ),
    );
  }
}
