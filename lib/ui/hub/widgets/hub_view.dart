import 'package:flutter/material.dart';
import 'package:personal_hub_app/ui/gym_tracker/widgets/gym_view.dart';
import 'package:personal_hub_app/ui/meditation/widgets/meditation_view.dart';
import 'package:personal_hub_app/ui/right_in_the_feels/widgets/journal_view.dart';

/// The main hub screen that links to all features in the app.
class HubView extends StatelessWidget {
  const HubView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Personal Hub'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 16),
            _HubFeatureCard(
              title: 'Gym Tracking',
              description: 'Track your workouts and progress',
              icon: Icons.fitness_center,
              onTap: () => _navigateTo(context, const GymView()),
            ),
            const SizedBox(height: 16),
            _HubFeatureCard(
              title: 'Meditation',
              description: 'Practice mindfulness and relaxation',
              icon: Icons.self_improvement,
              onTap: () => _navigateTo(context, const MeditationView()),
            ),
            const SizedBox(height: 16),
            _HubFeatureCard(
              title: 'Journal',
              description: 'Write and reflect on your thoughts',
              icon: Icons.book,
              onTap: () => _navigateTo(context, const JournalView()),
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

/// A card widget representing a feature in the hub.
class _HubFeatureCard extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;
  final VoidCallback onTap;

  const _HubFeatureCard({
    required this.title,
    required this.description,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: [
              Icon(
                icon,
                size: 48,
                color: Theme.of(context).colorScheme.primary,
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      description,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Theme.of(context).colorScheme.onSurfaceVariant,
                          ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.chevron_right,
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

