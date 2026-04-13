
import 'package:personal_hub_app/domain/entities/audio_file.dart';
import 'package:personal_hub_app/domain/entities/meditation/meditation_entry.dart';

final meditationSeeds = [
  {
    'title': 'Prana Shuddhi',
    'description': 'This advanced breathing technique purifies our vital life energy and begins to activate the third eye chakra. This practice is to be done after practicing anuloma viloma every day for 2 weeks.',
    'type': MeditationType.breath,
    'chakraType': ChakraType.ajna,
    'cognitiveTypes': [CognitiveType.focusing],
    'level': MeditationLevel.expert,
    'audioSections': [
      ('assets/audio/prana-shuddhi-start.mp3', FileType.asset, false),
      ('assets/audio/prana-shuddhi-middle.mp3', FileType.asset, true),
      ('assets/audio/prana-shuddhi-end.mp3', FileType.asset, false),
    ],
  },
  {
    'title': 'Anuloma Viloma',
    'description': 'This practice is a continuation of the alternate nostril breathing. It should be done after practicing nadi shuddhi every day for 2 weeks.',
    'type': MeditationType.breath,
    'cognitiveTypes': [CognitiveType.focusing, CognitiveType.grounding],
    'level': MeditationLevel.advanced,
    'audioSections': [
      ('assets/audio/anuloma-viloma-start.mp3', FileType.asset, false),
      ('assets/audio/silence-1min.mp3', FileType.asset, true),
      ('assets/audio/anuloma-viloma-end.mp3', FileType.asset, false),
    ],
  },
  {
    'title': 'Nadi Shuddhi',
    'description': 'Nadi Shuddhi, or alternate nostril breathing, is a great introductory meditation technique to start with. It calms and energizes the mind, and helps bring balance.',
    'type': MeditationType.breath,
    'cognitiveTypes': [CognitiveType.focusing, CognitiveType.grounding],
    'level': MeditationLevel.basic,
    'audioSections': [
      ('assets/audio/nadi-shuddhi-start.mp3', FileType.asset, false),
      ('assets/audio/nadi-shuddhi-middle.mp3', FileType.asset, true),
      ('assets/audio/nadi-shuddhi-end.mp3', FileType.asset, false),
    ],
  },
  {
    'title': 'Trataka',
    'description': 'Trataka, or fixed point gazing, is a powerful technique that builds concentration and gently cleanses the ajna, or third eye chakra.',
    'type': MeditationType.sight,
    'cognitiveTypes': [CognitiveType.focusing],
    'level': MeditationLevel.advanced,
    'chakraType': ChakraType.ajna,
    'audioSections': [
      ('assets/audio/trataka-start.mp3', FileType.asset, false),
      ('assets/audio/silence-1min.mp3', FileType.asset, true),
      ('assets/audio/trataka-middle.mp3', FileType.asset, false),
      ('assets/audio/silence-45sec.mp3', FileType.asset, true),
      ('assets/audio/trataka-end.mp3', FileType.asset, false),
    ],
  },
];

