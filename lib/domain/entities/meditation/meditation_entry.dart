import 'dart:convert';

import 'package:personal_hub_app/domain/entities/audio_file.dart';

class MeditationEntry {
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MeditationEntry &&
          runtimeType == other.runtimeType &&
          id == other.id;

  @override
  int get hashCode => id.hashCode;

  final String id;

  final bool favorite;
  final String title;
  final String description;

  final MeditationType type;
  final ChakraType? chakraType;
  final List<CognitiveType> cognitiveTypes;
  final MeditationLevel level;

  final List<RepeatingAudio>? audioSections;

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
    this.audioSections,
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
    List<RepeatingAudio>? audioSections,
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
      audioSections: audioSections ?? this.audioSections,
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
    required List<RepeatingAudio> audioSections,
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
      audioSections: audioSections,
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


class RepeatingAudio {
  final AudioFile file;
  final bool isRepeating;

  RepeatingAudio({
    required this.file,
    this.isRepeating = false,
  });

  String toJsonString() {
    return jsonEncode({
      'file': file.toJsonString(),
      'isRepeating': isRepeating,
    });
  }

  factory RepeatingAudio.fromJsonString(String jsonString) {
    final Map<String, dynamic> map = jsonDecode(jsonString);
    return RepeatingAudio(
      file: AudioFile.fromJsonString(map['file'] as String),
      isRepeating: map['isRepeating'] as bool,
    );
  }
}
