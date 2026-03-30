import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:personal_hub_app/data/database/app_database.dart';
import 'package:personal_hub_app/data/database/daos/journal_dao.dart';
import 'package:personal_hub_app/data/repositories/journal_entry_reporsitory_impl.dart';
import 'package:personal_hub_app/domain/repositories/journal_entry_repository.dart';

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

