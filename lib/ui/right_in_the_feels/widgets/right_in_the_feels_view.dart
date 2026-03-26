import 'package:flutter/material.dart';
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
        title: const Text('Right in the Feels'),
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
                title: 'Emotion Tracker',
                description: 'Log and track your daily emotions',
                icon: Icons.track_changes,
                onTap: () => _navigateTo(context, const EmotionTrackerView()),
              ),
              const SizedBox(height: 16),
              HubFeatureCard(
                title: 'Emotion Explorer',
                description: 'Discover and understand your emotions',
                icon: Icons.explore,
                onTap: () => _navigateTo(context, const EmotionExplorerView()),
              ),
              const SizedBox(height: 16),
              HubFeatureCard(
                title: 'Comms Check',
                description: 'Check in with yourself and others',
                icon: Icons.chat_bubble_outline,
                onTap: () => _navigateTo(context, const CommsCheckView()),
              ),
              const SizedBox(height: 16),
              HubFeatureCard(
                title: 'Emotions Regulator',
                description: 'Tools to help regulate your emotions',
                icon: Icons.tune,
                onTap: () => _navigateTo(context, const EmotionsRegulatorView()),
              ),
              const SizedBox(height: 16),
              HubFeatureCard(
                title: 'Reflection Corner',
                description: 'Reflect on your emotional journey',
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

