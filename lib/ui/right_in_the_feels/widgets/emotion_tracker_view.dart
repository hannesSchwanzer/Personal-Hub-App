import 'package:flutter/material.dart';
import 'package:personal_hub_app/data/database/app_database.dart';
import 'package:personal_hub_app/l10n/app_localizations.dart';
import 'package:personal_hub_app/ui/right_in_the_feels/models/emotion_tree.dart';
import 'package:personal_hub_app/ui/right_in_the_feels/models/emotion_ui_model.dart';
import 'package:personal_hub_app/ui/right_in_the_feels/widgets/emotion_selector.dart';
import 'package:uuid/uuid.dart';
import 'package:drift/drift.dart' hide Column;


/// View for tracking emotions with hierarchical selection, journaling, and body map.
class EmotionTrackerView extends StatefulWidget {
  const EmotionTrackerView({super.key});

  @override
  State<EmotionTrackerView> createState() => _EmotionTrackerViewState();
}

class _EmotionTrackerViewState extends State<EmotionTrackerView> {
  String? _selectedLevel1Id;
  String? _selectedLevel2Id;
  String? _selectedLevel3Id;
  final TextEditingController _journalController = TextEditingController();

  @override
  void dispose() {
    _journalController.dispose();
    super.dispose();
  }

  /// Handles when emotion selection changes in the reusable selector.
  void _onEmotionSelectionChanged(
    EmotionUiModel? level1, EmotionUiModel? level2, EmotionUiModel? level3,
  ) {
    setState(() {
      _selectedLevel1Id = level1?.id;
      _selectedLevel2Id = level2?.id;
      _selectedLevel3Id = level3?.id;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.emotionTrackerTitle),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column( crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Section 1: Emotion Selection
            _buildSectionHeader(AppLocalizations.of(context)!.emotionTrackerSectionFeeling, Icons.mood),
            const SizedBox(height: 12),
            _buildEmotionSelector(),
            const SizedBox(height: 32),

            // Section 2: Journal Entry
            _buildSectionHeader(AppLocalizations.of(context)!.emotionTrackerSectionJournal, Icons.edit_note),
            const SizedBox(height: 12),
            TextField(
              controller: _journalController,
              maxLines: 5,
              decoration: InputDecoration(
                hintText: AppLocalizations.of(context)!.emotionTrackerJournalHint,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                filled: true,
                fillColor: Theme.of(context)
                    .colorScheme
                    .surfaceContainerHighest
                    .withValues(alpha: 0.3),
              ),
            ),
            const SizedBox(height: 32),

            // Section 3: Body Map (Coming Soon)
            _buildSectionHeader(AppLocalizations.of(context)!.emotionTrackerSectionBodyMap, Icons.accessibility_new),
            const SizedBox(height: 12),
            Container(
              height: 200,
              decoration: BoxDecoration(
                color: Theme.of(context)
                    .colorScheme
                    .surfaceContainerHighest
                    .withValues(alpha: 0.3),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color:
                      Theme.of(context).colorScheme.outline.withValues(alpha: 0.3),
                ),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.draw_outlined,
                      size: 48,
                      color: Theme.of(context).colorScheme.outline,
                    ),
                    const SizedBox(height: 12),
                    Text(
                      AppLocalizations.of(context)!.emotionTrackerComingSoon,
                      style: TextStyle(
                        fontSize: 16,
                        color: Theme.of(context).colorScheme.outline,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      AppLocalizations.of(context)!.emotionTrackerDrawHint,
                      style: TextStyle(
                        fontSize: 12,
                        color: Theme.of(context)
                            .colorScheme
                            .outline
                            .withValues(alpha: 0.7),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 32),

            // Save Button
            SizedBox(
              width: double.infinity,
              child: FilledButton.icon(
                onPressed:
                    _selectedLevel1Id != null ? () => _saveEntry(context) : null,
                icon: const Icon(Icons.save),
                label: Text(AppLocalizations.of(context)!.emotionTrackerSaveEntry),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title, IconData icon) {
    return Row(
      children: [
        Icon(icon, size: 24),
        const SizedBox(width: 8),
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildEmotionSelector() {
    // Use the reusable EmotionSelector widget with business logic and callback wiring
    return EmotionSelector(
      rootEmotions: emotionTree,
      onSelectionChanged: _onEmotionSelectionChanged,
    );
  }

  void _saveEntry(BuildContext context) {
    final db = AppDatabase();
    final dao = db.journalDao;

    // Insert a new entry
    dao.insertEntry(
      JournalEntriesCompanion.insert(
        id: const Uuid().v4(),
        emotionLevel1: Value(_selectedLevel1Id),
        emotionLevel2: Value(_selectedLevel2Id),
        emotionLevel3: Value(_selectedLevel3Id),
        entry: _journalController.text,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      ),
    );

    // Watch entries
    dao.watchAll().listen((entries) {
      for (var e in entries) {
        print('${e.emotionLevel3} - ${e.entry}');
      }
    });
    // For now, just show a snackbar confirmation. TODO: Return to previous page and save
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(AppLocalizations.of(context)!.emotionTrackerEntrySaved),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}


