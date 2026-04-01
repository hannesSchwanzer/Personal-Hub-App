import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:personal_hub_app/domain/entities/settings.dart';
import 'package:personal_hub_app/domain/repositories/settings_repository.dart';
import 'package:personal_hub_app/utils/providers.dart';

/// Notifier that manages app settings and persists them to the repository.
///
/// Loads settings on build; call update methods to persist changes.
class SettingsNotifier extends Notifier<Settings> {
  late final SettingsRepository _repository;

  @override
  Settings build() {
    _repository = ref.read(settingsRepositoryProvider);
    // Load settings asynchronously, but synchronously provide default for initial UI
    _loadSettings();
    return Settings(); // Initial value, quickly replaced when loaded
  }

  /// Loads persisted settings and updates state asynchronously.
  Future<void> _loadSettings() async {
    final loaded = await _repository.loadSettings();
    state = loaded;
  }

  /// Update locale and persist settings.
  Future<void> setLocale(Locale? locale) async {
    final updated = state.copyWith(locale: locale);
    state = updated;
    await _repository.saveSettings(updated);
  }

}
