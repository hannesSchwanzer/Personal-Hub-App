import 'package:flutter/material.dart';
import 'package:personal_hub_app/data/database/app_database.dart';
import 'package:provider/provider.dart';

/// Displays a list of all saved journal entries.
class AllJournalEntriesView extends StatelessWidget {
  const AllJournalEntriesView({super.key});

  @override
  Widget build(BuildContext context) {
    final journalDao = AppDatabase().journalDao;

    return Scaffold(
      appBar: AppBar(
        title: const Text('All Journal Entries'),
      ),
      body: StreamBuilder<List<JournalEntry>>(
        stream: journalDao.watchAll(),
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

