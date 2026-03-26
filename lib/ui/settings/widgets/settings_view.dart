import 'package:flutter/material.dart';

/// SettingsView allows users to change app-wide preferences such as language.
class SettingsView extends StatelessWidget {
    /// Creates a settings view for user preferences.
    const SettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'No additional settings available yet.',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}

