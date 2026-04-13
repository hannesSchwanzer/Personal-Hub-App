import 'package:personal_hub_app/domain/entities/meditation/meditation_entry.dart';

class RoutineEntity {
  final String id;
  final String name;
  final String? description;
  final bool
  visible; // For tracks this should be hidden, only visible for user created routines

  final List<RoutineItem> items;

  const RoutineEntity({
    required this.id,
    required this.name,
    this.description,
    required this.items,
    this.visible = true,
  });

  RoutineEntity copyWith({
    String? id,
    String? name,
    String? description,
    List<RoutineItem>? items,
    bool? visible,
  }) {
    return RoutineEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      items: items ?? this.items,
      visible: visible ?? this.visible,
    );
  }
}

class RoutineItem {
  final MeditationEntry meditation;
  final int repetitions;

  const RoutineItem({required this.meditation, required this.repetitions});
}
