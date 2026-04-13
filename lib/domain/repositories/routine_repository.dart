import 'package:personal_hub_app/domain/entities/meditation/routine_entity.dart';

abstract class RoutineRepository {
  Future<void> createRoutine(RoutineEntity routine);

  Stream<List<RoutineEntity>> watchAllRoutines();

  Future<List<RoutineEntity>> getAllRoutines();

  Future<void> deleteRoutine(String id);

  Future<void> updateRoutine(RoutineEntity routine);

  Future<void> deleteAllRoutines();
}

