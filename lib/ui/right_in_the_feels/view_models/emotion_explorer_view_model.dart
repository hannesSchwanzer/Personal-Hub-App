import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:personal_hub_app/ui/right_in_the_feels/models/emotion_ui_model.dart';
import 'package:personal_hub_app/ui/right_in_the_feels/models/emotion_tree.dart';
import 'package:personal_hub_app/utils/providers.dart';
import 'package:personal_hub_app/domain/entities/emotion_explorer_map_entity.dart';
import 'package:personal_hub_app/domain/repositories/emotion_explorer_map_repository.dart';

/// StreamProvider that emits the latest EmotionExplorerMapEntity from the DB.
final emotionExplorerMapStreamProvider = StreamProvider<EmotionExplorerMapEntity?>((ref) {
  final repository = ref.watch(emotionExplorerMapRepositoryProvider);
  return repository.watchMap();
});

/// Holds state for the Emotion Explorer feature.
/// - selectedLevel1Id: Which first-level emotion is selected ("Happy", "Angry", etc).
/// - journalTexts: Map of third-level emotion id to user entry.
class EmotionExplorerState {
  final String? selectedLevel1Id;
  final Map<String, String> journalTexts;

  EmotionExplorerState({
    this.selectedLevel1Id,
    Map<String, String>? journalTexts,
  }) : journalTexts = journalTexts ?? {};

  EmotionExplorerState copyWith({
    String? selectedLevel1Id,
    Map<String, String>? journalTexts,
  }) =>
      EmotionExplorerState(
        selectedLevel1Id: selectedLevel1Id ?? this.selectedLevel1Id,
        journalTexts: journalTexts ?? this.journalTexts,
      );
}

class EmotionExplorerViewModel extends Notifier<EmotionExplorerState> {
  late final EmotionExplorerMapRepository _repository;

  @override
  EmotionExplorerState build() {
    _repository = ref.read(emotionExplorerMapRepositoryProvider);

    // Listen for DB updates via the StreamProvider and update the state reactively
    ref.listen<AsyncValue<EmotionExplorerMapEntity?>>(
      emotionExplorerMapStreamProvider,
      (previous, next) {
        final entity = next.value;
        if (entity != null) {
          state = state.copyWith(journalTexts: entity.map);
        }
      },
    );

    return EmotionExplorerState(
      selectedLevel1Id: emotionTree.isNotEmpty ? emotionTree.first.id : null,
    );
  }

  void selectLevel1(EmotionUiModel emotion) {
    state = state.copyWith(selectedLevel1Id: emotion.id);
  }

  void updateJournalText(String thirdLevelId, String text) {
    final newTexts = Map<String, String>.from(state.journalTexts);
    newTexts[thirdLevelId] = text;
    state = state.copyWith(journalTexts: newTexts);
    _repository.upsertMap(EmotionExplorerMapEntity(newTexts));
  }
}

final emotionExplorerViewModelProvider =
    NotifierProvider<EmotionExplorerViewModel, EmotionExplorerState>(
  EmotionExplorerViewModel.new,
);

