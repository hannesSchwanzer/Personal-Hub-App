import 'package:flutter/material.dart';
import 'package:personal_hub_app/domain/entities/meditation/meditation_entry.dart';

/// Callback type for exporting repetitions info
typedef RepetitionChangedCallback = void Function(int repetitions);

/// A widget to pick the amount of repetitions for a meditation cycle.
/// It displays the overall meditation duration for each option including start and end.
/// Supports both default and custom durations, and exports the repetition count externally.
class MeditationRepetitionPicker extends StatefulWidget {
  final MeditationEntry meditation;
  final int initialRepetitions;
  final RepetitionChangedCallback onChanged;

  const MeditationRepetitionPicker({
    super.key,
    required this.meditation,
    required this.initialRepetitions,
    required this.onChanged,
  });

  @override
  State<MeditationRepetitionPicker> createState() =>
      _MeditationRepetitionPickerState();
}

class _MeditationRepetitionPickerState extends State<MeditationRepetitionPicker> {
  late int _repetitions;
  bool _customMode = false;
  int? _customMinutes;
  final TextEditingController _customController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _repetitions = widget.initialRepetitions.clamp(1, 5);
  }

  /// Calculates the total duration for a given number of repetitions.
  /// For each audio section with isRepeating == true, its duration is multiplied by [repetitions].
  /// All other audio sections are counted once.
  Duration _calcTotalDuration(int repetitions) {
    final sections = widget.meditation.audioSections ?? [];
    Duration total = Duration.zero;
    for (final section in sections) {
      if (section.isRepeating) {
        total += section.file.duration * repetitions;
      } else {
        total += section.file.duration;
      }
    }
    // Fallback for legacy: If no sections, return zero.
    return total;
  }

  String _durationToString(Duration duration) {
    final totalMinutes = duration.inMinutes;
    final remainingSeconds = duration.inSeconds % 60;
    return "$totalMinutes:${remainingSeconds.toString().padLeft(2, '0')} min";
  }

  // No longer needed: custom picker dialog replaced with inline input field.

  /// Finds the repetition count (n >= 1) for which total duration is closest to [targetMinutes].
  int _findNearestRepetition(int targetMinutes) {
    final sections = widget.meditation.audioSections ?? [];
    final hasRepeater = sections.any((s) => s.isRepeating);
    if (!hasRepeater) {
      // No repeatable sections, just use 1
      return 1;
    }
    int bestN = 1;
    int minDiff = (_calcTotalDuration(1).inMinutes - targetMinutes).abs();

    for (int n = 1; n <= 100; n++) { // arbitrary max 100 reps for sanity
      final total = _calcTotalDuration(n);
      final diff = (total.inMinutes - targetMinutes).abs();
      if (diff < minDiff) {
        minDiff = diff;
        bestN = n;
        if (diff == 0) break;
      }
    }
    return bestN;
  }

  @override
  Widget build(BuildContext context) {
    final defaultOptions = List.generate(5, (i) => i + 1);
    final customOptionValue = -1; // sentinel for "Custom"

    // Build dropdown items
    final items = [
      ...defaultOptions.map(
        (n) => DropdownMenuItem<int>(
          value: n,
          child: Text(_durationToString(_calcTotalDuration(n))),
        ),
      ),
      DropdownMenuItem<int>(
        value: customOptionValue,
        child: const Text("Custom..."),
      ),
    ];

    int dropdownValue = _customMode ? customOptionValue : _repetitions;

    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: 12,
      runSpacing: 8,
      children: [
        const Text("Total duration:"),
        DropdownButton<int>(
          value: dropdownValue,
          items: items,
          onChanged: (value) {
            if (value == null) return;
            if (value == customOptionValue) {
              setState(() {
                _customMode = true;
                // Prefill if previously used
                if (_customMinutes != null) {
                  _repetitions = _findNearestRepetition(_customMinutes!);
                  _customController.text = _customMinutes.toString();
                } else {
                  _customController.clear();
                }
              });
            } else {
              setState(() {
                _repetitions = value;
                _customMode = false;
                _customMinutes = null;
                _customController.clear();
              });
              widget.onChanged(_repetitions);
            }
          },
        ),
        Text(
          _customMode
              ? "$_repetitions reps ≈ ${_durationToString(_calcTotalDuration(_repetitions))}"
              : "$_repetitions reps",
          style: const TextStyle(fontSize: 12, color: Colors.grey),
        ),
        if (_customMode)
          SizedBox(
            width: 80,
            child: TextField(
              controller: _customController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Minutes",
                hintText: "Enter min",
                isDense: true,
              ),
              autofocus: true,
              onChanged: (value) {
                int? mins = int.tryParse(value);
                if (mins != null && mins > 0) {
                  setState(() {
                    _customMinutes = mins;
                    _repetitions = _findNearestRepetition(mins);
                  });
                  widget.onChanged(_repetitions);
                }
              },
              onSubmitted: (value) {
                int? mins = int.tryParse(value);
                if (mins != null && mins > 0) {
                  setState(() {
                    _customMinutes = mins;
                    _repetitions = _findNearestRepetition(mins);
                  });
                  widget.onChanged(_repetitions);
                }
              },
            ),
          ),
      ],
    );
  }
}

