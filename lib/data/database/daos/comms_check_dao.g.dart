// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comms_check_dao.dart';

// ignore_for_file: type=lint
mixin _$CommsCheckDaoMixin on DatabaseAccessor<AppDatabase> {
  $CommsCheckEntriesTable get commsCheckEntries =>
      attachedDatabase.commsCheckEntries;
  CommsCheckDaoManager get managers => CommsCheckDaoManager(this);
}

class CommsCheckDaoManager {
  final _$CommsCheckDaoMixin _db;
  CommsCheckDaoManager(this._db);
  $$CommsCheckEntriesTableTableManager get commsCheckEntries =>
      $$CommsCheckEntriesTableTableManager(
        _db.attachedDatabase,
        _db.commsCheckEntries,
      );
}
