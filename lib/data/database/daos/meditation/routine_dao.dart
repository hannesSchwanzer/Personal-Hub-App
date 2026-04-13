import 'package:drift/drift.dart';
import '../../app_database.dart';
import '../../tables/meditation/meditation_table.dart';
import '../../tables/meditation/routine_meditation_table.dart';
import '../../tables/meditation/routine_table.dart';

part 'routine_dao.g.dart';

@DriftAccessor(
  tables: [Routines, RoutineMeditations, Meditations],
)
class RoutineDao extends DatabaseAccessor<AppDatabase> with _$RoutineDaoMixin {
  RoutineDao(super.attachedDatabase);

  /// Insert a new routine with its items atomically
  Future<void> insertRoutineWithItems(
      Insertable<Routine> routine, List<Insertable<RoutineMeditation>> items) async {
    await transaction(() async {
      await into(routines).insert(routine);
      if (items.isNotEmpty) {
        await batch((batch) {
          batch.insertAll(routineMeditations, items);
        });
      }
    });
  }

  /// Update an existing routine and replace its items atomically
  Future<void> updateRoutineWithItems(
      Insertable<Routine> routine, List<Insertable<RoutineMeditation>> items) async {
    await transaction(() async {
      await update(routines).replace(routine);
      // Remove old items
      final id = (routine as Routine).id;
      await (delete(routineMeditations)..where((t) => t.routineId.equals(id))).go();
      // Insert new items
      if (items.isNotEmpty) {
        await batch((batch) {
          batch.insertAll(routineMeditations, items);
        });
      }
    });
  }

  /// Delete routine and its routine_meditations atomically
  Future<void> deleteRoutineById(String id) async {
    await transaction(() async {
      await (delete(routineMeditations)..where((t) => t.routineId.equals(id))).go();
      await (delete(routines)..where((t) => t.id.equals(id))).go();
    });
  }

  /// Retrieve all routines with their meditation items (joined/hydrated)
  Future<List<RoutineWithItems>> getAllRoutinesWithItems() {
    final query = select(routines).join([
      leftOuterJoin(
        routineMeditations,
        routineMeditations.routineId.equalsExp(routines.id),
      ),
      leftOuterJoin(
        meditations,
        meditations.id.equalsExp(routineMeditations.meditationId),
      ),
    ])
      ..orderBy([
        OrderingTerm.asc(routines.id),
        OrderingTerm.asc(routineMeditations.orderIndex),
      ]);

    return query
        .get()
        .then(_groupJoinedRowsToRoutines);
  }

  /// Watch all routines with their meditation items (live updates)
  Stream<List<RoutineWithItems>> watchAllRoutinesWithItems() {
    final query = select(routines).join([
      leftOuterJoin(
        routineMeditations,
        routineMeditations.routineId.equalsExp(routines.id),
      ),
      leftOuterJoin(
        meditations,
        meditations.id.equalsExp(routineMeditations.meditationId),
      ),
    ])
      ..orderBy([
        OrderingTerm.asc(routines.id),
        OrderingTerm.asc(routineMeditations.orderIndex),
      ]);

    return query.watch().map(_groupJoinedRowsToRoutines);
  }

  /// Helper: Group joined rows into RoutineWithItems
  List<RoutineWithItems> _groupJoinedRowsToRoutines(
      List<TypedResult> rows) {
    final Map<String, RoutineWithItems> routinesMap = {};

    for (final row in rows) {
      final routine = row.readTable(routines);
      final item = row.readTableOrNull(routineMeditations);
      final meditation = row.readTableOrNull(meditations);

      // Deduplicate routines
      final routineId = routine.id;
      if (!routinesMap.containsKey(routineId)) {
        routinesMap[routineId] = RoutineWithItems(
          routine: routine,
          items: [],
        );
      }

      if (item != null && meditation != null) {
        routinesMap[routineId]!.items.add(
          RoutineItemJoined(
            routineMeditation: item,
            meditation: meditation,
          ),
        );
      }
    }

    return routinesMap.values.toList();
  }
}

/// Data holder for a hydrated routine + its items
class RoutineWithItems {
  final Routine routine;
  final List<RoutineItemJoined> items;
  RoutineWithItems({required this.routine, required this.items});
}

/// Data holder for a single routine-meditation + hydrated meditation
class RoutineItemJoined {
  final RoutineMeditation routineMeditation;
  final Meditation meditation;
  RoutineItemJoined({
    required this.routineMeditation,
    required this.meditation,
  });
}

