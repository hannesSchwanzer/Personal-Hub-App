import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:personal_hub_app/domain/entities/journal_entry_entity.dart';
import 'package:personal_hub_app/utils/providers.dart';

/// Displays a list of all saved journal entries.
class AllJournalEntriesView extends ConsumerWidget {
  const AllJournalEntriesView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final journalRepo = ref.read(journalEntryRepositoryProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('All Journal Entries'),
      ),
      body: StreamBuilder<List<JournalEntryEntity>>(
        stream: journalRepo.watchAllEntries(),
        builder: (context, snapshot) {
          final entries = snapshot.data;
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (entries == null || entries.isEmpty) {
            return const Center(child: Text('No journal entries found.'));
          }
          return ListView.separated(
            itemCount: entries.length,
            separatorBuilder: (context, index) => const Divider(),
            itemBuilder: (context, index) {
              final entry = entries[index];
              return ListTile(
                title: Text(entry.entry),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (entry.emotionLevel1 != null)
                      Text('Primary emotion: ${entry.emotionLevel1}'),
                    if (entry.emotionLevel2 != null)
                      Text('Secondary emotion: ${entry.emotionLevel2}'),
                    if (entry.emotionLevel3 != null)
                      Text('Tertiary emotion: ${entry.emotionLevel3}'),
                    Text(
                      'Created: ${entry.createdAt.toLocal().toIso8601String().split("T").first}',
                      style: const TextStyle(fontSize: 12),
                    ),
                  ],
                ),
                isThreeLine: true,
                // Optionally show more info, add trailing actions, etc.
              );
            },
          );
        },
      ),
    );
  }
}

