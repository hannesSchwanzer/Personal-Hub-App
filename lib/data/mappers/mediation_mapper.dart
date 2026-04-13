import 'dart:convert';
import 'package:drift/drift.dart';
import 'package:personal_hub_app/data/database/app_database.dart';
import 'package:personal_hub_app/domain/entities/meditation/meditation_entry.dart';


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
      audioSections: jsonDecode(audioSections)
          .map<RepeatingAudio>((a) => RepeatingAudio.fromJsonString(a))
          .toList(),
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
      audioSections: Value(jsonEncode(audioSections?.map((a) => a.toJsonString()).toList())),
      tutorialVideoPath: Value(tutorialVideoPath),
    );
  }
}

