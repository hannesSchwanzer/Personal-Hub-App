import 'package:flutter/material.dart';
import 'package:personal_hub_app/l10n/app_localizations.dart';
import 'package:personal_hub_app/main.dart';
import 'package:personal_hub_app/ui/settings/widgets/language_picker.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final supportedLocales = AppLocalizations.supportedLocales;
    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.settings)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(AppLocalizations.of(context)!.languagePickerTitle),
            const SizedBox(height: 8),
            ValueListenableBuilder<Locale?>(
              valueListenable: localeNotifier,
              builder: (context, locale, _) {
                return LanguagePicker(
                  selectedLocale: locale,
                  supportedLocales: supportedLocales,
                  onChanged: (Locale? newLocale) {
                    localeNotifier.value = newLocale;
                  },
                );
              },
            ),
            const Divider(height: 32),
            Text(AppLocalizations.of(context)!.noAdditionalSettings),
          ],
        ),
      ),
    );
  }
}

