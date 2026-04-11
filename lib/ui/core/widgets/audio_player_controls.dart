import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:just_audio/just_audio.dart';
import 'package:personal_hub_app/data/services/audio_player_service.dart';
import 'package:personal_hub_app/utils/providers.dart';

/// AudioPlayerControls displays playback controls and a seekable timeline
/// for multiple audio sources treated as a single continuous stream.
/// 
/// Accesses [AudioPlayerService] via Riverpod and does not depend on
/// any library-internal `just_audio` types.
///
/// - Shows Play/Pause, global time slider, and progress.
/// - Automatically calculates total and current global duration.
/// - Seeks and updates position using the service.
/// 
/// Usage: Place inside a ConsumerWidget or use Consumer in a build method.
class AudioPlayerControls extends ConsumerStatefulWidget {
  /// If false, the user cannot interactively seek with the slider.
  final bool sliderEnabled;

  const AudioPlayerControls({
    super.key,
    this.sliderEnabled = true,
  });

  @override
  ConsumerState<AudioPlayerControls> createState() => _AudioPlayerControlsState();
}

class _AudioPlayerControlsState extends ConsumerState<AudioPlayerControls> {
  late final AudioPlayerService _playerService;

  /// Format a [Duration] as mm:ss.
  String _format(Duration d) {
    final minutes = d.inMinutes.remainder(60).toString().padLeft(2, '0');
    final seconds = d.inSeconds.remainder(60).toString().padLeft(2, '0');
    return "$minutes:$seconds";
  }

  @override
  void initState() {
    super.initState();
    _playerService = ref.read(audioPlayerServiceProvider);
  }

  @override
  void dispose() {
    // Safely pause audio.
    _playerService.pause();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final playerService = ref.watch(audioPlayerServiceProvider);

    return StreamBuilder<PlayerState>(
      stream: playerService.playerStateStream,
      builder: (context, playerSnapshot) {
        final isPlaying = playerSnapshot.data?.playing ?? false;

        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            /// PLAY / PAUSE
            IconButton(
              iconSize: 48,
              icon: playerSnapshot.data?.processingState == ProcessingState.loading ||
                      playerSnapshot.data?.processingState == ProcessingState.buffering
                  ? SizedBox(
                      width: 36,
                      height: 36,
                      child: CircularProgressIndicator(strokeWidth: 3),
                    )
                  : Icon(isPlaying ? Icons.pause : Icons.play_arrow),
              onPressed: playerSnapshot.data?.processingState == ProcessingState.loading ||
                         playerSnapshot.data?.processingState == ProcessingState.buffering
                  ? null
                  : () {
                      isPlaying
                          ? playerService.pause()
                          : playerService.play();
                    },
            ),

            /// SLIDER + TIME
            StreamBuilder<Duration>(
              stream: playerService.positionStream,
              builder: (context, positionSnapshot) {
                final position = positionSnapshot.data ?? Duration.zero;
                final total = playerService.duration;

                return Column(
                  children: [
                    Slider(
                      min: 0,
                      max: total.inMilliseconds.toDouble(),
                      value: position.inMilliseconds
                          .clamp(0, total.inMilliseconds)
                          .toDouble(),
                      onChanged: widget.sliderEnabled
                          ? (value) {
                              playerService.seek(Duration(milliseconds: value.toInt()));
                            }
                          : null, // disables interactive seek if false
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(_format(position)),
                          Text(_format(total)),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        );
      },
    );
  }
}
