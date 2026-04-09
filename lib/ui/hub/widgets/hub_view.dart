import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:personal_hub_app/l10n/app_localizations.dart';
import 'package:personal_hub_app/ui/cooking/widgets/cooking_view.dart';
import 'package:personal_hub_app/ui/gym_tracker/widgets/gym_view.dart';
import 'package:personal_hub_app/ui/meditation/screens/audio_test.dart';
import 'package:personal_hub_app/ui/meditation/widgets/meditation_view.dart';
import 'package:personal_hub_app/ui/right_in_the_feels/screens/right_in_the_feels_view.dart';
import 'package:personal_hub_app/ui/core/widgets/hub_feature_card.dart';
import 'package:personal_hub_app/ui/settings/widgets/settings_view.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:file_picker/file_picker.dart';
import 'package:personal_hub_app/utils/providers.dart';

class HubView extends ConsumerWidget {
  const HubView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final backupService = ref.read(backupServiceProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.personalHub),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu),
            tooltip: l10n.settings, // Menu
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: Text(
                l10n.personalHub,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
            ListTile(
              leading: const Icon(Icons.file_upload),
              title: Text(l10n.exportData),
              onTap: () async {
                Navigator.pop(context);
                try {
                  // 1. Obtain the backup bytes from your backup service (adjust method name as needed)
                  final Uint8List backupBytes = await backupService
                      .exportBackupBytes();

                  // 2. Let the user save/share this file
                  final result = await FilePicker.platform.saveFile(
                    dialogTitle: l10n.exportData,
                    fileName: "personal_hub_backup.json",
                    bytes: backupBytes,
                  );

                  if (result != null) {
                    if (context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(l10n.exportSuccess)),
                      );
                    }
                  } else {
                    if (context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(l10n.exportCancelled)),
                      );
                    }
                  }
                } catch (e) {
                  if (context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("${l10n.exportFailed}: $e")),
                    );
                  }
                }
              },
            ),
            ListTile(
              leading: const Icon(Icons.file_download),
              title: Text(l10n.importData),
              onTap: () async {
                Navigator.pop(context);
                final result = await FilePicker.platform.pickFiles(
                  dialogTitle: l10n.importData,
                  type: FileType.custom,
                  allowedExtensions: ['json'],
                );
                final filePath = result?.files.single.path;
                if (filePath != null) {
                  try {
                    await backupService.importBackup(filePath);
                    if (context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(l10n.importSuccess)),
                      );
                    }
                  } catch (e) {
                    if (context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("${l10n.importFailed}: $e")),
                      );
                    }
                    rethrow;
                  }
                } else {
                  if (context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(l10n.importCancelled)),
                    );
                  }
                }
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.settings),
              title: Text(l10n.settings),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SettingsView()),
                );
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            HubFeatureCard(
              title: l10n.hubFeatureGymTracking,
              description: l10n.hubFeatureGymTrackingDesc,
              icon: Icons.fitness_center,
              onTap: () => _navigateTo(context, const GymView()),
            ),
            const SizedBox(height: 16),
            HubFeatureCard(
              title: l10n.hubFeatureMeditation,
              description: l10n.hubFeatureMeditationDesc,
              icon: Icons.self_improvement,
              onTap: () => _navigateTo(context, const AudioTestPage()),
            ),
            const SizedBox(height: 16),
            HubFeatureCard(
              title: l10n.hubFeatureFeels,
              description: l10n.hubFeatureFeelsDesc,
              icon: Icons.book,
              onTap: () => _navigateTo(context, const RightInTheFeelsView()),
            ),
            const SizedBox(height: 16),
            HubFeatureCard(
              title: l10n.hubFeatureCooking,
              description: l10n.hubFeatureCookingDesc,
              icon: Icons.restaurant,
              onTap: () => _navigateTo(context, const CookingView()),
            ),
          ],
        ),
      ),
    );
  }

  void _navigateTo(BuildContext context, Widget page) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => page));
  }
}
