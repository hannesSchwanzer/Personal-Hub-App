import 'package:personal_hub_app/data/builtin/mediation_seeds.dart';
import 'package:personal_hub_app/data/services/meditation_entry_creation_service.dart';
import 'package:personal_hub_app/domain/entities/audio_file.dart';
import 'package:personal_hub_app/domain/entities/meditation/meditation_entry.dart';
import 'package:personal_hub_app/domain/repositories/meditation_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BuiltInMeditationSeeder {
  final MeditationEntryCreationService _creationService;
  final MeditationRepository _meditationRepository;

  BuiltInMeditationSeeder(this._creationService, this._meditationRepository);

  static const _seededKey = 'builtin_meditation_seeded';

Future<void> seedIfNeeded() async {
  final prefs = await SharedPreferences.getInstance();
  final alreadySeeded = prefs.getBool(_seededKey) ?? false;
  if (!alreadySeeded) {
    try {
      for (final seed in meditationSeeds) {
        await _creationService.createEntryWithPaths(
          title: seed['title'] as String,
          description: seed['description'] as String,
          type: seed['type'] as MeditationType,
          chakraType: seed['chakraType'] as ChakraType?,
          cognitiveTypes: seed['cognitiveTypes'] as List<CognitiveType>,
          level: seed['level'] as MeditationLevel,
          audioSections: seed['audioSections'] as List<(String, FileType, bool)>,
          tutorialVideoPath: seed['tutorialVideoPath'] as String?,
        );
      }
      await prefs.setBool(_seededKey, true);
    } catch (e, stack) {
      // Log the error, but prevent infinite retries
      print('Seeding failed: $e\n$stack');
      await prefs.setBool(_seededKey, false); // Or false if you want to retry later
    }
  }
}
}
