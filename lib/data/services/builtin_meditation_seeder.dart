
import 'package:personal_hub_app/data/builtin/mediation_seeds.dart';
import 'package:personal_hub_app/data/services/meditation_entry_creation_service.dart';
import 'package:personal_hub_app/domain/entities/audio_file.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BuiltInMeditationSeeder {
  final MeditationEntryCreationService _creationService;

  BuiltInMeditationSeeder(this._creationService);

  static const _seededKey = 'builtin_meditation_seeded';

  Future<void> seedIfNeeded() async {
    final prefs = await SharedPreferences.getInstance();
    final alreadySeeded = prefs.getBool(_seededKey) ?? false;
    if (!alreadySeeded) {
      for (final seed in meditationSeeds) {
        await _creationService.createEntryWithPaths(
          title: seed['title']!,
          description: seed['description']!,
          type: seed['type']!,
          chakraType: seed['chakraType'],
          cognitiveType: seed['cognitiveType'],
          level: seed['level']!,
          audioCompletePath: seed['audioCompletePath'],
          audioCompleteType: FileType.asset,
          audioBeginningPath: seed['audioBeginningPath'],
          audioBeginningType: FileType.asset,
          audioRepeatingPath: seed['audioRepeatingPath'],
          audioRepeatingType: FileType.asset,
          audioEndPath: seed['audioEndPath'],
          audioEndType: FileType.asset,
          tutorialVideoPath: seed['tutorialVideoPath'],
        );
      }
      await prefs.setBool(_seededKey, true);
    }
  }
}
