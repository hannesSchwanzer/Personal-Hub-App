import 'package:flutter/material.dart';

class Settings {
  final Locale? locale;
  // add more settings here

  Settings({this.locale});
  Settings copyWith({Locale? locale}) => Settings(locale: locale ?? this.locale);
}
