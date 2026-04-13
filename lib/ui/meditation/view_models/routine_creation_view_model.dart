import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:personal_hub_app/domain/entities/meditation/meditation_entry.dart';
import 'package:personal_hub_app/data/services/routine_service.dart';
import 'package:personal_hub_app/utils/providers.dart';

class MeditationRepetitionInput {
  MeditationEntry? meditation;
  int repetitions;

  MeditationRepetitionInput({this.meditation, this.repetitions = 1});

  RoutineCreationItemInput? toCreationItem() {
    if (meditation == null) return null;
    return RoutineCreationItemInput(
      meditation: meditation!,
      repetitions: repetitions,
    );
  }
}

/// ViewModel for creating or editing a routine.
/// Handles form input and calling RoutineService.
class RoutineCreationViewModel extends Notifier<RoutineCreationState> {
  // These variables store optional initial values for edit mode or defaults.
  String? _id;
  String? _initialName;
  String? _initialDescription;
  List<MeditationRepetitionInput>? _initialMeditations;
  bool? _initialVisible;

  RoutineCreationViewModel({
    String? id,
    String? initialName,
    String? initialDescription,
    List<MeditationRepetitionInput>? initialMeditations,
    bool? initialVisible,
  }) {
    _id = id;
    _initialName = initialName;
    _initialDescription = initialDescription;
    _initialMeditations = initialMeditations;
    _initialVisible = initialVisible;
    // Do NOT set state here!
  }

  RoutineService get _service =>
      ref.read(meditationRoutineServiceProvider);

  void setName(String value) => state = state.copyWith(name: value);

  void setDescription(String value) =>
      state = state.copyWith(description: value);

  void setVisible(bool value) =>
      state = state.copyWith(visible: value);

  void setMeditationAt(int idx, MeditationEntry? entry) {
    final meds = [...state.meditations];
    meds[idx] = MeditationRepetitionInput(
      meditation: entry,
      repetitions: meds[idx].repetitions,
    );
    state = state.copyWith(meditations: meds);
  }

  void setRepetitionsAt(int idx, int value) {
    if (value < 1) return;
    final meds = [...state.meditations];
    meds[idx] = MeditationRepetitionInput(
      meditation: meds[idx].meditation,
      repetitions: value,
    );
    state = state.copyWith(meditations: meds);
  }

  void addMeditation() {
    state = state.copyWith(
      meditations: [...state.meditations, MeditationRepetitionInput()],
    );
  }

  void removeMeditationAt(int idx) {
    final meds = [...state.meditations]..removeAt(idx);
    state = state.copyWith(meditations: meds);
  }

  Future<bool> save() async {
    if (state.name.trim().isEmpty || state.meditations.any((m) => m.meditation == null)) {
      state = state.copyWith(error: "Please fill in all fields and selects.");
      return false;
    }
    state = state.copyWith(saving: true, error: null);
    try {
      final input = RoutineCreationInput(
        id: state.id,
        name: state.name.trim(),
        description: state.description.trim(),
        visible: state.visible,
        items: state.meditations
            .map((e) => e.toCreationItem())
            .whereType<RoutineCreationItemInput>()
            .toList(),
      );
      await _service.createOrUpdateRoutineFromInput(input);
      state = state.copyWith(saving: false, error: null);
      return true;
    } catch (e) {
      state = state.copyWith(saving: false, error: e.toString());
      return false;
    }
  }

  /// Now all initialization/logic below is run in the proper place.
  @override
  RoutineCreationState build() {
    return RoutineCreationState(
      id: _id,
      name: _initialName ?? '',
      description: _initialDescription ?? '',
      meditations: _initialMeditations ?? [MeditationRepetitionInput()],
      visible: _initialVisible ?? true,
      saving: false,
      error: null,
    );
  }
}

class RoutineCreationState {
  final String? id;
  final String name;
  final String description;
  final List<MeditationRepetitionInput> meditations;
  final bool visible;
  final bool saving;
  final String? error;

  RoutineCreationState({
    this.id,
    required this.name,
    required this.description,
    required this.meditations,
    required this.visible,
    required this.saving,
    this.error,
  });

  RoutineCreationState copyWith({
    String? id,
    String? name,
    String? description,
    List<MeditationRepetitionInput>? meditations,
    bool? visible,
    bool? saving,
    String? error,
  }) {
    return RoutineCreationState(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      meditations: meditations ?? this.meditations,
      visible: visible ?? this.visible,
      saving: saving ?? this.saving,
      error: error,
    );
  }
}

/// Riverpod provider for the routine view model.
/// Call with parameters for edit mode.
final routineCreationViewModelProvider =
    NotifierProvider.autoDispose<RoutineCreationViewModel, RoutineCreationState>(
  RoutineCreationViewModel.new,
);

