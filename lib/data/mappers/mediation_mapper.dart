import 'dart:convert';
import 'package:drift/drift.dart';
import 'package:personal_hub_app/data/database/app_database.dart';
import 'package:personal_hub_app/domain/entities/meditation_entry.dart';
import 'package:personal_hub_app/domain/entities/audio_file.dart';

/// Conversion helpers for AudioFile <-> json string
extension AudioFileJson on AudioFile {
  /// Convert AudioFile to json string
  String toJsonString() {
    return jsonEncode({
      'path': path,
      'duration': duration.inMilliseconds,
      'type': type.name,
    });
  }

  /// Convert json string to AudioFile instance
  static AudioFile? fromJsonString(String? jsonString) {
    if (jsonString == null) return null;
    try {
      final Map<String, dynamic> map = jsonDecode(jsonString);
      return AudioFile(
        path: map['path'] as String,
        duration: Duration(milliseconds: map['duration'] as int),
        type: FileType.values.byName(map['type'] as String),
      );
    } catch (_) {
      return null;
    }
  }
}

extension MeditationMapper on Meditation {
  MeditationEntry toEntity() {
    return MeditationEntry(
      id: id,
      title: title,
      description: description,
      type: type,
      chakraType: chakraType,
      cognitiveType: cognitiveType,
      level: level,
      audioComplete: AudioFileJson.fromJsonString(audioCompletePath),
      audioBeginning: AudioFileJson.fromJsonString(audioBeginningPath),
      audioRepeating: AudioFileJson.fromJsonString(audioRepeatingPath),
      audioEnd: AudioFileJson.fromJsonString(audioEndPath),
      tutorialVideoPath: tutorialVideoPath,
    );
  }
}

extension MeditationEntityMapper on MeditationEntry {
  MeditationsCompanion toCompanion() {
    return MeditationsCompanion(
      id: Value(id),
      title: Value(title),
      description: Value(description),
      type: Value(type),
      chakraType: Value(chakraType),
      cognitiveType: Value(cognitiveType),
      level: Value(level),
      audioCompletePath: Value(audioComplete?.toJsonString()),
      audioBeginningPath: Value(audioBeginning?.toJsonString()),
      audioRepeatingPath: Value(audioRepeating?.toJsonString()),
      audioEndPath: Value(audioEnd?.toJsonString()),
      tutorialVideoPath: Value(tutorialVideoPath),
    );
  }
}

