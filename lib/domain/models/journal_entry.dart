class JournalEntry {
  final String id;
  final String? emotionLevel1;
  final String? emotionLevel2;
  final String? emotionLevel3;
  final String text;
  final DateTime createdAt;
  final DateTime updatedAt;

  JournalEntry({
    required this.id,
    this.emotionLevel1,
    this.emotionLevel2,
    this.emotionLevel3,
    required this.text,
    required this.createdAt,
    required this.updatedAt,
  });
}
