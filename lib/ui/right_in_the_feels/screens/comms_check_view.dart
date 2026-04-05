import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:personal_hub_app/l10n/app_localizations.dart';
import 'package:personal_hub_app/ui/right_in_the_feels/models/emotion_tree.dart';
import 'package:personal_hub_app/ui/right_in_the_feels/widgets/emotion_selector.dart';
import 'package:personal_hub_app/ui/right_in_the_feels/view_models/comms_check_view_model.dart';

/// Implements the multi-step Comms Check feature as a paged form.
class CommsCheckView extends ConsumerWidget {
  const CommsCheckView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vm = ref.watch(commsCheckViewModelProvider);
    final notifier = ref.read(commsCheckViewModelProvider.notifier);

    Widget currentPage;
    // Each page widget
    switch (vm.page) {
      case 0:
        currentPage = _StepPage(
          title: AppLocalizations.of(context)!.commsCheckStepWho,
          input: _StyledTextField(
            key: const ValueKey('targetInfosTextField'),
            controller: TextEditingController(text: vm.targetInfos)
              ..selection = TextSelection.collapsed(offset: vm.targetInfos.length),
            onChanged: notifier.setTargetInfos,
            hintText: AppLocalizations.of(context)!.commsCheckHintWho,
            maxLines: 5,
          ),
          onNext: vm.targetInfos.trim().isNotEmpty ? notifier.nextPage : null,
        );
        break;
      case 1:
        currentPage = _StepPage(
          title: AppLocalizations.of(context)!.commsCheckStepWhatToTell,
          input: _StyledTextField(
            key: const ValueKey('messageTextField'),
            controller: TextEditingController(text: vm.message)
              ..selection = TextSelection.collapsed(offset: vm.message.length),
            onChanged: notifier.setMessage,
            hintText: AppLocalizations.of(context)!.commsCheckHintMessage,
            maxLines: 5,
          ),
          onNext: vm.message.trim().isNotEmpty ? notifier.nextPage : null,
          onBack: notifier.prevPage,
        );
        break;
      case 2:
        currentPage = _StepPage(
          title: AppLocalizations.of(context)!.commsCheckStepFeeling,
          input: EmotionSelector(
            rootEmotions: emotionTree,
            onSelectionChanged: (emo1, emo2, emo3) =>
                notifier.setFeelings(level1Id: emo1?.id, level2Id: emo2?.id, level3Id: emo3?.id),
            selectedLevel1Id: vm.feelingLevel1Id,
            selectedLevel2Id: vm.feelingLevel2Id,
            selectedLevel3Id: vm.feelingLevel3Id,
          ),
          onNext: (vm.feelingLevel1Id != null || vm.feelingLevel2Id != null || vm.feelingLevel3Id != null)
              ? notifier.nextPage
              : null,
          onBack: notifier.prevPage,
        );
        break;
      case 3:
        currentPage = _StepPage(
          title: AppLocalizations.of(context)!.commsCheckStepExpectedReaction,
          input: _StyledTextField(
            key: const ValueKey('expectedReactionTextField'),
            controller: TextEditingController(text: vm.expectedReaction)
              ..selection = TextSelection.collapsed(offset: vm.expectedReaction.length),
            onChanged: notifier.setExpectedReaction,
            hintText: AppLocalizations.of(context)!.commsCheckHintExpectedReaction,
            maxLines: 5,
          ),
          onNext: vm.expectedReaction.trim().isNotEmpty
              ? notifier.nextPage
              : null,
          onBack: notifier.prevPage,
        );
        break;
      case 4:
        currentPage = _StepPage(
          title: AppLocalizations.of(context)!.commsCheckStepWantedReaction,
          input: _StyledTextField(
            key: const ValueKey('wantedReactionTextField'),
            controller: TextEditingController(text: vm.wantedReaction)
              ..selection = TextSelection.collapsed(offset: vm.wantedReaction.length),
            onChanged: notifier.setWantedReaction,
            hintText: AppLocalizations.of(context)!.commsCheckHintWantedReaction,
            maxLines: 5,
          ),
          onNext: vm.wantedReaction.trim().isNotEmpty
              ? notifier.nextPage
              : null,
          onBack: notifier.prevPage,
        );
        break;
      case 5:
        currentPage = _StepPage(
          title: AppLocalizations.of(context)!.commsCheckStepResponseAfterReaction,
          input: _StyledTextField(
            key: const ValueKey('responseAfterReactionTextField'),
            controller: TextEditingController(text: vm.responseAfterReaction)
              ..selection = TextSelection.collapsed(offset: vm.responseAfterReaction.length),
            onChanged: notifier.setResponseAfterReaction,
            hintText: AppLocalizations.of(context)!.commsCheckHintResponseAfterReaction,
            maxLines: 5,
          ),
          onNext: vm.responseAfterReaction.trim().isNotEmpty
              ? notifier.nextPage
              : null,
          onBack: notifier.prevPage,
        );
        break;
      case 6:
        currentPage = _StepPage(
          title: AppLocalizations.of(context)!.commsCheckStepReflection,
          input: _StyledTextField(
            key: const ValueKey('reflectionTextField'),
            controller: TextEditingController(text: vm.reflection)
              ..selection = TextSelection.collapsed(offset: vm.reflection.length),
            onChanged: notifier.setReflection,
            hintText: AppLocalizations.of(context)!.commsCheckHintReflection,
            maxLines: 5,
          ),
          onNext: vm.reflection.trim().isNotEmpty
              ? () async {
                  await notifier.save();
                  if (context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(AppLocalizations.of(context)!.commsCheckSaved),
                        behavior: SnackBarBehavior.floating,
                      ),
                    );
                  }
                  notifier.reset();
                  if (context.mounted) Navigator.of(context).pop();
                }
              : null,
          nextLabel: AppLocalizations.of(context)!.commsCheckSubmit,
          onBack: notifier.prevPage,
        );
        break;
      default:
        currentPage = const Center(
          child: Text("Unexpected error: page out of range"),
        );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.commsCheck),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: currentPage,
          ),
        ),
      ),
    );
  }
}

/// Widget for step/page layout.
class _StepPage extends StatelessWidget {
  final String title;
  final Widget input;
  final VoidCallback? onNext;
  final VoidCallback? onBack;
  final String nextLabel;

  const _StepPage({
    required this.title,
    required this.input,
    this.onNext,
    this.onBack,
    this.nextLabel = "Next",
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(
            context,
          ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 30),
        input,
        const Spacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (onBack != null)
              OutlinedButton(onPressed: onBack, child: Text(AppLocalizations.of(context)!.back)),
            const Spacer(),
            FilledButton(onPressed: onNext, child: Text(nextLabel)),
          ],
        ),
        const SizedBox(height: 18),
      ],
    );
  }
}

/// Reusable styled text field widget for consistent appearance across form steps.
class _StyledTextField extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String> onChanged;
  final String hintText;
  final int maxLines;

  const _StyledTextField({
    required Key key,
    required this.controller,
    required this.onChanged,
    required this.hintText,
    this.maxLines = 5,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      key: key,
      controller: controller,
      onChanged: onChanged,
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        filled: true,
        fillColor: Theme.of(context).colorScheme.surfaceContainerHighest.withAlpha(50),
      ),
    );
  }
}

