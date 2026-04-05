import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:personal_hub_app/l10n/app_localizations.dart';
import 'package:personal_hub_app/ui/right_in_the_feels/models/emotion_tree.dart';
import 'package:personal_hub_app/ui/right_in_the_feels/widgets/emotion_selector.dart';
import 'package:personal_hub_app/ui/right_in_the_feels/view_models/reflection_corner_view_model.dart';

class ReflectionCornerView extends ConsumerWidget {
  const ReflectionCornerView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(reflectionCornerViewModelProvider);
    final notifier = ref.read(reflectionCornerViewModelProvider.notifier);

    // Check on "reenter" if entry state is still valid or has changed, after the frame is built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      notifier.checkEntriesAndReloadIfChanged();
    });

    ref.listen<ReflectionCornerState>(reflectionCornerViewModelProvider, (
      prev,
      next,
    ) {
      if ((prev == null || !prev.submitted) && next.submitted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              AppLocalizations.of(context)!.reflectionCornerReflectionSaved,
            ),
            behavior: SnackBarBehavior.floating,
          ),
        );
        Navigator.of(context).pop();
      }
    });

    final entry = state.journalEntry;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      behavior: HitTestBehavior.opaque,
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.reflectionCornerTitle),
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        body: entry == null
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.sentiment_satisfied_alt,
                      size: 48,
                      color: Colors.grey,
                    ),
                    SizedBox(height: 16),
                    Text(
                      AppLocalizations.of(context)!.reflectionCornerNoEntries,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  ],
                ),
              )
            : SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 1. Entry info
                    Text(
                      DateFormat.yMMMMd(
                        AppLocalizations.of(context)!.localeName,
                      ).format(entry.createdAt),
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    const SizedBox(height: 8),
                    Card(
                      color: Theme.of(context).colorScheme.surfaceVariant,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: Text(
                          entry.entry,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ),
                    ),
                    const SizedBox(height: 28),

                    // 2. Past Emotion
                    Text(
                      AppLocalizations.of(context)!.reflectionCornerEmotionEntry,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 8),
                    EmotionSelector(
                      rootEmotions: emotionTree,
                      selectedLevel1Id: state.guessedEmotionLevel1Id,
                      selectedLevel2Id: state.guessedEmotionLevel2Id,
                      selectedLevel3Id: state.guessedEmotionLevel3Id,
                      onSelectionChanged: notifier.setGuessedEmotion,
                    ),
                    const SizedBox(height: 28),

                    // 3. Now Emotion
                    Text(
                      AppLocalizations.of(context)!.reflectionCornerEmotionNow,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 8),
                    EmotionSelector(
                      rootEmotions: emotionTree,
                      selectedLevel1Id: state.currentEmotionLevel1Id,
                      selectedLevel2Id: state.currentEmotionLevel2Id,
                      selectedLevel3Id: state.currentEmotionLevel3Id,
                      onSelectionChanged: notifier.setCurrentEmotion,
                    ),
                    const SizedBox(height: 28),

                    // 4. Reflection Input
                    Text(
                      AppLocalizations.of(
                        context,
                      )!.reflectionCornerReflectionPrompt,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      key: const ValueKey('reflectionTextField'),
                      controller:
                          TextEditingController(text: state.reflectionText)
                            ..selection = TextSelection.collapsed(
                              offset: state.reflectionText.length,
                            ),
                      onChanged: notifier.setReflectionText,
                      maxLines: 5,
                      decoration: InputDecoration(
                        hintText: AppLocalizations.of(
                          context,
                        )!.reflectionCornerReflectionHint,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        filled: true,
                        fillColor: Theme.of(
                          context,
                        ).colorScheme.surfaceContainerHighest.withAlpha(50),
                      ),
                    ),
                    const SizedBox(height: 32),
                    SizedBox(
                      width: double.infinity,
                      child: FilledButton.icon(
                        icon: const Icon(Icons.check_circle),
                        onPressed: _canSubmit(state)
                            ? () => notifier.submitReflection()
                            : null,
                        label: Text(
                          AppLocalizations.of(
                            context,
                          )!.reflectionCornerSubmitReflection,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }

  bool _canSubmit(ReflectionCornerState state) {
    return state.guessedEmotionLevel1Id != null &&
        state.currentEmotionLevel1Id != null &&
        state.reflectionText.trim().isNotEmpty;
  }
}
