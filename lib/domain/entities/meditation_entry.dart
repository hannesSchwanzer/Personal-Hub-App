import 'package:personal_hub_app/domain/entities/audio_file.dart';

class MeditationEntry {
  final String id;

  final String title;
  final String description;

  final String type;
  final String? chakraType;
  final String? cognitiveType;
  final String level;

  final AudioFile? audioComplete;

  final AudioFile? audioBeginning;
  final AudioFile? audioRepeating;
  final AudioFile? audioEnd;

  final String? tutorialVideoPath;

  MeditationEntry({
    required this.id,
    required this.title,
    required this.description,
    required this.type,
    this.chakraType,
    this.cognitiveType,
    required this.level,
    this.audioComplete,
    this.audioBeginning,
    this.audioRepeating,
    this.audioEnd,
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
    AudioFile? audioComplete,
    AudioFile? audioBeginning,
    AudioFile? audioRepeating,
    AudioFile? audioEnd,
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
      audioComplete: audioComplete ?? this.audioComplete,
      audioBeginning: audioBeginning ?? this.audioBeginning,
      audioRepeating: audioRepeating ?? this.audioRepeating,
      audioEnd: audioEnd ?? this.audioEnd,
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
    AudioFile? audioComplete,
    AudioFile? audioBeginning,
    AudioFile? audioRepeating,
    AudioFile? audioEnd,
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
      audioComplete: audioComplete,
      audioBeginning: audioBeginning,
      audioRepeating: audioRepeating,
      audioEnd: audioEnd,
      tutorialVideoPath: tutorialVideoPath,
    );
  }
}


