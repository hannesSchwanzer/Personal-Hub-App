class JournalEntryEntity {
  final String id;
  final String? emotionLevel1;
  final String? emotionLevel2;
  final String? emotionLevel3;
  final String entry;
  final DateTime createdAt;
  final DateTime updatedAt;

  JournalEntryEntity({
    required this.id,
    this.emotionLevel1,
    this.emotionLevel2,
    this.emotionLevel3,
    required this.entry,
    required this.createdAt,
    required this.updatedAt,
  });
}
