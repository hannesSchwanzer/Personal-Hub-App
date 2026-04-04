import 'dart:convert';
import 'dart:io';

import 'package:drift/drift.dart';
import 'package:personal_hub_app/data/database/app_database.dart';
import 'package:personal_hub_app/domain/services/backup_service.dart';

class BackupServiceImpl implements BackupService {
  final AppDatabase _database;

  BackupServiceImpl(this._database);

  Future<Map<String, dynamic>> _exportToJson() async {
    final data = <String, dynamic>{};

    data['journal_entries'] =
        (await _database.select(_database.journalEntries).get())
            .map((row) => row.toJson())
            .toList();

    data['journal_reflections'] =
        (await _database.select(_database.journalReflections).get())
            .map((row) => row.toJson())
            .toList();

    return data;
  }

  Future<void> _importFromJson(Map<String, dynamic> json) async {
    await _database.transaction(() async {
      // JOURNAL ENTRIES
      if (json['journal_entries'] == null) {
      } else {
        final entriesList = json['journal_entries'] as List;
        if (entriesList.isNotEmpty) {
          final journalEntries = entriesList
              .map(
                (e) => JournalEntriesCompanion.insert(
                  id: e['id'],
                  entry: e['entry'],
                  emotionLevel1: Value(e['emotionLevel1']),
                  emotionLevel2: Value(e['emotionLevel2']),
                  emotionLevel3: Value(e['emotionLevel3']),
                  createdAt: DateTime.fromMillisecondsSinceEpoch(e['createdAt']),
                  updatedAt: DateTime.fromMillisecondsSinceEpoch(e['updatedAt']),
                ),
              )
              .toList();
          await _database.batch((batch) {
            batch.insertAll(
              _database.journalEntries,
              journalEntries,
              mode: InsertMode.insertOrReplace,
            );
          });
        } else {
        }
      }

      // JOURNAL REFLECTIONS
      if (json['journal_reflections'] == null) {
      } else {
        final reflectionsList = json['journal_reflections'] as List;
        if (reflectionsList.isNotEmpty) {
          final journalReflections = reflectionsList
              .map(
                (e) => JournalReflectionsCompanion.insert(
                  id: e['id'],
                  guessedEmotionLevel1: Value(e['guessedEmotionLevel1']),
                  guessedEmotionLevel2: Value(e['guessedEmotionLevel2']),
                  guessedEmotionLevel3: Value(e['guessedEmotionLevel3']),
                  currentEmotionLevel1: Value(e['currentEmotionLevel1']),
                  currentEmotionLevel2: Value(e['currentEmotionLevel2']),
                  currentEmotionLevel3: Value(e['currentEmotionLevel3']),
                  reflection: e['reflection'],
                  journalEntryId: e['journalEntryId'],
                  createdAt: DateTime.fromMillisecondsSinceEpoch(e['createdAt']),
                ),
              )
              .toList();
          await _database.batch((batch) {
            batch.insertAll(
              _database.journalReflections,
              journalReflections,
              mode: InsertMode.insertOrReplace,
            );
          });
        } else {
        }
      }
    });
  }

  @override
  Future<void> exportBackup(String filePath) async {
    final jsonMap = await _exportToJson();
    final jsonString = jsonEncode(jsonMap);

    final file = File(filePath);
    await file.writeAsString(jsonString);
  }

  @override
  Future<void> importBackup(String filePath) async {
    final file = File(filePath);
    final jsonString = await file.readAsString();
    final jsonMap = jsonDecode(jsonString) as Map<String, dynamic>;

    await _importFromJson(jsonMap);
  }

  @override
  Future<Uint8List> exportBackupBytes() async {
    final jsonMap = await _exportToJson();
    final jsonString = jsonEncode(jsonMap);
    return Uint8List.fromList(utf8.encode(jsonString));
  }

  @override
  Future<void> importBackupBytes(Uint8List bytes) {
    final jsonString = utf8.decode(bytes);
    final jsonMap = jsonDecode(jsonString) as Map<String, dynamic>;
    return _importFromJson(jsonMap);
  }
}
