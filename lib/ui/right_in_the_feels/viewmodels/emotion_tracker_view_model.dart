import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:personal_hub_app/domain/entities/journal_entry_entity.dart';
import 'package:personal_hub_app/domain/repositories/journal_entry_repository.dart';
import 'package:personal_hub_app/ui/right_in_the_feels/models/emotion_ui_model.dart';
import 'package:uuid/uuid.dart';
import 'package:personal_hub_app/utils/providers.dart';

/// Holds the state for the Emotion Tracker feature.
class EmotionTrackerState {
  final String? selectedLevel1Id;
  final String? selectedLevel2Id;
  final String? selectedLevel3Id;
  final String journalText;
  final bool entrySaved;

  EmotionTrackerState({
    this.selectedLevel1Id,
    this.selectedLevel2Id,
    this.selectedLevel3Id,
    this.journalText = '',
    this.entrySaved = false,
  });

  EmotionTrackerState copyWith({
    String? selectedLevel1Id,
    String? selectedLevel2Id,
    String? selectedLevel3Id,
    String? journalText,
    bool? entrySaved,
  }) {
    return EmotionTrackerState(
      selectedLevel1Id: selectedLevel1Id ?? this.selectedLevel1Id,
      selectedLevel2Id: selectedLevel2Id ?? this.selectedLevel2Id,
      selectedLevel3Id: selectedLevel3Id ?? this.selectedLevel3Id,
      journalText: journalText ?? this.journalText,
      entrySaved: entrySaved ?? false,
    );
  }
}

class EmotionTrackerViewModel extends Notifier<EmotionTrackerState> {
  late final JournalEntryRepository _repo;

  @override
  EmotionTrackerState build() {
    _repo = ref.read(journalEntryRepositoryProvider);
    return EmotionTrackerState();
  }

  /// Handles emotion selection changes.
  void updateEmotionSelection(
    EmotionUiModel? level1,
    EmotionUiModel? level2,
    EmotionUiModel? level3,
  ) {
    state = state.copyWith(
      selectedLevel1Id: level1?.id,
      selectedLevel2Id: level2?.id,
      selectedLevel3Id: level3?.id,
      entrySaved: false,
    );
  }

  /// Updates the journal entry text.
  void updateJournalText(String text) {
    state = state.copyWith(
      journalText: text,
      entrySaved: false,
    );
  }

  /// Saves the entry to the repository.
  Future<void> saveEntry() async {
    if (state.selectedLevel1Id == null) return;

    await _repo.insertEntry(
      JournalEntryEntity(
        id: const Uuid().v4(),
        emotionLevel1: state.selectedLevel1Id,
        emotionLevel2: state.selectedLevel2Id,
        emotionLevel3: state.selectedLevel3Id,
        entry: state.journalText,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      ),
    );

    // Notify UI that entry is saved
    state = state.copyWith(
      entrySaved: true,
      journalText: '',
      selectedLevel1Id: null,
      selectedLevel2Id: null,
      selectedLevel3Id: null,
    );
  }
}

/// Provides the EmotionTrackerViewModel as a NotifierProvider (Riverpod 3.x).
final emotionTrackerViewModelProvider =
    NotifierProvider<EmotionTrackerViewModel, EmotionTrackerState>(
  EmotionTrackerViewModel.new,
);
