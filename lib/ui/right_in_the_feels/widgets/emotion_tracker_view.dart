import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:personal_hub_app/l10n/app_localizations.dart';
import 'package:personal_hub_app/ui/right_in_the_feels/models/emotion_tree.dart';
import 'package:personal_hub_app/ui/right_in_the_feels/widgets/emotion_selector.dart';
import 'package:personal_hub_app/ui/right_in_the_feels/viewmodels/emotion_tracker_view_model.dart';

/// View for tracking emotions with hierarchical selection, journaling, and body map.
/// Uses EmotionTrackerViewModel for business logic.
class EmotionTrackerView extends ConsumerWidget {
  const EmotionTrackerView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vm = ref.watch(emotionTrackerViewModelProvider);
    final notifier = ref.read(emotionTrackerViewModelProvider.notifier);

    // Show snackbar on entrySaved
    ref.listen<EmotionTrackerState>(emotionTrackerViewModelProvider, (prev, next) {
      if ((prev == null || !prev.entrySaved) && next.entrySaved) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(AppLocalizations.of(context)!.emotionTrackerEntrySaved),
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
            _buildSectionHeader(AppLocalizations.of(context)!.emotionTrackerSectionFeeling, Icons.mood),
            const SizedBox(height: 12),
            EmotionSelector(
              rootEmotions: emotionTree,
              onSelectionChanged: notifier.updateEmotionSelection,
            ),
            const SizedBox(height: 32),
            // Section 2: Journal Entry
            _buildSectionHeader(AppLocalizations.of(context)!.emotionTrackerSectionJournal, Icons.edit_note),
            const SizedBox(height: 12),
            TextField(
              key: const ValueKey('emotionTrackerTextField'),
              controller: TextEditingController(text: vm.journalText)
                ..selection = TextSelection.collapsed(offset: vm.journalText.length),
              onChanged: notifier.updateJournalText,
              maxLines: 5,
              decoration: InputDecoration(
                hintText: AppLocalizations.of(context)!.emotionTrackerJournalHint,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                filled: true,
                fillColor: Theme.of(context)
                    .colorScheme
                    .surfaceContainerHighest
                    .withValues(alpha: 0.3),
              ),
            ),
            const SizedBox(height: 32),
            // Section 3: Body Map (Coming Soon)
            _buildSectionHeader(AppLocalizations.of(context)!.emotionTrackerSectionBodyMap, Icons.accessibility_new),
            const SizedBox(height: 12),
            Container(
              height: 200,
              decoration: BoxDecoration(
                color: Theme.of(context)
                    .colorScheme
                    .surfaceContainerHighest
                    .withValues(alpha: 0.3),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.3),
                ),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.draw_outlined,
                      size: 48,
                      color: Theme.of(context).colorScheme.outline,
                    ),
                    const SizedBox(height: 12),
                    Text(
                      AppLocalizations.of(context)!.emotionTrackerComingSoon,
                      style: TextStyle(
                        fontSize: 16,
                        color: Theme.of(context).colorScheme.outline,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      AppLocalizations.of(context)!.emotionTrackerDrawHint,
                      style: TextStyle(
                        fontSize: 12,
                        color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.7),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 32),
            // Save Button
            SizedBox(
              width: double.infinity,
              child: FilledButton.icon(
                onPressed:
                    vm.selectedLevel1Id != null
                        ? () => notifier.saveEntry()
                        : null,
                icon: const Icon(Icons.save),
                label: Text(AppLocalizations.of(context)!.emotionTrackerSaveEntry),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title, IconData icon) {
    return Row(
      children: [
        Icon(icon, size: 24),
        const SizedBox(width: 8),
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}


