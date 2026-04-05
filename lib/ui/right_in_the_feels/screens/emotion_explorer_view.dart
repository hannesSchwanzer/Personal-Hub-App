import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:personal_hub_app/ui/core/widgets/tab_tool_tip.dart';
import 'package:personal_hub_app/ui/right_in_the_feels/models/emotion_tree.dart';
import 'package:personal_hub_app/ui/right_in_the_feels/view_models/emotion_explorer_view_model.dart';
import 'package:personal_hub_app/ui/right_in_the_feels/models/emotion_ui_model.dart';
import 'package:personal_hub_app/l10n/app_localizations.dart';

/// Emotion Explorer view: Select a first-level emotion and journal for each third-level emotion.
class EmotionExplorerView extends ConsumerWidget {
  const EmotionExplorerView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(emotionExplorerViewModelProvider);
    final notifier = ref.read(emotionExplorerViewModelProvider.notifier);

    // Tabs for first-level emotions
    final level1Emotions = emotionTree;
    final level1Index = state.selectedLevel1Id == null
        ? 0
        : level1Emotions.indexWhere((e) => e.id == state.selectedLevel1Id);
    final currentLevel1 =
        (level1Index >= 0 && level1Index < level1Emotions.length)
        ? level1Emotions[level1Index]
        : (level1Emotions.isNotEmpty ? level1Emotions.first : null);

    // Collect all third-level emotions given the structure
    final thirdLevels = <EmotionUiModel>[];
    if (currentLevel1 != null) {
      for (final level2 in currentLevel1.children) {
        thirdLevels.addAll(level2.children);
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.emotionExplorerTitle),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: currentLevel1 == null
          ? Center(child: Text(AppLocalizations.of(context)!.emotionExplorerNoEmotions))
          : GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              behavior: HitTestBehavior.translucent,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TapTooltip(
                      tooltipBuilder: (context) => Container(
                        width: 260,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 8,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Text(
                          AppLocalizations.of(context)!.emotionExplorerTooltip,
                          style: const TextStyle(fontSize: 15),
                          softWrap: true,
                        ),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Text(
                              AppLocalizations.of(context)!.emotionExplorerQuestion,
                              style: const TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                              softWrap: true,
                              overflow: TextOverflow.visible,
                            ),
                          ),
                          const SizedBox(width: 8),
                          const Icon(Icons.help_outline, size: 22),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    // Tab Row
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          for (int i = 0; i < level1Emotions.length; i++)
                            Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: ChoiceChip(
                                label: Text(
                                  level1Emotions[i].localizedName(context)
                                ),
                                selected:
                                    currentLevel1.id == level1Emotions[i].id,
                                onSelected: (selected) {
                                  if (selected) {
                                    notifier.selectLevel1(level1Emotions[i]);
                                  }
                                },
                                selectedColor: level1Emotions[i].color,
                                backgroundColor: level1Emotions[i].color
                                    .withAlpha(50),
                              ),
                            ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Third level emotions & text fields
                    Expanded(
                      child: ListView.separated(
                        itemCount: thirdLevels.length,
                        separatorBuilder: (_, __) => const Divider(height: 32),
                        itemBuilder: (context, idx) {
                          final emotion = thirdLevels[idx];
                          final text = state.journalTexts[emotion.id] ?? '';
                          return _EmotionJournalEntry(
                            emotion: emotion,
                            value: text,
                            onChanged: (val) =>
                                notifier.updateJournalText(emotion.id, val),
                            hintText: AppLocalizations.of(context)!.emotionExplorerJournalHint,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }

  /// For labels like 'emotion_happy', returns 'Happy'
  static String _formatEmotionLabel(String id) {
    if (id.startsWith('emotion_')) {
      return id.replaceFirst('emotion_', '').split('_').first.toUpperCase() +
          id
              .replaceFirst('emotion_', '')
              .split('_')
              .skip(1)
              .map((e) => ' ${e[0].toUpperCase()}${e.substring(1)}')
              .join();
    }
    return id;
  }
}

/// Widget: A single third-level emotion with a TextField underneath.
class _EmotionJournalEntry extends StatelessWidget {
  final EmotionUiModel emotion;
  final String value;
  final void Function(String) onChanged;
  final String hintText;

  const _EmotionJournalEntry({
    required this.emotion,
    required this.value,
    required this.onChanged,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(Icons.circle, color: emotion.color, size: 18),
            const SizedBox(width: 8),
            Text(
              emotion.localizedName(context),
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ],
        ),
        const SizedBox(height: 6),
        LayoutBuilder(
          builder: (context, constraints) {
            final scrollController = ScrollController();
            return Scrollbar(
              thumbVisibility: true,
              controller: scrollController,
              child: TextField(
                decoration: InputDecoration(
                  hintText: hintText,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  filled: true,
                  fillColor: Theme.of(
                    context,
                  ).colorScheme.surfaceContainerHighest.withAlpha(76),
                ),
                minLines: 2,
                maxLines: 5,
                onChanged: onChanged,
                controller: TextEditingController(text: value)
                  ..selection = TextSelection.collapsed(offset: value.length),
                scrollController: scrollController,
              ),
            );
          },
        ),
      ],
    );
  }
}
