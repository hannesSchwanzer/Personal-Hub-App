// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'routine_dao.dart';

// ignore_for_file: type=lint
mixin _$RoutineDaoMixin on DatabaseAccessor<AppDatabase> {
  $RoutinesTable get routines => attachedDatabase.routines;
  $RoutineMeditationsTable get routineMeditations =>
      attachedDatabase.routineMeditations;
  $MeditationsTable get meditations => attachedDatabase.meditations;
  RoutineDaoManager get managers => RoutineDaoManager(this);
}

class RoutineDaoManager {
  final _$RoutineDaoMixin _db;
  RoutineDaoManager(this._db);
  $$RoutinesTableTableManager get routines =>
      $$RoutinesTableTableManager(_db.attachedDatabase, _db.routines);
  $$RoutineMeditationsTableTableManager get routineMeditations =>
      $$RoutineMeditationsTableTableManager(
        _db.attachedDatabase,
        _db.routineMeditations,
      );
  $$MeditationsTableTableManager get meditations =>
      $$MeditationsTableTableManager(_db.attachedDatabase, _db.meditations);
}
