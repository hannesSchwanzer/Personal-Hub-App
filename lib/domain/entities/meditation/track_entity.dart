import 'package:personal_hub_app/domain/entities/meditation/routine_entity.dart';

class Track {
  final String id;
  final String name;
  final String? description;

  final List<TrackRoutine> routines;

  const Track({
    required this.id,
    required this.name,
    this.description,
    required this.routines,
  });
}

class TrackRoutine {
  final RoutineEntity routine;
  final int orderIndex;
  final bool isCompleted;

  const TrackRoutine({
    required this.routine,
    required this.orderIndex,
    required this.isCompleted,
  });
}
