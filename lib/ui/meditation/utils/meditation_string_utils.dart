import 'package:personal_hub_app/domain/entities/meditation_entry.dart';

extension MeditationLevelDisplay on MeditationLevel {
  String get displayName {
    switch (this) {
      case MeditationLevel.basic:
        return "Basic";
      case MeditationLevel.advanced:
        return "Advanced";
      case MeditationLevel.expert:
        return "Expert";
    }
  }
}

extension MeditationTypeDisplay on MeditationType {
  String get displayName {
    switch (this) {
      case MeditationType.ahamkara:
        return "Ahamkara";
      case MeditationType.breath:
        return "Breath";
      case MeditationType.death:
        return "Death";
      case MeditationType.dharana:
        return "Dharana";
      case MeditationType.dreams:
        return "Dreams";
      case MeditationType.energy:
        return "Energy";
      case MeditationType.mantra:
        return "Mantra";
      case MeditationType.pratyahara:
        return "Pratyahara";
      case MeditationType.sight:
        return "Sight";
      case MeditationType.sound:
        return "Sound";
    }
  }
}

extension ChakraTypeDisplay on ChakraType {
  String get displayName {
    switch (this) {
      case ChakraType.ajna:
        return "Ajna";
      case ChakraType.sahasrara:
        return "Sahasrara";
      case ChakraType.manipura:
        return "Manipura";
      case ChakraType.svadhisthana:
        return "Svadhisthana";
      case ChakraType.muladhara:
        return "Muladhara";
      case ChakraType.vishuddha:
        return "Vishuddha";
      case ChakraType.anahata:
        return "Anahata";
    }
  }
}

extension CognitiveTypeDisplay on CognitiveType {
  String get displayName {
    switch (this) {
      case CognitiveType.focusing:
        return "Focusing";
      case CognitiveType.inquisitive:
        return "Inquisitive";
      case CognitiveType.grounding:
        return "Grounding";
      case CognitiveType.openAwareness:
        return "Open Awareness";
    }
  }
}
