import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:personal_hub_app/domain/entities/journal_entry_entity.dart';
import 'package:personal_hub_app/domain/entities/journal_reflection.dart';
import 'package:personal_hub_app/ui/right_in_the_feels/widgets/body_map_viewer.dart';
import 'package:personal_hub_app/utils/providers.dart';

/// Detail screen for a single journal entry, showing all its info and all reflections.
class JournalEntryDetailView extends ConsumerWidget {
  final JournalEntryEntity entry;

  const JournalEntryDetailView({super.key, required this.entry});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final journalReflectionRepo = ref.read(journalReflectionRepositoryProvider);
    print(entry);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Entry Details'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text(
            'Date: ${entry.createdAt.toLocal().toIso8601String().split("T").first}',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(entry.entry, style: const TextStyle(fontSize: 16)),
          const Divider(height: 32),

          if (entry.emotionLevel1 != null)
            Text('Primary emotion: ${entry.emotionLevel1}'),
          if (entry.emotionLevel2 != null)
            Text('Secondary emotion: ${entry.emotionLevel2}'),
          if (entry.emotionLevel3 != null)
            Text('Tertiary emotion: ${entry.emotionLevel3}'),

          if (entry.bodyMapDrawing != null) ...[
            const SizedBox(height: 16),
            SizedBox(
              height: 200,
              child: BodyMapViewer(
                strokes: entry.bodyMapDrawing!.strokes,
              ),
            ),
          ],

          const Divider(height: 40),
          Text(
            'Reflections on this entry:',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          StreamBuilder<List<JournalReflectionEntity>>(
            stream: journalReflectionRepo.watchReflectionsByJournalEntryId(entry.id),
            builder: (context, snapshot) {
              final reflections = snapshot.data ?? [];
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              if (reflections.isEmpty) {
                return const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: Text("No reflections for this entry."),
                );
              }
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Text('Total: ${reflections.length}'),
                  ),
                  ...reflections.map((reflection) => Card(
                    margin: const EdgeInsets.symmetric(vertical: 6),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Reflection date: ${reflection.createdAt.toLocal().toIso8601String().split("T").first}",
                            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                          ),
                          const SizedBox(height: 4),
                          Text(reflection.reflection),
                          if (reflection.guessedEmotionLevel1 != null)
                            Text("Guessed primary emotion: ${reflection.guessedEmotionLevel1}"),
                          if (reflection.guessedEmotionLevel2 != null)
                            Text("Guessed secondary emotion: ${reflection.guessedEmotionLevel2}"),
                          if (reflection.guessedEmotionLevel3 != null)
                            Text("Guessed tertiary emotion: ${reflection.guessedEmotionLevel3}"),
                          if (reflection.currentEmotionLevel1 != null)
                            Text("Current primary emotion: ${reflection.currentEmotionLevel1}"),
                          if (reflection.currentEmotionLevel2 != null)
                            Text("Current secondary emotion: ${reflection.currentEmotionLevel2}"),
                          if (reflection.currentEmotionLevel3 != null)
                            Text("Current tertiary emotion: ${reflection.currentEmotionLevel3}"),
                        ],
                      ),
                    ),
                  )),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}

