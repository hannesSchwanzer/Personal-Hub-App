class JournalReflectionEntity {
  final String id;

  final String? guessedEmotionLevel1;
  final String? guessedEmotionLevel2;
  final String? guessedEmotionLevel3;

  final String? currentEmotionLevel1;
  final String? currentEmotionLevel2;
  final String? currentEmotionLevel3;

  final String reflection;

  final String journalEntryId;

  final DateTime createdAt;

  JournalReflectionEntity({
    required this.id,
    this.guessedEmotionLevel1,
    this.guessedEmotionLevel2,
    this.guessedEmotionLevel3,
    this.currentEmotionLevel1,
    this.currentEmotionLevel2,
    this.currentEmotionLevel3,
    required this.reflection,
    required this.journalEntryId,
    required this.createdAt,
   });

  JournalReflectionEntity copyWith({
    String? guessedEmotionLevel1,
    String? guessedEmotionLevel2,
    String? guessedEmotionLevel3,
    String? currentEmotionLevel1,
    String? currentEmotionLevel2,
    String? currentEmotionLevel3,
    String? reflection,
  }) {
    return JournalReflectionEntity(
      id: id,
      guessedEmotionLevel1: guessedEmotionLevel1 ?? this.guessedEmotionLevel1,
      guessedEmotionLevel2: guessedEmotionLevel2 ?? this.guessedEmotionLevel2,
      guessedEmotionLevel3: guessedEmotionLevel3 ?? this.guessedEmotionLevel3,
      currentEmotionLevel1: currentEmotionLevel1 ?? this.currentEmotionLevel1,
      currentEmotionLevel2: currentEmotionLevel2 ?? this.currentEmotionLevel2,
      currentEmotionLevel3: currentEmotionLevel3 ?? this.currentEmotionLevel3,
      reflection: reflection ?? this.reflection,
      createdAt: createdAt,
      journalEntryId: journalEntryId,
    );
  }

  factory JournalReflectionEntity.create({
    required String id,
    String? guessedEmotionLevel1,
    String? guessedEmotionLevel2,
    String? guessedEmotionLevel3,
    String? currentEmotionLevel1,
    String? currentEmotionLevel2,
    String? currentEmotionLevel3,
    required String reflection,
    required DateTime now,
    required String journalEntryId,
  }) {
    return JournalReflectionEntity(
      id: id,
      guessedEmotionLevel1: guessedEmotionLevel1,
      guessedEmotionLevel2: guessedEmotionLevel2,
      guessedEmotionLevel3: guessedEmotionLevel3,
      currentEmotionLevel1: currentEmotionLevel1,
      currentEmotionLevel2: currentEmotionLevel2,
      currentEmotionLevel3: currentEmotionLevel3,
      reflection: reflection,
      createdAt: now,
      journalEntryId: journalEntryId,
    );
  }
}
