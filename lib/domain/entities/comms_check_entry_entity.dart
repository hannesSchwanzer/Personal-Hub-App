class CommsCheckEntryEntity {
  final String id;
  final String targetInfos;
  final String message;
  final String? feelingLevel1Id;
  final String? feelingLevel2Id;
  final String? feelingLevel3Id;
  final String expectedReaction;
  final String wantedReaction;
  final String responseAfterReaction;
  final String reflection;
  final DateTime createdAt;
  final DateTime updatedAt;

  CommsCheckEntryEntity({
    required this.id,
    required this.targetInfos,
    required this.message,
    this.feelingLevel1Id,
    this.feelingLevel2Id,
    this.feelingLevel3Id,
    required this.expectedReaction,
    required this.wantedReaction,
    required this.responseAfterReaction,
    required this.reflection,
    required this.createdAt,
    required this.updatedAt,
  });

  CommsCheckEntryEntity copyWith({
    String? targetInfos,
    String? message,
    String? feelingLevel1Id,
    String? feelingLevel2Id,
    String? feelingLevel3Id,
    String? expectedReaction,
    String? wantedReaction,
    String? responseAfterReaction,
    String? reflection,
    DateTime? updatedAt,
  }) {
    return CommsCheckEntryEntity(
      id: id,
      targetInfos: targetInfos ?? this.targetInfos,
      message: message ?? this.message,
      feelingLevel1Id: feelingLevel1Id ?? this.feelingLevel1Id,
      feelingLevel2Id: feelingLevel2Id ?? this.feelingLevel2Id,
      feelingLevel3Id: feelingLevel3Id ?? this.feelingLevel3Id,
      expectedReaction: expectedReaction ?? this.expectedReaction,
      wantedReaction: wantedReaction ?? this.wantedReaction,
      responseAfterReaction: responseAfterReaction ?? this.responseAfterReaction,
      reflection: reflection ?? this.reflection,
      createdAt: createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  factory CommsCheckEntryEntity.create({
    required String id,
    required String targetInfos,
    required String message,
    String? feelingLevel1Id,
    String? feelingLevel2Id,
    String? feelingLevel3Id,
    required String expectedReaction,
    required String wantedReaction,
    required String responseAfterReaction,
    required String reflection,
    required DateTime now,
  }) {
    return CommsCheckEntryEntity(
      id: id,
      targetInfos: targetInfos,
      message: message,
      feelingLevel1Id: feelingLevel1Id,
      feelingLevel2Id: feelingLevel2Id,
      feelingLevel3Id: feelingLevel3Id,
      expectedReaction: expectedReaction,
      wantedReaction: wantedReaction,
      responseAfterReaction: responseAfterReaction,
      reflection: reflection,
      createdAt: now,
      updatedAt: now,
    );
  }
}
