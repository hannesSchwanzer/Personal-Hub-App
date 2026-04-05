import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:personal_hub_app/domain/entities/journal_entry_entity.dart';
import 'package:personal_hub_app/utils/providers.dart';
import 'journal_entry_detail_view.dart';

/// Displays a list of all saved journal entries.
class AllJournalEntriesView extends ConsumerWidget {
  const AllJournalEntriesView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final journalRepo = ref.read(journalEntryRepositoryProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('All Journal Entries')),
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
              final entryDate = entry.createdAt.toLocal().toIso8601String().split("T").first;
              const maxPreviewChars = 70;
              String previewText = entry.entry;
              if (previewText.length > maxPreviewChars) {
                previewText = '${previewText.substring(0, maxPreviewChars)}...';
              }
              return ListTile(
                title: Text(entryDate),
                subtitle: Text(previewText),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => JournalEntryDetailView(entry: entry),
                    ),
                  );
                },
                trailing: IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: () async {
                    final shouldDelete = await showDialog<bool>(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('Delete Entry'),
                        content: const Text('Are you sure you want to delete this entry?'),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.of(context).pop(false),
                            child: const Text('Cancel'),
                          ),
                          TextButton(
                            onPressed: () => Navigator.of(context).pop(true),
                            child: const Text('Delete', style: TextStyle(color: Colors.red)),
                          ),
                        ],
                      ),
                    );
                    if (shouldDelete == true) {
                      await journalRepo.deleteEntry(entry.id);
                    }
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
