import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:personal_hub_app/domain/entities/journal_entry_entity.dart';
import 'package:personal_hub_app/domain/repositories/journal_entry_repository.dart';
import 'package:personal_hub_app/domain/repositories/journal_reflection_repository.dart';
import 'package:personal_hub_app/ui/right_in_the_feels/models/emotion_ui_model.dart';
import 'package:personal_hub_app/utils/providers.dart';

class ReflectionCornerState {
  final JournalEntryEntity? journalEntry; // entry to reflect on
  final String? guessedEmotionId; // what user thinks they felt then
  final String? currentEmotionId; // how they feel about it now
  final String reflectionText;
  final bool submitted;

  ReflectionCornerState({
    this.journalEntry,
    this.guessedEmotionId,
    this.currentEmotionId,
    this.reflectionText = '',
    this.submitted = false,
  });

  ReflectionCornerState copyWith({
    JournalEntryEntity? journalEntry,
    String? guessedEmotionId,
    String? currentEmotionId,
    String? reflectionText,
    bool? submitted,
  }) {
    return ReflectionCornerState(
      journalEntry: journalEntry ?? this.journalEntry,
      guessedEmotionId: guessedEmotionId ?? this.guessedEmotionId,
      currentEmotionId: currentEmotionId ?? this.currentEmotionId,
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
    state = state.copyWith(guessedEmotionId: level3?.id ?? level2?.id ?? level1?.id, submitted: false);
  }

  void setCurrentEmotion(EmotionUiModel? level1, EmotionUiModel? level2, EmotionUiModel? level3) {
    state = state.copyWith(currentEmotionId: level3?.id ?? level2?.id ?? level1?.id, submitted: false);
  }

  void setReflectionText(String text) {
    state = state.copyWith(reflectionText: text, submitted: false);
  }

  Future<void> submitReflection() async {
    final entry = state.journalEntry;
    if (entry == null) return;
    await _reflectionRepo.createReflection(
      entry: entry.entry,
      guessedEmotionLevel1: state.guessedEmotionId,
      currentEmotionLevel1: state.currentEmotionId,
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

