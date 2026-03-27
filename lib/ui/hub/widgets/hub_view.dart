import 'package:flutter/material.dart';
import 'package:personal_hub_app/l10n/app_localizations.dart';
import 'package:personal_hub_app/ui/cooking/widgets/cooking_view.dart';
import 'package:personal_hub_app/ui/gym_tracker/widgets/gym_view.dart';
import 'package:personal_hub_app/ui/meditation/widgets/meditation_view.dart';
import 'package:personal_hub_app/ui/right_in_the_feels/widgets/right_in_the_feels_view.dart';
import 'package:personal_hub_app/ui/core/widgets/hub_feature_card.dart';
import 'package:personal_hub_app/ui/settings/widgets/settings_view.dart';

/// The main hub screen that links to all features in the app.
class HubView extends StatelessWidget {
  const HubView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.personalHub),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            tooltip: AppLocalizations.of(context)!.settings,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SettingsView(),
                ),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Remove demo helloWorld text unless you want it.
            // Text(AppLocalizations.of(context)!.helloWorld),
            // const SizedBox(height: 16),
            HubFeatureCard(
              title: AppLocalizations.of(context)!.hubFeatureGymTracking,
              description: AppLocalizations.of(context)!.hubFeatureGymTrackingDesc,
              icon: Icons.fitness_center,
              onTap: () => _navigateTo(context, const GymView()),
            ),
            const SizedBox(height: 16),
            HubFeatureCard(
              title: AppLocalizations.of(context)!.hubFeatureMeditation,
              description: AppLocalizations.of(context)!.hubFeatureMeditationDesc,
              icon: Icons.self_improvement,
              onTap: () => _navigateTo(context, const MeditationView()),
            ),
            const SizedBox(height: 16),
            HubFeatureCard(
              title: AppLocalizations.of(context)!.hubFeatureFeels,
              description: AppLocalizations.of(context)!.hubFeatureFeelsDesc,
              icon: Icons.book,
              onTap: () => _navigateTo(context, const RightInTheFeelsView()),
            ),
            const SizedBox(height: 16),
            HubFeatureCard(
              title: AppLocalizations.of(context)!.hubFeatureCooking,
              description: AppLocalizations.of(context)!.hubFeatureCookingDesc,
              icon: Icons.restaurant,
              onTap: () => _navigateTo(context, const CookingView()),
            ),
          ],
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



