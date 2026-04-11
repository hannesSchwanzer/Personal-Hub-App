import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:personal_hub_app/domain/entities/audio_file.dart';
import 'package:personal_hub_app/ui/core/widgets/audio_player_controls.dart';
import 'package:personal_hub_app/utils/providers.dart';

/// GuidedMeditationScreen displays a guided meditation:
/// - Title at the top
/// - Audio controls in the middle
/// - Description at the bottom
/// 
/// Takes a [playlist] (list of pairs: audio file + repetition count),
/// as well as a [title] and [description] for display.
class GuidedMeditationScreen extends ConsumerStatefulWidget {
  final String title;
  final String description;
  final List<(AudioFile, int)> playlist;

  const GuidedMeditationScreen({
    super.key,
    required this.title,
    required this.description,
    required this.playlist,
  });

  @override
  ConsumerState<GuidedMeditationScreen> createState() => _GuidedMeditationScreenState();
}

class _GuidedMeditationScreenState extends ConsumerState<GuidedMeditationScreen> {
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _initAudio();
  }

  Future<void> _initAudio() async {
    final audioPlayerService = ref.read(audioPlayerServiceProvider);

    await audioPlayerService.setAudioSourcesWithRepetitions(widget.playlist);

    setState(() {
      _loading = false;
    });
  }

  @override
  void dispose() {
    // optionally: dispose player if required on exiting screen
    // ref.read(audioPlayerServiceProvider).dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Audio controls
                  const AudioPlayerControls(sliderEnabled: true),
                  const SizedBox(height: 32),
                  // Description
                  Expanded(
                    child: SingleChildScrollView(
                      child: Text(
                        widget.description,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}

