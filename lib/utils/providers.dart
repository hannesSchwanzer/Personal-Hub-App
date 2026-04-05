import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:personal_hub_app/data/database/app_database.dart';
import 'package:personal_hub_app/data/database/daos/journal_dao.dart';
import 'package:personal_hub_app/data/database/daos/journal_reflection_dao.dart';
import 'package:personal_hub_app/data/repositories/journal_entry_reporsitory_impl.dart';
import 'package:personal_hub_app/data/repositories/journal_reflection_repository_impl.dart';
import 'package:personal_hub_app/data/repositories/settings_repository_impl.dart';
import 'package:personal_hub_app/data/services/backup_service_impl.dart';
import 'package:personal_hub_app/domain/entities/settings.dart';
import 'package:personal_hub_app/domain/repositories/journal_entry_repository.dart';
import 'package:personal_hub_app/domain/repositories/journal_reflection_repository.dart';
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
  return JournalEntryReporsitoryImpl(dao);
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

