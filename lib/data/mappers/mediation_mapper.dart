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

/// Converts Drift Meditation data model to domain MeditationEntry using enums
extension MeditationMapper on Meditation {
  MeditationEntry toEntity() {
    return MeditationEntry(
      id: id,
      favorite: favorite,
      title: title,
      description: description,
      type: MeditationType.values.byName(type),
      chakraType: chakraType == null ? null : ChakraType.values.byName(chakraType!),
      cognitiveTypes: _cognitiveTypeListFromJsonString(cognitiveType),
      level: MeditationLevel.values.byName(level),
      audioComplete: AudioFileJson.fromJsonString(audioCompletePath),
      audioBeginning: AudioFileJson.fromJsonString(audioBeginningPath),
      audioRepeating: AudioFileJson.fromJsonString(audioRepeatingPath),
      audioEnd: AudioFileJson.fromJsonString(audioEndPath),
      tutorialVideoPath: tutorialVideoPath,
    );
  }
}

/// Helper to convert a stored JSON string into a list of CognitiveType
List<CognitiveType> _cognitiveTypeListFromJsonString(String? jsonString) {
  if (jsonString == null || jsonString.isEmpty) return [];
  try {
    final List<dynamic> list = jsonDecode(jsonString);
    return list
        .map((e) => CognitiveType.values.byName(e as String))
        .toList();
  } catch (_) {
    return [];
  }
}

/// Converts domain MeditationEntry with enums to Drift companion object for persistence
extension MeditationEntityMapper on MeditationEntry {
  MeditationsCompanion toCompanion() {
    return MeditationsCompanion(
      id: Value(id),
      favorite: Value(favorite),
      title: Value(title),
      description: Value(description),
      type: Value(type.name),
      chakraType: Value(chakraType?.name),
      cognitiveType: Value(jsonEncode(cognitiveTypes.map((t) => t.name).toList())),
      level: Value(level.name),
      audioCompletePath: Value(audioComplete?.toJsonString()),
      audioBeginningPath: Value(audioBeginning?.toJsonString()),
      audioRepeatingPath: Value(audioRepeating?.toJsonString()),
      audioEndPath: Value(audioEnd?.toJsonString()),
      tutorialVideoPath: Value(tutorialVideoPath),
    );
  }
}

