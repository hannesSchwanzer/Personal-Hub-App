
import 'package:personal_hub_app/data/builtin/mediation_seeds.dart';
import 'package:personal_hub_app/data/services/meditation_entry_creation_service.dart';
import 'package:personal_hub_app/domain/entities/audio_file.dart';
import 'package:personal_hub_app/domain/entities/meditation_entry.dart';
import 'package:personal_hub_app/domain/repositories/meditation_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BuiltInMeditationSeeder {
  final MeditationEntryCreationService _creationService;
  final MeditationRepository _meditationRepository;

  BuiltInMeditationSeeder(this._creationService, this._meditationRepository);

  static const _seededKey = 'builtin_meditation_seeded';

  Future<void> seedIfNeeded() async {
    _meditationRepository.deleteAllEntries();

    final prefs = await SharedPreferences.getInstance();
    // final alreadySeeded = prefs.getBool(_seededKey) ?? false;
    final alreadySeeded = false; // Force reseeding for testing/demo purposes TODO: Remove this line and uncomment above for production
    if (!alreadySeeded) {
      await _creationService.createMultipleEntriesWithPaths([
        for (final seed in meditationSeeds)
          (
            title: seed['title'] as String,
            description: seed['description'] as String,
            type: seed['type'] as MeditationType,
            chakraType: seed['chakraType'] as ChakraType?,
            cognitiveTypes: seed['cognitiveTypes'] as List<CognitiveType>,
            level: seed['level'] as MeditationLevel,
            audioCompletePath: seed['audioCompletePath'] as String?,
            audioCompleteType: FileType.asset,
            audioBeginningPath: seed['audioBeginningPath'] as String?,
            audioBeginningType: FileType.asset,
            audioRepeatingPath: seed['audioRepeatingPath'] as String?,
            audioRepeatingType: FileType.asset,
            audioEndPath: seed['audioEndPath'] as String?,
            audioEndType: FileType.asset,
            tutorialVideoPath: seed['tutorialVideoPath'] as String?,
          ),
      ]);
      await prefs.setBool(_seededKey, true);
    }
  }
}
