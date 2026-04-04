// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'journal_reflection_dao.dart';

// ignore_for_file: type=lint
mixin _$JournalReflectionDaoMixin on DatabaseAccessor<AppDatabase> {
  $JournalEntriesTable get journalEntries => attachedDatabase.journalEntries;
  $JournalReflectionsTable get journalReflections =>
      attachedDatabase.journalReflections;
  JournalReflectionDaoManager get managers => JournalReflectionDaoManager(this);
}

class JournalReflectionDaoManager {
  final _$JournalReflectionDaoMixin _db;
  JournalReflectionDaoManager(this._db);
  $$JournalEntriesTableTableManager get journalEntries =>
      $$JournalEntriesTableTableManager(
        _db.attachedDatabase,
        _db.journalEntries,
      );
  $$JournalReflectionsTableTableManager get journalReflections =>
      $$JournalReflectionsTableTableManager(
        _db.attachedDatabase,
        _db.journalReflections,
      );
}
