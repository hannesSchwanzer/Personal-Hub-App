import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:personal_hub_app/domain/entities/meditation_entry.dart';
import 'package:personal_hub_app/ui/meditation/screens/meditation_overview_screen.dart';
import 'package:personal_hub_app/ui/meditation/utils/meditation_string_utils.dart';
import 'package:personal_hub_app/utils/providers.dart';

/// Displays a list of all meditation entries.
/// Fetches the meditations using a Riverpod StreamProvider connected to the MeditationRepository.
class MeditationIndexScreen extends ConsumerWidget {
  const MeditationIndexScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final meditationRepo = ref.watch(meditationRepositoryProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Meditations'),
      ),
      body: StreamBuilder<List<MeditationEntry>>(
        stream: meditationRepo.watchAllEntries(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          final entries = snapshot.data ?? [];
          if (entries.isEmpty) {
            return const Center(child: Text('No meditations found.'));
          }
          final sorted = [...entries]..sort((a, b) => a.title.compareTo(b.title));
          return ListView.separated(
            padding: const EdgeInsets.symmetric(vertical: 12),
            itemCount: sorted.length,
            separatorBuilder: (_, __) => const Divider(indent: 20, endIndent: 20, height: 1),
            itemBuilder: (context, index) {
              final entry = sorted[index];
              return _MeditationListTile(
                entry: entry,
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => MeditationOverviewScreen(entry: entry),
                    ),
                  );
                },
                onToggleFavorite: () async {
                  final updated = entry.copyWith(favorite: !entry.favorite);
                  await meditationRepo.updateEntry(updated);
                },
              );
            },
          );
        },
      ),
    );
  }
}

class _MeditationListTile extends StatelessWidget {
  final MeditationEntry entry;
  final VoidCallback onTap;
  final VoidCallback onToggleFavorite;

  const _MeditationListTile({
    required this.entry,
    required this.onTap,
    required this.onToggleFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.fromLTRB(20, 6, 18, 6),
      title: Row(
        children: [
          Expanded(
            child: Text(
              entry.title,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          IconButton(
            icon: entry.favorite
                ? Icon(Icons.star_rounded, color: Colors.amber[700])
                : Icon(Icons.star_border_rounded, color: Colors.grey[400]),
            tooltip: entry.favorite ? 'Remove from favorites' : 'Mark as favorite',
            onPressed: onToggleFavorite,
            padding: const EdgeInsets.only(left: 6),
            splashRadius: 20,
            constraints: BoxConstraints(),
          ),
        ],
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 3),
          _DescriptionPreview(entry.description),
          const SizedBox(height: 9),
          Wrap(
            spacing: 13,
            children: [
              _MeditationChip(
                icon: Icons.style,
                label: entry.type.displayName,
                color: Colors.indigo.shade50,
                iconColor: Colors.indigo.shade400,
              ),
              _MeditationChip(
                icon: Icons.flag,
                label: entry.level.displayName,
                color: Colors.orange.shade50,
                iconColor: Colors.orange.shade400,
              ),
              if (entry.chakraType != null)
                _MeditationChip(
                  icon: Icons.brightness_low_rounded,
                  label: entry.chakraType!.displayName,
                  color: Colors.pink.shade50,
                  iconColor: Colors.pink.shade300,
                ),
              for (final ct in entry.cognitiveTypes)
                _MeditationChip(
                  icon: Icons.psychology_alt_rounded,
                  label: ct.displayName,
                  color: Colors.teal.shade50,
                  iconColor: Colors.teal.shade400,
                ),
            ],
          ),
        ],
      ),
      onTap: onTap,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(11)),
      hoverColor: Theme.of(context).colorScheme.secondary.withOpacity(0.07),
    );
  }
}

/// Shows a truncated description, at most 2 lines or 100 characters.
class _DescriptionPreview extends StatelessWidget {
  final String description;
  static const maxChars = 100;

  const _DescriptionPreview(this.description);

  @override
  Widget build(BuildContext context) {
    String text = description;
    if (text.length > maxChars) {
      text = '${text.substring(0, maxChars - 3)}...';
    }
    return Text(
      text,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: Theme.of(context).textTheme.bodyMedium,
    );
  }
}

class _MeditationChip extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final Color iconColor;

  const _MeditationChip({
    required this.icon, 
    required this.label, 
    required this.color, 
    required this.iconColor
  });

  @override
  Widget build(BuildContext context) {
    return Chip(
      avatar: Icon(icon, size: 18, color: iconColor),
      label: Text(label),
      backgroundColor: color,
      labelStyle: Theme.of(context).textTheme.bodySmall,
      shape: StadiumBorder(),
    );
  }
}

