import 'package:drift/drift.dart';
import 'package:personal_hub_app/data/database/daos/meditation/routine_dao.dart';
import 'package:personal_hub_app/data/database/app_database.dart';
import 'package:personal_hub_app/domain/entities/meditation/routine_entity.dart';
import 'package:personal_hub_app/data/mappers/mediation_mapper.dart';

/// Map a hydrated RoutineWithItems (DB) to the domain Routine entity
extension RoutineWithItemsMapper on RoutineWithItems {
  RoutineEntity toEntity() {
    return RoutineEntity(
      id: routine.id,
      name: routine.name,
      description: routine.description,
      visible: routine.visible,
      items: items
          .map(
            (i) => RoutineItem(
              meditation: i.meditation.toEntity(),
              repetitions: i.routineMeditation.repetitions,
            ),
          )
          .toList(),
    );
  }
}

/// Map a domain Routine (and its items) to DB companions for insert/update
class RoutineEntityMapper {
  /// Returns the [RoutinesCompanion] and list of [RoutineMeditationsCompanion] for persistence
  static (RoutinesCompanion, List<RoutineMeditationsCompanion>) toCompanions(
    RoutineEntity routine,
  ) {
    final routinesCompanion = RoutinesCompanion(
      id: Value(routine.id),
      name: Value(routine.name),
      description: Value(routine.description),
      visible: Value(routine.visible),
    );
    final items = <RoutineMeditationsCompanion>[];
    for (int i = 0; i < routine.items.length; i++) {
      final item = routine.items[i];
      items.add(
        RoutineMeditationsCompanion(
          routineId: Value(routine.id),
          meditationId: Value(item.meditation.id),
          orderIndex: Value(i),
          repetitions: Value(item.repetitions),
        ),
      );
    }
    return (routinesCompanion, items);
  }
}
