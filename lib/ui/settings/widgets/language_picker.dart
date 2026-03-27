import 'package:flutter/material.dart';

class LanguagePicker extends StatelessWidget {
  final Locale? selectedLocale;
  final void Function(Locale?) onChanged;
  final List<Locale> supportedLocales;

  /// Allows the user to select a language.
  const LanguagePicker({
    super.key,
    required this.selectedLocale,
    required this.onChanged,
    required this.supportedLocales,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButton<Locale>(
      value: selectedLocale,
      isExpanded: true,
      hint: const Text('Select Language'),
      items: supportedLocales.map((locale) {
        // you might want to customize this per language
        final langName = locale.languageCode.toUpperCase();
        return DropdownMenuItem<Locale>(
          value: locale,
          child: Text(langName),
        );
      }).toList(),
      onChanged: onChanged,
    );
  }
}
