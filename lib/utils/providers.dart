import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:personal_hub_app/data/database/app_database.dart';
import 'package:personal_hub_app/data/database/daos/cooking/recipe_dao.dart';
import 'package:personal_hub_app/data/database/daos/journal_dao.dart';
import 'package:personal_hub_app/data/database/daos/journal_reflection_dao.dart';
import 'package:personal_hub_app/data/database/daos/meditation/meditation_dao.dart';
import 'package:personal_hub_app/data/database/daos/meditation/routine_dao.dart';
import 'package:personal_hub_app/data/repositories/journal_entry_repository_impl.dart';
import 'package:personal_hub_app/data/repositories/journal_reflection_repository_impl.dart';
import 'package:personal_hub_app/data/repositories/meditation_repository_impl.dart';
import 'package:personal_hub_app/data/repositories/recipe_repository_impl.dart';
import 'package:personal_hub_app/data/repositories/routine_repository_impl.dart';
import 'package:personal_hub_app/data/repositories/settings_repository_impl.dart';
import 'package:personal_hub_app/data/services/api_config.dart';
import 'package:personal_hub_app/data/services/audio_duration_service.dart';
import 'package:personal_hub_app/data/services/audio_player_service.dart';
import 'package:personal_hub_app/data/services/backup_service_impl.dart';
import 'package:personal_hub_app/data/services/builtin_meditation_seeder.dart';
import 'package:personal_hub_app/data/services/image_save_service.dart';
import 'package:personal_hub_app/data/services/meditation_entry_creation_service.dart';
import 'package:personal_hub_app/data/services/recipe_image_generate_service.dart';
import 'package:personal_hub_app/data/services/routine_service.dart';
import 'package:personal_hub_app/domain/entities/meditation/meditation_entry.dart';
import 'package:personal_hub_app/domain/entities/settings.dart';
import 'package:personal_hub_app/domain/repositories/journal_entry_repository.dart';
import 'package:personal_hub_app/domain/repositories/journal_reflection_repository.dart';
import 'package:personal_hub_app/domain/repositories/meditation_repository.dart';
import 'package:personal_hub_app/domain/repositories/recipe_repository.dart';
import 'package:personal_hub_app/domain/repositories/routine_repository.dart';
import 'package:personal_hub_app/domain/repositories/settings_repository.dart';
import 'package:personal_hub_app/domain/services/backup_service.dart';
import 'package:personal_hub_app/ui/settings/view_models/settings_notifier.dart';

import 'package:personal_hub_app/domain/repositories/comms_check_entry_repository.dart';
import 'package:personal_hub_app/data/repositories/comms_check_entry_repository_impl.dart';
import 'package:personal_hub_app/data/database/daos/comms_check_dao.dart';

import 'package:personal_hub_app/domain/repositories/emotion_explorer_map_repository.dart';
import 'package:personal_hub_app/data/repositories/emotion_explorer_map_repository_impl.dart';
import 'package:personal_hub_app/data/database/daos/emotion_explorer_map_dao.dart';

final settingsNotifierProvider = NotifierProvider<SettingsNotifier, Settings>(
  SettingsNotifier.new,
);

final settingsRepositoryProvider = Provider<SettingsRepository>((ref) {
  return SettingsRepositoryImpl();
});

final databaseProvider = Provider<AppDatabase>((ref) {
  return AppDatabase();
});

final journalDaoProvider = Provider<JournalDao>((ref) {
  final db = ref.watch(databaseProvider);
  return JournalDao(db);
});

final journalEntryRepositoryProvider = Provider<JournalEntryRepository>((ref) {
  final dao = ref.watch(journalDaoProvider);
  return JournalEntryRepositoryImpl(dao);
});

final journalReflectionDaoProvider = Provider<JournalReflectionDao>((ref) {
  final db = ref.watch(databaseProvider);
  return JournalReflectionDao(db);
});

final journalReflectionRepositoryProvider =
    Provider<JournalReflectionRepository>((ref) {
      final dao = ref.watch(journalReflectionDaoProvider);
      return JournalReflectionRepositoryImpl(dao);
    });

