import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:personal_hub_app/domain/entities/body_map_drawing.dart';
import 'package:personal_hub_app/domain/repositories/journal_entry_repository.dart';
import 'package:personal_hub_app/ui/right_in_the_feels/models/emotion_ui_model.dart';
import 'package:personal_hub_app/utils/providers.dart';

/// Holds the state for the Emotion Tracker feature.
/// Stores the entire BodyMapPainting domain model.
class EmotionTrackerState {
  final String? selectedLevel1Id;
  final String? selectedLevel2Id;
  final String? selectedLevel3Id;
  final String journalText;
  final bool entrySaved;
  final BodyMapDrawing bodyMapDrawing;

  EmotionTrackerState({
    this.selectedLevel1Id,
    this.selectedLevel2Id,
    this.selectedLevel3Id,
    this.journalText = '',
    this.entrySaved = false,
    BodyMapDrawing? bodyMapDrawing,
  }) : bodyMapDrawing = bodyMapDrawing ?? BodyMapDrawing(strokes: []);

  EmotionTrackerState copyWith({
    String? selectedLevel1Id,
    String? selectedLevel2Id,
    String? selectedLevel3Id,
    String? journalText,
    bool? entrySaved,
    BodyMapDrawing? bodyMapDrawing,
  }) {
    return EmotionTrackerState(
      selectedLevel1Id: selectedLevel1Id ?? this.selectedLevel1Id,
      selectedLevel2Id: selectedLevel2Id ?? this.selectedLevel2Id,
      selectedLevel3Id: selectedLevel3Id ?? this.selectedLevel3Id,
      journalText: journalText ?? this.journalText,
      entrySaved: entrySaved ?? this.entrySaved,
      bodyMapDrawing: bodyMapDrawing ?? this.bodyMapDrawing,
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

  /// Replaces the BodyMapPainting in state (used after drawing).
  void updateBodyMap(BodyMapDrawing drawing) {
    state = state.copyWith(
      bodyMapDrawing: drawing,
      entrySaved: false,
    );
  }

  void clearEntry() {
    state = EmotionTrackerState();
  }

  /// Saves the entry to the repository.
  Future<void> saveEntry() async {
    if (state.selectedLevel1Id == null) return;

    await _repo.createEntry(
      entry: state.journalText,
      emotionLevel1: state.selectedLevel1Id,
      emotionLevel2: state.selectedLevel2Id,
      emotionLevel3: state.selectedLevel3Id,
      bodyMapDrawing: state.bodyMapDrawing,
    );

    state = EmotionTrackerState(entrySaved: true);
  }
}

final emotionTrackerViewModelProvider =
    NotifierProvider<EmotionTrackerViewModel, EmotionTrackerState>(
  EmotionTrackerViewModel.new,
);
