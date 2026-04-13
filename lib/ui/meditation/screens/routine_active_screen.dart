/// RoutineActiveScreen displays a meditation routine with navigation and audio controls.
/// 
/// - Shows the routine title at the top
/// - Audio controls in the middle (one meditation at a time)
/// - Next / Prev buttons for navigation
/// - Below: the selected meditation's description
/// - At the bottom: a clickable list of all routine meditations (highlights selected)
/// 
/// On opening, loads the first meditation.
/// Changing meditation updates the audio player accordingly.
///
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:personal_hub_app/domain/entities/audio_file.dart';
import 'package:personal_hub_app/ui/core/widgets/audio_player_controls.dart';
import 'package:personal_hub_app/utils/providers.dart';

import 'package:personal_hub_app/domain/entities/meditation/routine_entity.dart';
import 'dart:math';

/// Returns the formatted duration string for a given [Duration] (e.g. 7m 30s).
String formatDuration(Duration duration) {
  final minutes = duration.inMinutes;
  final secs = duration.inSeconds % 60;
  if (minutes > 0) {
    return "${minutes}m ${secs.toString().padLeft(2, '0')}s";
  }
  return "${secs}s";
}

/// Calculates the total duration of all audio files in a routine item based on the current meditation's audioSections.
Duration totalRoutineItemDuration(RoutineItem item) {
  final meditation = item.meditation;
  Duration duration = Duration.zero;
  if (meditation.audioSections != null) {
    for (final section in meditation.audioSections!) {
      if (section.isRepeating) {
        duration += section.file.duration * item.repetitions;
      } else {
        duration += section.file.duration;
      }
    }
  }
  return duration;
}

class RoutineActiveScreen extends ConsumerStatefulWidget {
  final RoutineEntity routine;

  /// Optionally start at a given meditation.
  final int initialIndex;

  const RoutineActiveScreen({
    super.key,
    required this.routine,
    this.initialIndex = 0,
  });

  @override
  ConsumerState<RoutineActiveScreen> createState() => _RoutineActiveScreenState();
}

class _RoutineActiveScreenState extends ConsumerState<RoutineActiveScreen> {
  late int _currentIndex;
  bool _audioLoading = true;

  List<RoutineItem> get _items => widget.routine.items;

  /// Returns the currently focused RoutineItem.
  RoutineItem get _currentItem => _items[_currentIndex];

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
    _loadMeditationAudio();
  }

  /// Loads audio for the current meditation into the audio player.
  Future<void> _loadMeditationAudio() async {
    setState(() => _audioLoading = true);
    final audioPlayerService = ref.read(audioPlayerServiceProvider);

    final meditation = _currentItem.meditation;
    final List<AudioFile> audioFiles = [];

    // Go through the meditation audioSections.
    if (meditation.audioSections != null && meditation.audioSections!.isNotEmpty) {
      for (final section in meditation.audioSections!) {
        if (section.isRepeating) {
          // Repeat this file for as many times as the routine item's repetitions.
          audioFiles.addAll(List.generate(_currentItem.repetitions, (_) => section.file));
        } else {
          audioFiles.add(section.file);
        }
      }
    }

    if (audioFiles.isNotEmpty) {
      await audioPlayerService.setAudioSources(audioFiles);
    } else {
      await audioPlayerService.stop();
    }

    setState(() => _audioLoading = false);
  }

  void _goToMeditation(int newIndex) {
    if (newIndex < 0 || newIndex >= _items.length) return;
    setState(() {
      _currentIndex = newIndex;
      _audioLoading = true;
    });
    _loadMeditationAudio();
  }

  void _nextMeditation() {
    if (_currentIndex < _items.length - 1) {
      _goToMeditation(_currentIndex + 1);
    }
  }

  void _prevMeditation() {
    if (_currentIndex > 0) {
      _goToMeditation(_currentIndex - 1);
    }
  }

  @override
  void dispose() {
    // Optionally: dispose or stop audio if wanted when leaving routine
    // ref.read(audioPlayerServiceProvider).dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final routine = widget.routine;
    final item = _currentItem;
    final m = item.meditation;

    return Scaffold(
      appBar: AppBar(
        title: Text(routine.name),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            if (_audioLoading)
              const Center(child: CircularProgressIndicator())
            else
              const AudioPlayerControls(sliderEnabled: true),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _currentIndex == 0 ? null : _prevMeditation,
                  child: const Icon(Icons.arrow_left),
                ),
                const SizedBox(width: 24),
                ElevatedButton(
                  onPressed: _currentIndex == _items.length - 1 ? null : _nextMeditation,
                  child: const Icon(Icons.arrow_right),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              m.title,
              style: Theme.of(context).textTheme.titleLarge,
              textAlign: TextAlign.center,
            ),
            // Display duration instead of repetitions
            Padding(
              padding: const EdgeInsets.only(top: 2.0),
              child: Text(
                'Duration: ${formatDuration(totalRoutineItemDuration(item))}',
                style: TextStyle(
                  fontSize: 14,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: SingleChildScrollView(
                child: Text(
                  m.description,
                  style: Theme.of(context).textTheme.bodyLarge,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const SizedBox(height: 8),
            // Routine item selector: show all meditations in the routine as a vertical list
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: SizedBox(
                height: min(MediaQuery.of(context).size.height * 0.33, _items.length * 65),
                child: ListView.separated(
                  itemCount: _items.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 8),
                  itemBuilder: (context, i) {
                    final entry = _items[i].meditation;
                    final selected = i == _currentIndex;
                    final duration = totalRoutineItemDuration(_items[i]);
                    return GestureDetector(
                      onTap: selected ? null : () => _goToMeditation(i),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
                        decoration: BoxDecoration(
                          color: selected
                              ? Theme.of(context).colorScheme.primary.withOpacity(0.15)
                              : Colors.transparent,
                          border: Border.all(
                            color: selected
                                ? Theme.of(context).colorScheme.primary
                                : Colors.grey.withOpacity(0.5),
                            width: selected ? 2.3 : 1.2,
                          ),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                entry.title,
                                style: TextStyle(
                                  fontWeight: selected ? FontWeight.bold : FontWeight.normal,
                                  color: selected
                                      ? Theme.of(context).colorScheme.primary
                                      : Theme.of(context).textTheme.bodyMedium?.color,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Text(
                              "Duration: ${formatDuration(duration)}",
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.secondary,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

