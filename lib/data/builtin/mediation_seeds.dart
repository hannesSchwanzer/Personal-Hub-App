import 'package:personal_hub_app/domain/entities/meditation_entry.dart';

final meditationSeeds = [
  {
    'title': 'Prana Shuddhi',
    'description': 'This advanced breathing technique purifies our vital life energy and begins to activate the third eye chakra. This practice is to be done after practicing anuloma viloma every day for 2 weeks.',
    'type': MeditationType.breath,
    'chakraType': ChakraType.ajna,
    'cognitiveTypes': [CognitiveType.focusing],
    'level': MeditationLevel.expert,
    'audioBeginningPath': 'assets/audio/prana-shuddhi-start.mp3',
    'audioRepeatingPath': 'assets/audio/prana-shuddhi-middle.mp3',
    'audioEndPath': 'assets/audio/prana-shuddhi-end.mp3',
  },
  {
    'title': 'Anuloma Viloma',
    'description': 'This practice is a continuation of the alternate nostril breathing. It should be done after practicing nadi shuddhi every day for 2 weeks.',
    'type': MeditationType.breath,
    'cognitiveTypes': [CognitiveType.focusing, CognitiveType.grounding],
    'level': MeditationLevel.advanced,
    'audioBeginningPath': 'assets/audio/anuloma-viloma-start.mp3',
    'audioRepeatingPath': 'assets/audio/silence-1min.mp3',
    'audioEndPath': 'assets/audio/anuloma-viloma-end.mp3',
  },
  {
    'title': 'Nadi Shuddhi',
    'description': 'Nadi Shuddhi, or alternate nostril breathing, is a great introductory meditation technique to start with. It calms and energizes the mind, and helps bring balance.',
    'type': MeditationType.breath,
    'cognitiveTypes': [CognitiveType.focusing, CognitiveType.grounding],
    'level': MeditationLevel.basic,
    'audioBeginningPath': 'assets/audio/nadi-shuddhi-start.mp3',
    'audioRepeatingPath': 'assets/audio/nadi-shuddhi-middle.mp3',
    'audioEndPath': 'assets/audio/nadi-shuddhi-end.mp3',
  },
];

