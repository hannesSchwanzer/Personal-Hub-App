import 'package:shared_preferences/shared_preferences.dart';
import 'package:personal_hub_app/domain/entities/settings.dart';
import 'package:flutter/material.dart';
import 'package:personal_hub_app/domain/repositories/settings_repository.dart';

/// Implementation of [SettingsRepository] using SharedPreferences for storage.
class SettingsRepositoryImpl implements SettingsRepository {
  static const String _localeKey = 'locale';
  static const String _devModeKey = 'developer_mode_enabled';

  @override
  Future<Settings> loadSettings() async {
    final prefs = await SharedPreferences.getInstance();
    final localeCode = prefs.getString(_localeKey);
    Locale? locale;
    if (localeCode != null) {
      // Support locale codes in the form 'en', 'de', or 'en_US', 'de_DE'
      final parts = localeCode.split('_');
      if (parts.length == 2) {
        locale = Locale(parts[0], parts[1]);
      } else if (parts.length == 1) {
        locale = Locale(parts[0]);
      }
    }

    final isDeveloperModeEnabled = prefs.getBool(_devModeKey) ?? false;

    return Settings(
      locale: locale,
      isDeveloperModeEnabled: isDeveloperModeEnabled,
    );
  }

  @override
  Future<void> saveSettings(Settings settings) async {
    final prefs = await SharedPreferences.getInstance();
    if (settings.locale != null) {
      // Persist as e.g. 'en' or 'de' or 'en_US'
      final code = settings.locale!.countryCode == null || settings.locale!.countryCode!.isEmpty
          ? settings.locale!.languageCode
          : '${settings.locale!.languageCode}_${settings.locale!.countryCode}';
      await prefs.setString(_localeKey, code);
    } else {
      await prefs.remove(_localeKey);
    }
  
      await prefs.setBool(_devModeKey, settings.isDeveloperModeEnabled);
  }
}

