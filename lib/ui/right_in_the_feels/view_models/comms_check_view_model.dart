import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:personal_hub_app/domain/repositories/comms_check_entry_repository.dart';
import 'package:personal_hub_app/utils/providers.dart';

class CommsCheckState {
  final int page;
  final String targetInfos;
  final String message;
  final String? feelingLevel1Id;
  final String? feelingLevel2Id;
  final String? feelingLevel3Id;
  final String expectedReaction;
  final String wantedReaction;
  final String responseAfterReaction;
  final String reflection;

  CommsCheckState({
    this.page = 0,
    this.targetInfos = '',
    this.message = '',
    this.feelingLevel1Id,
    this.feelingLevel2Id,
    this.feelingLevel3Id,
    this.expectedReaction = '',
    this.wantedReaction = '',
    this.responseAfterReaction = '',
    this.reflection = '',
  });

  CommsCheckState copyWith({
    int? page,
    String? targetInfos,
    String? message,
    String? feelingLevel1Id,
    String? feelingLevel2Id,
    String? feelingLevel3Id,
    String? expectedReaction,
    String? wantedReaction,
    String? responseAfterReaction,
    String? reflection,
  }) {
    return CommsCheckState(
      page: page ?? this.page,
      targetInfos: targetInfos ?? this.targetInfos,
      message: message ?? this.message,
      feelingLevel1Id: feelingLevel1Id ?? this.feelingLevel1Id,
      feelingLevel2Id: feelingLevel2Id ?? this.feelingLevel2Id,
      feelingLevel3Id: feelingLevel3Id ?? this.feelingLevel3Id,
      expectedReaction: expectedReaction ?? this.expectedReaction,
      wantedReaction: wantedReaction ?? this.wantedReaction,
      responseAfterReaction: responseAfterReaction ?? this.responseAfterReaction,
      reflection: reflection ?? this.reflection,
    );
  }
}

class CommsCheckViewModel extends Notifier<CommsCheckState> {
  late final CommsCheckEntryRepository _repo;

  @override
  CommsCheckState build() {
    _repo = ref.read(commsCheckEntryRepositoryProvider);
    return CommsCheckState();
  }

  void setTargetInfos(String value) {
    state = state.copyWith(targetInfos: value);
  }

  void setMessage(String value) {
    state = state.copyWith(message: value);
  }

  void setFeelings({
    String? level1Id,
    String? level2Id,
    String? level3Id,
  }) {
    state = state.copyWith(
      feelingLevel1Id: level1Id,
      feelingLevel2Id: level2Id,
      feelingLevel3Id: level3Id,
    );
  }

  void setExpectedReaction(String value) {
    state = state.copyWith(expectedReaction: value);
  }

  void setWantedReaction(String value) {
    state = state.copyWith(wantedReaction: value);
  }

  void setResponseAfterReaction(String value) {
    state = state.copyWith(responseAfterReaction: value);
  }

  void setReflection(String value) {
    state = state.copyWith(reflection: value);
  }

  void nextPage() {
    state = state.copyWith(page: state.page + 1);
  }

  void prevPage() {
    if (state.page > 0) state = state.copyWith(page: state.page - 1);
  }

  void reset() {
    state = CommsCheckState();
  }

  Future<void> save() async {
    await _repo.createEntry(
      targetInfos: state.targetInfos,
      message: state.message,
      feelingLevel1Id: state.feelingLevel1Id,
      feelingLevel2Id: state.feelingLevel2Id,
      feelingLevel3Id: state.feelingLevel3Id,
      expectedReaction: state.expectedReaction,
      wantedReaction: state.wantedReaction,
      responseAfterReaction: state.responseAfterReaction,
      reflection: state.reflection,
    );
  }
}

final commsCheckViewModelProvider = NotifierProvider<CommsCheckViewModel, CommsCheckState>(
  CommsCheckViewModel.new,
);

