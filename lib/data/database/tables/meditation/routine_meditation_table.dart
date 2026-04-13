import 'package:drift/drift.dart';

class RoutineMeditations extends Table {
  TextColumn get routineId => text()();
  TextColumn get meditationId => text()();

  IntColumn get orderIndex => integer()();
  IntColumn get repetitions => integer().withDefault(const Constant(1))();

  @override
  Set<Column> get primaryKey => {routineId, meditationId};
}

