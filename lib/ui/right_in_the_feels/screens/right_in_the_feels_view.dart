import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:personal_hub_app/l10n/app_localizations.dart';
import 'package:personal_hub_app/ui/core/widgets/hub_feature_card.dart';
import 'package:personal_hub_app/ui/right_in_the_feels/screens/emotion_tracker_view.dart';
import 'package:personal_hub_app/ui/right_in_the_feels/screens/emotion_explorer_view.dart';
import 'package:personal_hub_app/ui/right_in_the_feels/screens/comms_check_view.dart';
import 'package:personal_hub_app/ui/right_in_the_feels/screens/emotions_regulator_view.dart';
import 'package:personal_hub_app/ui/right_in_the_feels/screens/reflection_corner_view.dart';
import 'package:personal_hub_app/ui/right_in_the_feels/screens/all_journal_entries_view.dart';
import 'package:personal_hub_app/utils/providers.dart';

/// Hub view for emotional wellbeing features.
class RightInTheFeelsView extends ConsumerStatefulWidget {
  const RightInTheFeelsView({super.key});

  @override
  ConsumerState<RightInTheFeelsView> createState() => _RightInTheFeelsViewState();
}

class _RightInTheFeelsViewState extends ConsumerState<RightInTheFeelsView> {
  @override
  Widget build(BuildContext context) {
    final settings = ref.watch(settingsNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.rightInTheFeels),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 16),
              HubFeatureCard(
                title: AppLocalizations.of(context)!.emotionTracker,
                description: AppLocalizations.of(context)!.emotionTrackerDesc,
                icon: Icons.track_changes,
                onTap: () => _navigateTo(context, const EmotionTrackerView()),
              ),
              const SizedBox(height: 16),
              HubFeatureCard(
                title: AppLocalizations.of(context)!.reflectionCorner,
                description: AppLocalizations.of(context)!.reflectionCornerDesc,
                icon: Icons.lightbulb_outline,
                onTap: () => _navigateTo(context, const ReflectionCornerView()),
              ),
              const SizedBox(height: 16),
              HubFeatureCard(
                title: AppLocalizations.of(context)!.commsCheck,
                description: AppLocalizations.of(context)!.commsCheckDesc,
                icon: Icons.chat_bubble_outline,
                onTap: () => _navigateTo(context, const CommsCheckView()),
              ),
              const SizedBox(height: 16),
              HubFeatureCard(
                title: AppLocalizations.of(context)!.emotionExplorer,
                description: AppLocalizations.of(context)!.emotionExplorerDesc,
                icon: Icons.explore,
                onTap: () => _navigateTo(context, const EmotionExplorerView()),
              ),
              const SizedBox(height: 16),
              HubFeatureCard(
                title: AppLocalizations.of(context)!.emotionsRegulator,
                description: AppLocalizations.of(context)!.emotionsRegulatorDesc,
                icon: Icons.tune,
                onTap: () => _navigateTo(context, const EmotionsRegulatorView()),
              ),
              if (settings.isDeveloperModeEnabled) ...[
                const SizedBox(height: 16),
                HubFeatureCard(
                  title: "View All Journal Entries",
                  description: "See a list of all your emotion journal entries.",
                  icon: Icons.library_books,
                  onTap: () => _navigateTo(context, const AllJournalEntriesView()),
                )
              ],
            ],
          ),
        ),
      ),
    );
  }

  void _navigateTo(BuildContext context, Widget page) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }
}

