import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:personal_hub_app/ui/meditation/view_models/routine_creation_view_model.dart';
import 'package:personal_hub_app/ui/meditation/widgets/meditation_repetition_picker.dart';
import 'package:personal_hub_app/domain/entities/meditation/meditation_entry.dart';
import 'package:personal_hub_app/utils/providers.dart';

/// Screen for creating or editing a meditation routine.
///
/// Navigates back on save.
class RoutineCreationScreen extends ConsumerWidget {
  final String? editingRoutineId;

  const RoutineCreationScreen({super.key, this.editingRoutineId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // On edit: prefill with existing data (to be implemented)
    final model = ref.watch(routineCreationViewModelProvider.notifier);
    final state = ref.watch(routineCreationViewModelProvider);

    // Fetch available meditations
    final asyncMeds = ref.watch(meditationRepositoryProvider).watchAllEntries();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          editingRoutineId == null ? "Create Routine" : "Edit Routine",
        ),
      ),
      body: FutureBuilder<List<MeditationEntry>>(
        future: asyncMeds.first, // Get one list, not a stream
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          final availableMeditations = snapshot.data!;

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView(
              children: [
                TextField(
                  decoration: const InputDecoration(labelText: 'Routine Name'),
                  onChanged: model.setName,
                  controller: TextEditingController(text: state.name)
                    ..selection = TextSelection.collapsed(
                      offset: state.name.length,
                    ),
                ),
                const SizedBox(height: 16),
                TextField(
                  decoration: const InputDecoration(labelText: 'Description'),
                  onChanged: model.setDescription,
                  controller: TextEditingController(text: state.description)
                    ..selection = TextSelection.collapsed(
                      offset: state.description.length,
                    ),
                ),
                const SizedBox(height: 16),
                Text(
                  "Meditations in routine:",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                ...List.generate(state.meditations.length, (idx) {
                  final item = state.meditations[idx];
                  return Padding(
                    key: ValueKey('med_$idx'),
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Main content: Dropdown and (maybe) picker below
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              DropdownButtonFormField<MeditationEntry>(
                                value: item.meditation,
                                isExpanded: true,
                                hint: const Text("Select Meditation"),
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: "Meditation",
                                  isDense: true,
                                  contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                                ),
                                items: availableMeditations
                                    .map((entry) => DropdownMenuItem<MeditationEntry>(
                                          value: entry,
                                          child: Text(entry.title),
                                        ))
                                    .toList(),
                                onChanged: (selected) {
                                  model.setMeditationAt(idx, selected);
                                },
                              ),
                              if (item.meditation != null) ...[
                                const SizedBox(height: 8),
                                MeditationRepetitionPicker(
                                  meditation: item.meditation!,
                                  initialRepetitions: item.repetitions,
                                  onChanged: (value) {
                                    model.setRepetitionsAt(idx, value);
                                  },
                                ),
                              ],
                            ],
                          ),
                        ),
                        const SizedBox(width: 4),
                        // Remove button
                        IconButton(
                          icon: const Icon(Icons.delete_outline),
                          tooltip: "Remove from routine",
                          onPressed: () => model.removeMeditationAt(idx),
                        ),
                      ],
                    ),
                  );
                }),
                Align(
                  alignment: Alignment.centerLeft,
                  child: TextButton.icon(
                    onPressed: model.addMeditation,
                    icon: const Icon(Icons.add),
                    label: const Text("Add Meditation"),
                  ),
                ),
                const SizedBox(height: 16),
                if (state.error != null)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      state.error!,
                      style: const TextStyle(color: Colors.red),
                    ),
                  ),
                ElevatedButton(
                  onPressed: state.saving
                      ? null
                      : () async {
                          final success = await model.save();
                          if (success && context.mounted) {
                            Navigator.of(context).pop();
                          }
                        },
                  child: state.saving
                      ? const CircularProgressIndicator()
                      : const Text("Save Routine"),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
