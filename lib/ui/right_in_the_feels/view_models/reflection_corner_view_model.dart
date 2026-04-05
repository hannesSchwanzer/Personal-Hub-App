import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:personal_hub_app/domain/entities/journal_entry_entity.dart';
import 'package:personal_hub_app/domain/repositories/journal_entry_repository.dart';
import 'package:personal_hub_app/domain/repositories/journal_reflection_repository.dart';
import 'package:personal_hub_app/ui/right_in_the_feels/models/emotion_ui_model.dart';
import 'package:personal_hub_app/utils/providers.dart';

class ReflectionCornerState {
  final JournalEntryEntity? journalEntry; // entry to reflect on
  final String? guessedEmotionLevel1Id;
  final String? guessedEmotionLevel2Id;
  final String? guessedEmotionLevel3Id;
  final String? currentEmotionLevel1Id;
  final String? currentEmotionLevel2Id;
  final String? currentEmotionLevel3Id;
  final String reflectionText;
  final bool submitted;

  ReflectionCornerState({
    this.journalEntry,
    this.guessedEmotionLevel1Id,
    this.guessedEmotionLevel2Id,
    this.guessedEmotionLevel3Id,
    this.currentEmotionLevel1Id,
    this.currentEmotionLevel2Id,
    this.currentEmotionLevel3Id,
    this.reflectionText = '',
    this.submitted = false,
  });

  ReflectionCornerState copyWith({
    JournalEntryEntity? journalEntry,
    String? guessedEmotionLevel1Id,
    String? guessedEmotionLevel2Id,
    String? guessedEmotionLevel3Id,
    String? currentEmotionLevel1Id,
    String? currentEmotionLevel2Id,
    String? currentEmotionLevel3Id,
    String? reflectionText,
    bool? submitted,
  }) {
    return ReflectionCornerState(
      journalEntry: journalEntry ?? this.journalEntry,
      guessedEmotionLevel1Id: guessedEmotionLevel1Id ?? this.guessedEmotionLevel1Id,
      guessedEmotionLevel2Id: guessedEmotionLevel2Id ?? this.guessedEmotionLevel2Id,
      guessedEmotionLevel3Id: guessedEmotionLevel3Id ?? this.guessedEmotionLevel3Id,
      currentEmotionLevel1Id: currentEmotionLevel1Id ?? this.currentEmotionLevel1Id,
      currentEmotionLevel2Id: currentEmotionLevel2Id ?? this.currentEmotionLevel2Id,
      currentEmotionLevel3Id: currentEmotionLevel3Id ?? this.currentEmotionLevel3Id,
      reflectionText: reflectionText ?? this.reflectionText,
      submitted: submitted ?? this.submitted,
    );
  }
}

class ReflectionCornerViewModel extends Notifier<ReflectionCornerState> {
  late final JournalEntryRepository _journalRepo;
  late final JournalReflectionRepository _reflectionRepo;

  @override
  ReflectionCornerState build() {
    _journalRepo = ref.read(journalEntryRepositoryProvider);
    _reflectionRepo = ref.read(journalReflectionRepositoryProvider);
    _loadRandomEntry();
    return ReflectionCornerState();
  }

  Future<void> _loadRandomEntry() async {
    final entries = await _journalRepo.getAllEntries();
    if (entries.isNotEmpty) {
      entries.shuffle();
      state = ReflectionCornerState(journalEntry: entries.first);
    } else {
      state = ReflectionCornerState();
    }
  }

  /// Checks whether the current entry exists, or whether new entries have appeared if none existed.
  /// Reloads a random entry if anything has changed.
  Future<void> checkEntriesAndReloadIfChanged() async {
    final entries = await _journalRepo.getAllEntries();
    // 1. If previously no entry, but now there are some
    if (state.journalEntry == null && entries.isNotEmpty) {
      await _loadRandomEntry();
      return;
    }
    // 2. If an entry was loaded, check it still exists
    if (state.journalEntry != null && entries.every((e) => e.id != state.journalEntry!.id)) {
      await _loadRandomEntry();
    }
  }

  void setGuessedEmotion(EmotionUiModel? level1, EmotionUiModel? level2, EmotionUiModel? level3) {
    state = state.copyWith(
      guessedEmotionLevel1Id: level1?.id,
      guessedEmotionLevel2Id: level2?.id,
      guessedEmotionLevel3Id: level3?.id,
      submitted: false,
    );
  }

  void setCurrentEmotion(EmotionUiModel? level1, EmotionUiModel? level2, EmotionUiModel? level3) {
    state = state.copyWith(
      currentEmotionLevel1Id: level1?.id,
      currentEmotionLevel2Id: level2?.id,
      currentEmotionLevel3Id: level3?.id,
      submitted: false,
    );
  }

  void setReflectionText(String text) {
    state = state.copyWith(reflectionText: text, submitted: false);
  }

  Future<void> submitReflection() async {
    final entry = state.journalEntry;
    if (entry == null) return;
    await _reflectionRepo.createReflection(
      entry: entry.entry,
      guessedEmotionLevel1: state.guessedEmotionLevel1Id,
      guessedEmotionLevel2: state.guessedEmotionLevel2Id,
      guessedEmotionLevel3: state.guessedEmotionLevel3Id,
      currentEmotionLevel1: state.currentEmotionLevel1Id,
      currentEmotionLevel2: state.currentEmotionLevel2Id,
      currentEmotionLevel3: state.currentEmotionLevel3Id,
      reflection: state.reflectionText,
      journalEntryId: entry.id,
    );
    state = ReflectionCornerState(submitted: true);
    await _loadRandomEntry();
  }
}

final reflectionCornerViewModelProvider =
    NotifierProvider<ReflectionCornerViewModel, ReflectionCornerState>(
  ReflectionCornerViewModel.new,
);

