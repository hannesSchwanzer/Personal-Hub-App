import 'package:flutter/material.dart';

class Settings {
  final Locale? locale;
  final bool isDeveloperModeEnabled;

  Settings({
    this.locale,
    this.isDeveloperModeEnabled = false,
  });

  Settings copyWith({
    Locale? locale,
    bool? isDeveloperModeEnabled,
  }) {
    return Settings(
      locale: locale ?? this.locale,
      isDeveloperModeEnabled:
          isDeveloperModeEnabled ?? this.isDeveloperModeEnabled,
    );
  }
}
