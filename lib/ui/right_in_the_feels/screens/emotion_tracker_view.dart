import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:personal_hub_app/domain/entities/body_map_drawing.dart';
import 'package:personal_hub_app/l10n/app_localizations.dart';
import 'package:personal_hub_app/ui/core/widgets/tab_tool_tip.dart';
import 'package:personal_hub_app/ui/right_in_the_feels/models/emotion_tree.dart';
import 'package:personal_hub_app/ui/right_in_the_feels/widgets/body_map_editor.dart';
import 'package:personal_hub_app/ui/right_in_the_feels/widgets/body_map_viewer.dart';
import 'package:personal_hub_app/ui/right_in_the_feels/widgets/emotion_selector.dart';
import 'package:personal_hub_app/ui/right_in_the_feels/view_models/emotion_tracker_view_model.dart';

/// View for tracking emotions with hierarchical selection, journaling, and body map.
/// Uses EmotionTrackerViewModel for business logic.
class EmotionTrackerView extends ConsumerWidget {
  const EmotionTrackerView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vm = ref.watch(emotionTrackerViewModelProvider);
    final notifier = ref.read(emotionTrackerViewModelProvider.notifier);

    // Show snackbar on entrySaved
    ref.listen<EmotionTrackerState>(emotionTrackerViewModelProvider, (
      prev,
      next,
    ) {
      if ((prev == null || !prev.entrySaved) && next.entrySaved) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              AppLocalizations.of(context)!.emotionTrackerEntrySaved,
            ),
            behavior: SnackBarBehavior.floating,
          ),
        );

        Navigator.of(context).pop();
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.emotionTrackerTitle),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Section 1: Emotion Selection
            _buildSectionHeader(
              AppLocalizations.of(context)!.emotionTrackerSectionFeeling,
              Icons.mood,
              tooltip: AppLocalizations.of(context)!.emotionTrackerSectionFeelingTooltip,
            ),
            const SizedBox(height: 12),
            EmotionSelector(
              rootEmotions: emotionTree,
              onSelectionChanged: notifier.updateEmotionSelection,
            ),
            const SizedBox(height: 32),
            // Section 2: Journal Entry
            _buildSectionHeader(
              AppLocalizations.of(context)!.emotionTrackerSectionJournal,
              Icons.edit_note,
              tooltip: AppLocalizations.of(context)!.emotionTrackerSectionJournalTooltip,
            ),
            const SizedBox(height: 12),
            TextField(
              key: const ValueKey('emotionTrackerTextField'),
              controller: TextEditingController(text: vm.journalText)
                ..selection = TextSelection.collapsed(
                  offset: vm.journalText.length,
                ),
              onChanged: notifier.updateJournalText,
              maxLines: 5,
              decoration: InputDecoration(
                hintText: AppLocalizations.of(
                  context,
                )!.emotionTrackerJournalHint,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                filled: true,
                fillColor: Theme.of(
                  context,
                ).colorScheme.surfaceContainerHighest.withValues(alpha: 0.3),
              ),
            ),
            const SizedBox(height: 32),
            // Section 3: Body Map
            _buildSectionHeader(
              AppLocalizations.of(context)!.emotionTrackerSectionBodyMap,
              Icons.accessibility_new,
              tooltip: AppLocalizations.of(context)!.emotionTrackerSectionBodyMapTooltip,
            ),
            const SizedBox(height: 12),
            GestureDetector(
              onTap: () async {
                await showModalBottomSheet<void>(
                  context: context,
                  useSafeArea: true,
                  isScrollControlled: true,
                  builder: (context) {
                    return SizedBox(
                      height: MediaQuery.of(context).size.height * 0.8,
                      child: BodyMapEditor(
                        initialDrawing: vm.bodyMapDrawing,
                        onChanged: (drawing) {
                          notifier.updateBodyMap(drawing);
                        },
                      ),
                    );
                  },
                );
              },
              child: _BodyMapPreview(drawing: vm.bodyMapDrawing),
            ),
            const SizedBox(height: 32),
            // Save Button
            SizedBox(
              width: double.infinity,
              child: FilledButton.icon(
                onPressed: vm.selectedLevel1Id != null
                    ? () => notifier.saveEntry()
                    : null,
                icon: const Icon(Icons.save),
                label: Text(
                  AppLocalizations.of(context)!.emotionTrackerSaveEntry,
                ),
              ),
            ),
            const SizedBox(height: 12),
            // Clear Button
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: _canClear(vm) ? () => notifier.clearEntry() : null,
                icon: const Icon(Icons.clear),
                label: Text(
                  AppLocalizations.of(context)!.emotionTrackerClearEntry,
                ),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  /// Section header with icon, title, and optional tap-to-open overlay tooltip for mobile.
  /// Tapping anywhere on the row (icon, title or ? icon) opens the tooltip;
  /// tapping anywhere else closes it.
  Widget _buildSectionHeader(String title, IconData icon, {String? tooltip}) {
    if (tooltip == null) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(icon, size: 24),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  softWrap: true,
                  overflow: TextOverflow.visible,
                ),
              ),
            ],
          );
        } else {
          // Use general-purpose TapTooltip widget for tooltip functionality
          return TapTooltip(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(icon, size: 24),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    softWrap: true,
                    overflow: TextOverflow.visible,
                  ),
            ),
            Icon(Icons.help_outline, size: 18, color: Colors.grey[500]),
          ],
        ),
        tooltipBuilder: (ctx) => ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 260),
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: Theme.of(ctx).cardColor,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 8,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(tooltip, style: Theme.of(ctx).textTheme.bodyMedium),
            ),
          ),
        ),
      );
    }
  }

  /// Returns true if any of the entry fields are not empty (so Clear makes sense).
  bool _canClear(EmotionTrackerState vm) {
    return (vm.selectedLevel1Id != null) ||
        (vm.journalText.isNotEmpty) ||
        (vm.bodyMapDrawing.strokes.isNotEmpty);
  }
}

class _BodyMapPreview extends StatelessWidget {
  final BodyMapDrawing drawing;

  const _BodyMapPreview({required this.drawing});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: BodyMapViewer(strokes: drawing.strokes),
    );
  }
}
