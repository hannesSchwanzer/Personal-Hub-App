import 'dart:typed_data';

abstract class BackupService {
  Future<void> exportBackup(String filePath);
  Future<void> importBackup(String filePath);

  Future<Uint8List> exportBackupBytes();
  Future<void> importBackupBytes(Uint8List bytes);
}
