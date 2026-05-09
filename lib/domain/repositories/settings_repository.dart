
import 'package:personal_hub_app/domain/entities/generic/settings.dart';

abstract class SettingsRepository {
  Future<Settings> loadSettings();
  Future<void> saveSettings(Settings settings);
}
