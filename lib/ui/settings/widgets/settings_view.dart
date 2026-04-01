import 'package:flutter/material.dart';
import 'package:personal_hub_app/l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:personal_hub_app/utils/providers.dart';
import 'package:personal_hub_app/ui/settings/widgets/language_picker.dart';

class SettingsView extends ConsumerWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final supportedLocales = AppLocalizations.supportedLocales;
    final settings = ref.watch(settingsNotifierProvider);
    final notifier = ref.read(settingsNotifierProvider.notifier);

    final selectedLocale = supportedLocales
        .where((l) => l == settings.locale)
        .cast<Locale?>()
        .firstWhere((l) => true, orElse: () => null);

    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.settings)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(AppLocalizations.of(context)!.languagePickerTitle),
            const SizedBox(height: 8),

            // Ensure the selectedLocale is exactly one of the supportedLocales
            LanguagePicker(
              selectedLocale: selectedLocale,
              supportedLocales: supportedLocales,
              onChanged: (Locale? newLocale) {
                notifier.setLocale(newLocale);
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