final commsCheckDaoProvider = Provider<CommsCheckDao>((ref) {
  final db = ref.watch(databaseProvider);
  return CommsCheckDao(db);
});

final commsCheckEntryRepositoryProvider = Provider<CommsCheckEntryRepository>((ref) {
  final dao = ref.watch(commsCheckDaoProvider);
  return CommsCheckEntryRepositoryImpl(dao);
});

final backupServiceProvider = Provider<BackupService>((ref) {
  final db = ref.watch(databaseProvider);
  return BackupServiceImpl(db);
});

final emotionExplorerMapDaoProvider = Provider<EmotionExplorerMapDao>((ref) {
  final db = ref.watch(databaseProvider);
  return EmotionExplorerMapDao(db);
});

final emotionExplorerMapRepositoryProvider = Provider<EmotionExplorerMapRepository>((ref) {
  final dao = ref.watch(emotionExplorerMapDaoProvider);
  return EmotionExplorerMapRepositoryImpl(dao);
});

final mediationDaoProvider = Provider<MeditationDao>((ref) {
  final db = ref.watch(databaseProvider);
  return MeditationDao(db);
});

final meditationRepositoryProvider = Provider<MeditationRepository>((ref) {
  final dao = ref.watch(mediationDaoProvider);
  return MeditationRepositoryImpl(dao);
});

final meditationEntryCreationServiceProvider = Provider<MeditationEntryCreationService>((ref) {
  final repo = ref.watch(meditationRepositoryProvider);
  final durationService = ref.watch(audioDurationServiceProvider);
  return MeditationEntryCreationService(durationService, repo);
});

final audioDurationServiceProvider = Provider<AudioDurationService>((ref) {
  final audioPlayerService = ref.watch(audioPlayerServiceProvider);
  return AudioDurationService(audioPlayerService);
});

final audioPlayerServiceProvider = Provider<AudioPlayerService>(
  (ref) {
    final service = AudioPlayerService();
    ref.onDispose(service.dispose);
    return service;
  },
);

final builtInMeditationSeederProvider = Provider<BuiltInMeditationSeeder>((ref) {
  final meditationEntryCreationService = ref.watch(meditationEntryCreationServiceProvider);
  final meditationRepo = ref.watch(meditationRepositoryProvider);

  return BuiltInMeditationSeeder(meditationEntryCreationService, meditationRepo);
});

final meditationEntryProvider = StreamProvider.family<MeditationEntry?, String>((ref, id) {
  return ref.watch(meditationRepositoryProvider)
    .watchAllEntries()
    .map((entries) {
      try {
        return entries.firstWhere((e) => e.id == id);
      } catch (_) {
        return null;
      }
    });
});

final meditationRoutineDaoProvider = Provider<RoutineDao>((ref) {
  final db = ref.watch(databaseProvider);
  return RoutineDao(db);
});

final meditationRoutineRepositoryProvider = Provider<RoutineRepository>((ref) {
  final dao = ref.watch(meditationRoutineDaoProvider);
  return RoutineRepositoryImpl(dao);
});

final meditationRoutineServiceProvider = Provider<RoutineService>((ref) {
  final routineRepo = ref.watch(meditationRoutineRepositoryProvider);
  return RoutineService(routineRepo);
});

final recipeDaoProvider = Provider<RecipeDao>((ref) {
  final db = ref.watch(databaseProvider);
  return RecipeDao(db);
});

final recipeApiBaseUrlProvider = Provider<String>((ref) => recipeApiBaseUrl);

final recipeImageGenerateServiceProvider = Provider<RecipeImageGenerateService>((ref) {
  final baseUrl = ref.watch(recipeApiBaseUrlProvider);
  return RecipeImageGenerateService(baseUrl: baseUrl);
});

final recipeRepositoryProvider = Provider<RecipeRepository>((ref) {
  final dao = ref.watch(recipeDaoProvider);
  final recipeImageGenerateService = ref.watch(recipeImageGenerateServiceProvider);
  return RecipeRepositoryImpl(
    dao: dao,
    recipeImageGenerateService: recipeImageGenerateService,
  );
});

final imageSaveServiceProvider = Provider<ImageSaveService>((ref) {
  return ImageSaveService();
});
