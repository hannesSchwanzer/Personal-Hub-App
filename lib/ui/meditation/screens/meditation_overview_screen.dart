import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:personal_hub_app/domain/entities/audio_file.dart';
import 'package:personal_hub_app/domain/entities/meditation/meditation_entry.dart';
import 'package:personal_hub_app/ui/meditation/screens/guided_meditation_screen.dart';
import 'package:personal_hub_app/ui/meditation/utils/meditation_string_utils.dart';
import 'package:personal_hub_app/ui/meditation/widgets/meditation_repetition_picker.dart';
import 'package:personal_hub_app/utils/providers.dart';

class MeditationOverviewScreen extends ConsumerWidget {
  final MeditationEntry entry;

  const MeditationOverviewScreen({super.key, required this.entry});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final meditationRepo = ref.watch(meditationRepositoryProvider);
    final entryStream = ref.watch(meditationEntryProvider(entry.id));

    return entryStream.when(
      loading: () => const Scaffold(body: Center(child: CircularProgressIndicator())),
      error: (error, stack) => Scaffold(
        appBar: AppBar(title: const Text("Meditation")),
        body: Center(child: Text("Error loading meditation")),
      ),
      data: (currentEntry) {
        if (currentEntry == null) {
          return Scaffold(
            appBar: AppBar(title: const Text("Meditation")),
            body: Center(child: Text("Meditation not found")),
          );
        }
        return Scaffold(
          appBar: AppBar(
            title: Row(
              children: [
                Expanded(child: Text(currentEntry.title)),
                IconButton(
                  icon: currentEntry.favorite
                      ? Icon(Icons.star_rounded, color: Colors.amber[700])
                      : Icon(Icons.star_border_rounded, color: Colors.grey[400]),
                  tooltip: currentEntry.favorite ? 'Remove from favorites' : 'Mark as favorite',
                  onPressed: () async {
                    final updated = currentEntry.copyWith(favorite: !currentEntry.favorite);
                    await meditationRepo.updateEntry(updated);
                  },
                  splashRadius: 22,
                ),
              ],
            ),
          ),
          body: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                // Description in Card
                Card(
                  color: Theme.of(context).colorScheme.surface,
                  elevation: 2,
                  margin: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.all(18),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('About this meditation',
                            style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
                        const SizedBox(height: 10),
                        Text(currentEntry.description, style: Theme.of(context).textTheme.bodyLarge),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                // Meta info as chips
                _MetaChipRow(entry: currentEntry),
                Divider(height: 36, thickness: 1.1),
                // Audio selector panel
                _SectionPanel(
                  icon: Icons.spa_rounded,
                  title: "Audio Guidance",
                  child: _buildMeditationSection(context, currentEntry),
                ),
              ],
            ),
          ),
        );
      }
    );
  }

  Widget _buildMeditationSection(BuildContext context, MeditationEntry entry) {
    if (entry.audioSections == null || entry.audioSections!.isEmpty) {
      return const Text(
        'No audio available for this meditation.',
        style: TextStyle(color: Colors.red),
      );
    }
    // If there are no repeatable files, just play in order
    final hasRepeatable = entry.audioSections!.any((a) => a.isRepeating);
    if (!hasRepeatable) {
      return _AudioSectionList(
        entry: entry,
        showRepetitionPicker: false,
      );
    }
    // At least one repeatable file: show picker
    return _AudioSectionList(
      entry: entry,
      showRepetitionPicker: true,
    );
  }
}

class _MetaChipRow extends StatelessWidget {
  final MeditationEntry entry;

  const _MetaChipRow({required this.entry});

