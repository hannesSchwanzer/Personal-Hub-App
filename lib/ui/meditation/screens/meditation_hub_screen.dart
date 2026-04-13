import 'package:flutter/material.dart';
import 'package:personal_hub_app/ui/core/widgets/hub_feature_card.dart';
import 'package:personal_hub_app/ui/meditation/screens/mediation_index_screen.dart';
import 'package:personal_hub_app/ui/meditation/screens/meditation_routines_screen.dart';

/// MeditationHubScreen is the entry point for meditation features.
/// It allows navigation to meditation index, routines, and tracks.
class MeditationHubScreen extends StatelessWidget {
  const MeditationHubScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meditation Hub'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            HubFeatureCard(
              title: "Meditation Index",
              description: "Browse and manage all meditation entries.",
              icon: Icons.list,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const MeditationIndexScreen()),
              ),
            ),
            const SizedBox(height: 16),
            HubFeatureCard(
              title: "Meditation Routines",
              description: "View and organize meditation routines.",
              icon: Icons.view_list_rounded,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const MeditationRoutinesScreen()),
              ),
            ),
            const SizedBox(height: 16),
            HubFeatureCard(
              title: "Meditation Tracks",
              description: "Manage audio tracks for meditation.",
              icon: Icons.music_note,
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Meditation Tracks coming soon.')),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

