import 'package:flutter/material.dart';
import 'package:personal_hub_app/l10n/app_localizations.dart';
import 'package:personal_hub_app/ui/core/widgets/hub_feature_card.dart';
import 'package:personal_hub_app/ui/right_in_the_feels/widgets/emotion_tracker_view.dart';
import 'package:personal_hub_app/ui/right_in_the_feels/widgets/emotion_explorer_view.dart';
import 'package:personal_hub_app/ui/right_in_the_feels/widgets/comms_check_view.dart';
import 'package:personal_hub_app/ui/right_in_the_feels/widgets/emotions_regulator_view.dart';
import 'package:personal_hub_app/ui/right_in_the_feels/widgets/reflection_corner_view.dart';

/// Hub view for emotional wellbeing features.
class RightInTheFeelsView extends StatelessWidget {
  const RightInTheFeelsView({super.key});

  @override
  Widget build(BuildContext context) {
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
                title: AppLocalizations.of(context)!.emotionExplorer,
                description: AppLocalizations.of(context)!.emotionExplorerDesc,
                icon: Icons.explore,
                onTap: () => _navigateTo(context, const EmotionExplorerView()),
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
                title: AppLocalizations.of(context)!.emotionsRegulator,
                description: AppLocalizations.of(context)!.emotionsRegulatorDesc,
                icon: Icons.tune,
                onTap: () => _navigateTo(context, const EmotionsRegulatorView()),
              ),
              const SizedBox(height: 16),
              HubFeatureCard(
                title: AppLocalizations.of(context)!.reflectionCorner,
                description: AppLocalizations.of(context)!.reflectionCornerDesc,
                icon: Icons.lightbulb_outline,
                onTap: () => _navigateTo(context, const ReflectionCornerView()),
              ),
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