  @override
  Widget build(BuildContext context) {
    final chips = <Widget>[
      Chip(
        avatar: Icon(Icons.style, size: 18),
        label: Text(entry.type.displayName),
        labelStyle: Theme.of(context).textTheme.bodySmall,
        backgroundColor: Colors.indigo.shade50,
        shape: StadiumBorder(),
      ),
      Chip(
        avatar: Icon(Icons.flag, size: 18),
        label: Text(entry.level.displayName),
        labelStyle: Theme.of(context).textTheme.bodySmall,
        backgroundColor: Colors.orange.shade50,
        shape: StadiumBorder(),
      ),
    ];
    if (entry.chakraType != null) {
      chips.add(
        Chip(
          avatar: Icon(Icons.brightness_low_rounded, size: 18),
          label: Text(entry.chakraType!.displayName),
          labelStyle: Theme.of(context).textTheme.bodySmall,
          backgroundColor: Colors.pink.shade50,
          shape: StadiumBorder(),
        ),
      );
    }
    for (final ct in entry.cognitiveTypes) {
      chips.add(
        Chip(
          avatar: Icon(Icons.psychology_alt_rounded, size: 18),
          label: Text(ct.displayName),
          labelStyle: Theme.of(context).textTheme.bodySmall,
          backgroundColor: Colors.teal.shade50,
          shape: StadiumBorder(),
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Wrap(
        spacing: 12,
        children: chips,
      ),
    );
  }
}

/// Shows a list of meditation audio sections, supporting repetition for repeating sections.
class _AudioSectionList extends StatefulWidget {
  final MeditationEntry entry;
  final bool showRepetitionPicker;

  const _AudioSectionList({
    required this.entry,
    required this.showRepetitionPicker,
  });

  @override
  State<_AudioSectionList> createState() => _AudioSectionListState();
}

class _AudioSectionListState extends State<_AudioSectionList> {
  int _selectedRepetitions = 1;

  @override
  Widget build(BuildContext context) {
    final sections = widget.entry.audioSections!;
    final totalDuration = _calculateTotalDuration(sections, _selectedRepetitions);
    final repeatableCount = sections.where((a) => a.isRepeating).length;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Meditation Audio",
          style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (widget.showRepetitionPicker) ...[
                Text(
                  "How long do you want to meditate?",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(height: 12),
                MeditationRepetitionPicker(
                  meditation: widget.entry,
                  initialRepetitions: _selectedRepetitions,
                  onChanged: (reps) {
                    setState(() {
                      _selectedRepetitions = reps;
                    });
                  },
                ),
                const SizedBox(height: 10),
              ],
              Row(
                children: [
                  Icon(Icons.audiotrack_rounded, color: Colors.indigo, size: 22),
                  const SizedBox(width: 8),
                  Text(
                    "Total duration: ${_formatDuration(totalDuration)}",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
              if (repeatableCount > 0)
                Padding(
                  padding: const EdgeInsets.only(top: 6),
                  child: Text(
                    "Repeating sections: $repeatableCount (reps = $_selectedRepetitions)",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton.icon(
            onPressed: () {
              final playlist = _buildPlaylist(sections, _selectedRepetitions);
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => GuidedMeditationScreen(
                    title: widget.entry.title,
                    description: widget.entry.description,
                    playlist: playlist,
                  ),
                ),
              );
            },
            icon: const Icon(Icons.play_arrow_rounded),
            label: const Text("Start Meditation"),
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              textStyle: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }

  /// Builds the meditation playlist: (AudioFile, count) according to the repetition rules.
  List<(AudioFile, int)> _buildPlaylist(List<RepeatingAudio> sections, int repetitionCount) {
    final result = <(AudioFile, int)>[];
    for (final section in sections) {
      final count = section.isRepeating ? repetitionCount : 1;
      result.add((section.file, count));
    }
    return result;
  }

  /// Computes the total duration of all sections, accounting for repetitions.
  Duration _calculateTotalDuration(List<RepeatingAudio> sections, int repetitionCount) {
    Duration total = Duration.zero;
    for (final section in sections) {
      final count = section.isRepeating ? repetitionCount : 1;
      total += section.file.duration * count;
    }
    return total;
  }
}



/// Small panel widget for section grouping
class _SectionPanel extends StatelessWidget {
  final String title;
  final Widget child;
  final IconData icon;

  const _SectionPanel({required this.title, required this.child, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 2),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerHighest.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(18, 16, 18, 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: Colors.indigo[400], size: 22),
                const SizedBox(width: 7),
                Text(title, style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(height: 10),
            child,
          ],
        ),
      ),
    );
  }
}

/// Formats a [Duration] as mm:ss
String _formatDuration(Duration duration) {
  final minutes = duration.inMinutes;
  final seconds = duration.inSeconds % 60;
  return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
}

