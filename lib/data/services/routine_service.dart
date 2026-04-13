import 'package:personal_hub_app/domain/entities/meditation/meditation_entry.dart';
import 'package:personal_hub_app/domain/entities/meditation/routine_entity.dart';
import 'package:personal_hub_app/domain/repositories/routine_repository.dart';

/// Input object for creating/updating a routine WITHOUT needing meditation IDs
class RoutineCreationInput {
  final String? id;
  final String name;
  final String description;
  final bool visible;
  final List<RoutineCreationItemInput> items;

  RoutineCreationInput({
    this.id,
    required this.name,
    required this.description,
    required this.visible,
    required this.items,
  });
}

/// Input object for a single item, using meditation name (preferred) or string identifier
class RoutineCreationItemInput {
  final MeditationEntry meditation;
  final int repetitions;

  RoutineCreationItemInput({
    required this.meditation,
    required this.repetitions,
  });
}

/// Service layer for business logic around Routine creation/update/delete
class RoutineService {
  final RoutineRepository _routineRepository;

  RoutineService(
    this._routineRepository,
  );

  /// Create or update a routine, looking up meditation IDs from names
  Future<void> createOrUpdateRoutineFromInput(RoutineCreationInput input) async {
    // Build RoutineItems, error out if not found
    final items = <RoutineItem>[];
    for (final itemInput in input.items) {
      final meditation = itemInput.meditation;
      items.add(
        RoutineItem(
          meditation: meditation,
          repetitions: itemInput.repetitions,
        ),
      );
    }

    final routine = RoutineEntity(
      id: input.id ?? '',
      name: input.name,
      description: input.description,
      items: items,
      visible: input.visible,
    );

    if (input.id == null || input.id!.isEmpty) {
      await _routineRepository.createRoutine(routine);
    } else {
      await _routineRepository.updateRoutine(routine);
    }
  }

  Future<void> deleteRoutine(String id) {
    return _routineRepository.deleteRoutine(id);
  }

  Future<List<RoutineEntity>> getAllRoutines() {
    return _routineRepository.getAllRoutines();
  }

  Stream<List<RoutineEntity>> watchAllRoutines() {
    return _routineRepository.watchAllRoutines();
  }
}

