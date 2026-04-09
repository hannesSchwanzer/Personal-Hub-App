class MeditationEntry {
  final String id;

  final String title;
  final String description;

  final String type;
  final String? chakraType;
  final String? cognitiveType;
  final String level;

  final String? audioCompletePath;

  final String? audioBeginningPath;
  final String? audioRepeatingPath;
  final String? audioEndPath;

  final String? tutorialVideoPath;

  MeditationEntry({
    required this.id,
    required this.title,
    required this.description,
    required this.type,
    this.chakraType,
    this.cognitiveType,
    required this.level,
    this.audioCompletePath,
    this.audioBeginningPath,
    this.audioRepeatingPath,
    this.audioEndPath,
    this.tutorialVideoPath,
  });

  MeditationEntry copyWith({
    String? id,
    String? title,
    String? description,
    String? type,
    String? chakraType,
    String? cognitiveType,
    String? level,
    String? audioCompletePath,
    String? audioBeginningPath,
    String? audioRepeatingPath,
    String? audioEndPath,
    String? tutorialVideoPath,
  }) {
    return MeditationEntry(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      type: type ?? this.type,
      chakraType: chakraType ?? this.chakraType,
      cognitiveType: cognitiveType ?? this.cognitiveType,
      level: level ?? this.level,
      audioCompletePath: audioCompletePath ?? this.audioCompletePath,
      audioBeginningPath: audioBeginningPath ?? this.audioBeginningPath,
      audioRepeatingPath: audioRepeatingPath ?? this.audioRepeatingPath,
      audioEndPath: audioEndPath ?? this.audioEndPath,
      tutorialVideoPath: tutorialVideoPath ?? this.tutorialVideoPath,
    );
  }

  factory MeditationEntry.create({
    required String id,
    required String title,
    required String description,
    required String type,
    String? chakraType,
    String? cognitiveType,
    required String level,
    String? audioCompletePath,
    String? audioBeginningPath,
    String? audioRepeatingPath,
    String? audioEndPath,
    String? tutorialVideoPath,
  }) {
    return MeditationEntry(
      id: id,
      title: title,
      description: description,
      type: type,
      chakraType: chakraType,
      cognitiveType: cognitiveType,
      level: level,
      audioCompletePath: audioCompletePath,
      audioBeginningPath: audioBeginningPath,
      audioRepeatingPath: audioRepeatingPath,
      audioEndPath: audioEndPath,
      tutorialVideoPath: tutorialVideoPath,
    );
  }
}
