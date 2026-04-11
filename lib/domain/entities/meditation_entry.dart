import 'package:personal_hub_app/domain/entities/audio_file.dart';

class MeditationEntry {
  final String id;

  final bool favorite;
  final String title;
  final String description;

  final MeditationType type;
  final ChakraType? chakraType;
  final List<CognitiveType> cognitiveTypes;
  final MeditationLevel level;

  final AudioFile? audioComplete;

  final AudioFile? audioBeginning;
  final AudioFile? audioRepeating;
  final AudioFile? audioEnd;

  final String? tutorialVideoPath;

  const MeditationEntry({
    required this.id,
    this.favorite = false,
    required this.title,
    required this.description,
    required this.type,
    this.chakraType,
    required this.cognitiveTypes,
    required this.level,
    this.audioComplete,
    this.audioBeginning,
    this.audioRepeating,
    this.audioEnd,
    this.tutorialVideoPath,
  });

  MeditationEntry copyWith({
    String? id,
    bool? favorite,
    String? title,
    String? description,
    MeditationType? type,
    ChakraType? chakraType,
    List<CognitiveType>? cognitiveTypes,
    MeditationLevel? level,
    AudioFile? audioComplete,
    AudioFile? audioBeginning,
    AudioFile? audioRepeating,
    AudioFile? audioEnd,
    String? tutorialVideoPath,
  }) {
    return MeditationEntry(
      id: id ?? this.id,
      favorite: favorite ?? this.favorite,
      title: title ?? this.title,
      description: description ?? this.description,
      type: type ?? this.type,
      chakraType: chakraType ?? this.chakraType,
      cognitiveTypes: cognitiveTypes ?? this.cognitiveTypes,
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
    required MeditationType type,
    ChakraType? chakraType,
    required List<CognitiveType> cognitiveTypes,
    required MeditationLevel level,
    AudioFile? audioComplete,
    AudioFile? audioBeginning,
    AudioFile? audioRepeating,
    AudioFile? audioEnd,
    String? tutorialVideoPath,
  }) {
    return MeditationEntry(
      id: id,
      favorite: false,
      title: title,
      description: description,
      type: type,
      chakraType: chakraType,
      cognitiveTypes: cognitiveTypes,
      level: level,
      audioComplete: audioComplete,
      audioBeginning: audioBeginning,
      audioRepeating: audioRepeating,
      audioEnd: audioEnd,
      tutorialVideoPath: tutorialVideoPath,
    );
  }
}

enum MeditationLevel { basic, advanced, expert }

enum MeditationType {
  ahamkara,
  breath,
  death,
  dharana,
  dreams,
  energy,
  mantra,
  pratyahara,
  sight,
  sound,
}

enum ChakraType {
  ajna,
  sahasrara,
  manipura,
  svadhisthana,
  muladhara,
  vishuddha,
  anahata,
}

enum CognitiveType { focusing, inquisitive, grounding, openAwareness }
