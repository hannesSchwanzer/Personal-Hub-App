import 'package:personal_hub_app/domain/entities/body_map_drawing.dart';

class JournalEntryEntity {
  final String id;
  final String? emotionLevel1;
  final String? emotionLevel2;
  final String? emotionLevel3;
  final String entry;
  final DateTime createdAt;
  final DateTime updatedAt;

  final BodyMapDrawing? bodyMapDrawing;

  JournalEntryEntity({
    required this.id,
    this.emotionLevel1,
    this.emotionLevel2,
    this.emotionLevel3,
    required this.entry,
    required this.createdAt,
    required this.updatedAt,
    this.bodyMapDrawing,
  });

  JournalEntryEntity copyWith({
    String? emotionLevel1,
    String? emotionLevel2,
    String? emotionLevel3,
    String? entry,
    DateTime? updatedAt,
    BodyMapDrawing? bodyMapDrawing,
  }) {
    return JournalEntryEntity(
      id: id,
      emotionLevel1: emotionLevel1 ?? this.emotionLevel1,
      emotionLevel2: emotionLevel2 ?? this.emotionLevel2,
      emotionLevel3: emotionLevel3 ?? this.emotionLevel3,
      entry: entry ?? this.entry,
      createdAt: createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      bodyMapDrawing: bodyMapDrawing ?? this.bodyMapDrawing,
    );
  }

  factory JournalEntryEntity.create({
    required String id,
    required String entry,
    String? emotionLevel1,
    String? emotionLevel2,
    String? emotionLevel3,
    required DateTime now,
    BodyMapDrawing? bodyMapDrawing,
  }) {
    return JournalEntryEntity(
      id: id,
      entry: entry,
      emotionLevel1: emotionLevel1,
      emotionLevel2: emotionLevel2,
      emotionLevel3: emotionLevel3,
      createdAt: now,
      updatedAt: now,
      bodyMapDrawing: bodyMapDrawing,
    );
  }
}
