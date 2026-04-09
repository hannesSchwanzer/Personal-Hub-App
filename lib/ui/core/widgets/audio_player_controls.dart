import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:rxdart/rxdart.dart';

class AudioPlayerControls extends StatefulWidget {
  final AudioPlayer player;

  const AudioPlayerControls({super.key, required this.player});

  @override
  State<AudioPlayerControls> createState() => _AudioPlayerControlsState();
}

class _AudioPlayerControlsState extends State<AudioPlayerControls> {
  late List<Duration> _durations;

  @override
  void initState() {
    super.initState();
    _durations = _getDurations();
  }

  List<Duration> _getDurations() {
    final sequence = widget.player.sequence;

    return sequence.map((s) => s.duration ?? Duration.zero).toList();
  }

  Duration _totalDuration(List<Duration> durations) {
    return durations.fold(Duration.zero, (a, b) => a + b);
  }

  Duration _globalPosition(
    int? index,
    Duration position,
    List<Duration> durations,
  ) {
    if (index == null) return position;

    Duration offset = Duration.zero;

    for (int i = 0; i < index; i++) {
      offset += durations[i];
    }

    return offset + position;
  }

  Future<void> _seekGlobal(Duration target, List<Duration> durations) async {
    Duration accumulated = Duration.zero;

    for (int i = 0; i < durations.length; i++) {
      final next = accumulated + durations[i];

      if (target < next) {
        final local = target - accumulated;
        await widget.player.seek(local, index: i);
        return;
      }

      accumulated = next;
    }
  }

  String _format(Duration d) {
    final minutes = d.inMinutes.remainder(60).toString().padLeft(2, '0');
    final seconds = d.inSeconds.remainder(60).toString().padLeft(2, '0');
    return "$minutes:$seconds";
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<PlayerState>(
      stream: widget.player.playerStateStream,
      builder: (context, playerSnapshot) {
        final isPlaying = playerSnapshot.data?.playing ?? false;

        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            /// PLAY / PAUSE
            IconButton(
              iconSize: 48,
              icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
              onPressed: () {
                isPlaying ? widget.player.pause() : widget.player.play();
              },
            ),

            /// SLIDER + TIME
            StreamBuilder<Map<String, Duration>>(
              stream: Rx.combineLatest2<int?, Duration, Map<String, Duration>>(
                widget.player.currentIndexStream,
                widget.player.positionStream,
                (index, position) {
                  final globalPos = _globalPosition(
                    index,
                    position,
                    _durations,
                  );
                  final total = _totalDuration(_durations);

                  return {'position': globalPos, 'total': total};
                },
              ),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const SizedBox();
                }

                final position = snapshot.data!['position']!;
                final total = snapshot.data!['total']!;

                return Column(
                  children: [
                    Slider(
                      min: 0,
                      max: total.inMilliseconds.toDouble(),
                      value: position.inMilliseconds
                          .clamp(0, total.inMilliseconds)
                          .toDouble(),
                      onChanged: (value) {
                        _seekGlobal(
                          Duration(milliseconds: value.toInt()),
                          _durations,
                        );
                      },
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
