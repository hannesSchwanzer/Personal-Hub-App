import 'package:drift/drift.dart';

class TrackRoutines extends Table {
  TextColumn get trackId => text()();
  TextColumn get routineId => text()();
  IntColumn get orderIndex => integer()();
  BoolColumn get isCompleted => boolean().withDefault(const Constant(false))();

  @override
  Set<Column> get primaryKey => {trackId, routineId};
}

