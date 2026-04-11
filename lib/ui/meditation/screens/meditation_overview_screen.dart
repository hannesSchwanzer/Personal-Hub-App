import 'package:flutter/material.dart';
import 'package:personal_hub_app/domain/entities/meditation_entry.dart';
import 'package:personal_hub_app/domain/entities/audio_file.dart';
import 'package:personal_hub_app/ui/meditation/screens/guided_meditation_screen.dart';

class MeditationOverviewScreen extends StatelessWidget {
  final MeditationEntry entry;

  const MeditationOverviewScreen({super.key, required this.entry});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(entry.title),
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
                    Text(entry.description, style: Theme.of(context).textTheme.bodyLarge),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Meta info as chips
            _MetaChipRow(entry: entry),
            Divider(height: 36, thickness: 1.1),
            // Audio selector panel
            _SectionPanel(
              icon: Icons.spa_rounded,
              title: "Audio Guidance",
              child: _buildMeditationSection(context, entry),
            ),
            // You can add more _SectionPanel for new content types (e.g. video) later
          ],
        ),
      ),
    );
  }

  Widget _buildMeditationSection(BuildContext context, MeditationEntry entry) {
    if (entry.audioComplete != null) {
      return _CompleteAudioSection(
        audioFile: entry.audioComplete!,
        title: entry.title,
        description: entry.description,
      );
    }
    if (entry.audioBeginning != null &&
        entry.audioRepeating != null &&
        entry.audioEnd != null) {
      return _SegmentedAudioSection(
        audioBeginning: entry.audioBeginning!,
        audioRepeating: entry.audioRepeating!,
        audioEnd: entry.audioEnd!,
        title: entry.title,
        description: entry.description,
      );
    }
    return const Text(
      'No audio available for this meditation.',
      style: TextStyle(color: Colors.red),
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
        label: Text(entry.type),
        labelStyle: Theme.of(context).textTheme.bodySmall,
        backgroundColor: Colors.indigo.shade50,
        shape: StadiumBorder(),
      ),
      Chip(
        avatar: Icon(Icons.flag, size: 18),
        label: Text('Level: ${entry.level}'),
        labelStyle: Theme.of(context).textTheme.bodySmall,
        backgroundColor: Colors.orange.shade50,
        shape: StadiumBorder(),
      ),
    ];
    if (entry.chakraType != null) {
      chips.add(
        Chip(
          avatar: Icon(Icons.brightness_low_rounded, size: 18),
          label: Text('Chakra: ${entry.chakraType!}'),
          labelStyle: Theme.of(context).textTheme.bodySmall,
          backgroundColor: Colors.pink.shade50,
          shape: StadiumBorder(),
        ),
      );
    }
    if (entry.cognitiveType != null) {
      chips.add(
        Chip(
          avatar: Icon(Icons.psychology_alt_rounded, size: 18),
          label: Text('Cognitive: ${entry.cognitiveType!}'),
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

class _CompleteAudioSection extends StatelessWidget {
  final AudioFile audioFile;
  final String title;
  final String description;

  const _CompleteAudioSection({
    required this.audioFile,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
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
          child: Row(
            children: [
              const Icon(Icons.audiotrack_rounded, color: Colors.indigo, size: 28),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  "Duration: ${_formatDuration(audioFile.duration)}",
                  style: Theme.of(context).textTheme.bodyLarge,
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
              // Navigate to GuidedMeditationScreen with one item playlist
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => GuidedMeditationScreen(
                    title: title,
                    description: description,
                    playlist: [(audioFile, 1)],
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
                textStyle: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)
            ),
          ),
        ),
      ],
    );
  }
}

class _SegmentedAudioSection extends StatefulWidget {
  final AudioFile audioBeginning;
  final AudioFile audioRepeating;
  final AudioFile audioEnd;
  final String title;
  final String description;

  const _SegmentedAudioSection({
    required this.audioBeginning,
    required this.audioRepeating,
    required this.audioEnd,
    required this.title,
    required this.description,
  });

  @override
  State<_SegmentedAudioSection> createState() => _SegmentedAudioSectionState();
}

class _SegmentedAudioSectionState extends State<_SegmentedAudioSection> {
  // The dropdown will be based on total durations calculated with a range of repetitions
  static const List<int> repetitionChoices = [1, 2, 3, 4, 5];
  int? selectedDropdownRep;
  bool isCustom = false;
  late TextEditingController _customMinutesController;

  @override
  void initState() {
    super.initState();
    selectedDropdownRep = repetitionChoices.first;
    _customMinutesController = TextEditingController();
  }

  @override
  void dispose() {
    _customMinutesController.dispose();
    super.dispose();
  }

  /// Calculates the minimum available duration for this meditation, with 1 repetition.
  int get minMinutes {
    final d = widget.audioBeginning.duration +
        widget.audioRepeating.duration +
        widget.audioEnd.duration;
    return d.inMinutes;
  }

  /// For a given number of repetitions, calculate total meditation duration.
  Duration totalDurationForReps(int repetitions) {
    return widget.audioBeginning.duration +
        (widget.audioRepeating.duration * repetitions) +
        widget.audioEnd.duration;
  }

  /// For a desired minute count, compute the repetitions needed (always rounds up)
  int repetitionsForDesiredMinutes(int desiredMinutes) {
    final segA = widget.audioBeginning.duration;
    final segB = widget.audioRepeating.duration;
    final segC = widget.audioEnd.duration;
    if (segB.inSeconds == 0) return 1;
    final desiredDuration = Duration(minutes: desiredMinutes);
    final leftover = desiredDuration - segA - segC;
    final n = (leftover.inSeconds / segB.inSeconds).ceil();
    return n < 1 ? 1 : n;
  }

  /// Returns the actual (effective) total duration for the current selection.
  Duration get effectiveTotalDuration {
    if (isCustom) {
      final val = int.tryParse(_customMinutesController.text);
      if (val == null || val < minMinutes) {
        return totalDurationForReps(1);
      }
      int reps = repetitionsForDesiredMinutes(val);
      return totalDurationForReps(reps);
    } else {
      return totalDurationForReps(selectedDropdownRep ?? 1);
    }
  }

  void _onDropdownChanged(int? repCount) {
    setState(() {
      if (repCount == null) {
        isCustom = true;
      } else {
        isCustom = false;
        selectedDropdownRep = repCount;
      }
    });
  }

  void _onCustomMinutesChanged(String value) {
    setState(() {
      // trigger recompute; actual validation is in getter
    });
  }

  @override
  Widget build(BuildContext context) {
    final customHint = "At least $minMinutes";
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Meditation Time",
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
              Text(
                "How long do you want to meditate?",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    flex: isCustom ? 2 : 1,
                    child: DropdownButtonFormField<int>(
                      value: isCustom ? null : selectedDropdownRep,
                      isExpanded: true,
                      decoration: InputDecoration(
                        labelText: "Preset duration",
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                        contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      ),
                      items: [
                        ...repetitionChoices.map((rep) {
                          final dur = totalDurationForReps(rep);
                          return DropdownMenuItem(
                            value: rep,
                            child: Text(
                                _formatDuration(dur)
                            ),
                          );
                        }),
                        const DropdownMenuItem(
                          value: null,
                          child: Text('Custom...'),
                        ),
                      ],
                      onChanged: _onDropdownChanged,
                    ),
                  ),
                  if (isCustom)
                    ...[
                      const SizedBox(width: 12),
                      SizedBox(
                        width: 90,
                        child: TextField(
                          controller: _customMinutesController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelText: "Minutes",
                            hintText: customHint,
                            border: const OutlineInputBorder(),
                            isDense: true,
                            contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                            filled: true,
                            fillColor: Colors.white,
                          ),
                          onChanged: _onCustomMinutesChanged,
                        ),
                      )
                    ],
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Icon(Icons.access_time_rounded, color: Colors.indigo[700]),
                  const SizedBox(width: 8),
                  Text(
                    "Total meditation time:",
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    _formatDuration(effectiveTotalDuration),
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              ),
              if (isCustom &&
                  _customMinutesController.text.isNotEmpty &&
                  int.tryParse(_customMinutesController.text) != null &&
                  int.parse(_customMinutesController.text) < minMinutes)
                Padding(
                  padding: const EdgeInsets.only(top: 6.0),
                  child: Text(
                    "Minimum is $minMinutes minutes.",
                    style: TextStyle(color: Colors.red[700], fontSize: 13),
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
              // Compute total repetitions based on selection
              int repetitions = isCustom
                  ? repetitionsForDesiredMinutes(
                      int.tryParse(_customMinutesController.text) ?? minMinutes)
                  : (selectedDropdownRep ?? 1);

              // Create the playlist as spec: beginning (1), repeating (n), end (1)
              final playlist = [
                (widget.audioBeginning, 1),
                (widget.audioRepeating, repetitions),
                (widget.audioEnd, 1),
              ];

              // Navigate to the GuidedMeditationScreen
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => GuidedMeditationScreen(
                    title: widget.title,
                    description: widget.description,
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
        color: Theme.of(context).colorScheme.surfaceVariant.withOpacity(0.2),
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

