import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:personal_hub_app/domain/entities/meditation/routine_entity.dart';
import 'package:personal_hub_app/ui/meditation/screens/routine_active_screen.dart';
import 'package:personal_hub_app/ui/meditation/screens/routine_creation_screen.dart';
import 'package:personal_hub_app/utils/providers.dart';

/// Displays all meditation routines.
/// Fetches the routines using a Riverpod provider connected to the RoutineService.
class MeditationRoutinesScreen extends ConsumerWidget {
  const MeditationRoutinesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final routineService = ref.watch(meditationRoutineServiceProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Meditation Routines')),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const RoutineCreationScreen()),
        ),
        tooltip: 'Create new routine',
        child: const Icon(Icons.add),
      ),
      body: StreamBuilder<List<RoutineEntity>>(
        stream: routineService.watchAllRoutines(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          final routines = snapshot.data ?? [];
          if (routines.isEmpty) {
            return const Center(child: Text('No routines found.'));
          }
          final sorted = [...routines]
            ..sort((a, b) => a.name.compareTo(b.name));
          return ListView.separated(
            padding: const EdgeInsets.symmetric(vertical: 12),
            itemCount: sorted.length,
            separatorBuilder: (_, _) =>
                const Divider(indent: 20, endIndent: 20, height: 1),
            itemBuilder: (context, index) {
              final routine = sorted[index];
              return _RoutineListTile(
                routine: routine,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) =>
                          RoutineActiveScreen(routine: routine),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}

/// List tile to show a routine's info and navigate to its overview.
class _RoutineListTile extends StatelessWidget {
  final RoutineEntity routine;
  final VoidCallback onTap;

  const _RoutineListTile({required this.routine, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.fromLTRB(20, 6, 18, 6),
      title: Text(
        routine.name,
        style: Theme.of(
          context,
        ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (routine.description != null &&
              routine.description!.trim().isNotEmpty) ...[
            _DescriptionPreview(routine.description!),
            const SizedBox(height: 6),
          ],
          Text(
            '${routine.items.length} meditation${routine.items.length != 1 ? 's' : ''}',
            style: Theme.of(context).textTheme.bodySmall,
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
