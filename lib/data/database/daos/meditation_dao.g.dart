// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meditation_dao.dart';

// ignore_for_file: type=lint
mixin _$MeditationDaoMixin on DatabaseAccessor<AppDatabase> {
  $MeditationsTable get meditations => attachedDatabase.meditations;
  MeditationDaoManager get managers => MeditationDaoManager(this);
}

class MeditationDaoManager {
  final _$MeditationDaoMixin _db;
  MeditationDaoManager(this._db);
  $$MeditationsTableTableManager get meditations =>
      $$MeditationsTableTableManager(_db.attachedDatabase, _db.meditations);
}
