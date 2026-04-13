import 'package:personal_hub_app/data/database/daos/meditation/routine_dao.dart';
import 'package:personal_hub_app/data/mappers/routine_mapper.dart';
import 'package:personal_hub_app/domain/entities/meditation/routine_entity.dart';
import 'package:personal_hub_app/domain/repositories/routine_repository.dart';
import 'package:uuid/uuid.dart';

class RoutineRepositoryImpl implements RoutineRepository {
  final RoutineDao _routineDao;
  final Uuid _uuid = const Uuid();

  RoutineRepositoryImpl(this._routineDao);

  @override
  Future<void> createRoutine(RoutineEntity routine) {
    final routineWithId = routine.id.isEmpty
        ? routine.copyWith(id: _uuid.v4())
        : routine;
    final (routineCompanion, itemsCompanion) = RoutineEntityMapper.toCompanions(routineWithId);
    return _routineDao.insertRoutineWithItems(routineCompanion, itemsCompanion);
  }

  @override
  Future<void> updateRoutine(RoutineEntity routine) {
    final (routineCompanion, itemsCompanion) = RoutineEntityMapper.toCompanions(routine);
    return _routineDao.updateRoutineWithItems(routineCompanion, itemsCompanion);
  }

  @override
  Future<void> deleteRoutine(String id) {
    return _routineDao.deleteRoutineById(id);
  }

  @override
  Future<List<RoutineEntity>> getAllRoutines() async {
    final routinesWithItems = await _routineDao.getAllRoutinesWithItems();
    return routinesWithItems.map((r) => r.toEntity()).toList();
  }

  @override
  Stream<List<RoutineEntity>> watchAllRoutines() {
    return _routineDao.watchAllRoutinesWithItems().map(
          (list) => list.map((r) => r.toEntity()).toList(),
        );
  }

  @override
  Future<void> deleteAllRoutines() {
    // TODO: implement deleteAllRoutines
    throw UnimplementedError();
  }
}

