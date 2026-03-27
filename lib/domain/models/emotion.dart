import 'package:flutter/material.dart';

/// Domain model representing an emotion with an optional hierarchy.
///
/// Use this class for business-logic & UI-relevant emotion operations.
/// For persistent storage, use a separate data model if needed.
class Emotion {
  /// Unique key, e.g., for localization or display purposes
  final String nameKey;

  /// Color associated with this emotion, for UI theming
  final Color color;

  /// Children emotions for hierarchical structure
  final List<Emotion> children;

  const Emotion({
    required this.nameKey,
    required this.color,
    this.children = const [],
  });

  /// Returns the hardcoded English name (or localization key)
  String getName() {
    return nameKey;
  }
}

