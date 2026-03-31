import 'package:flutter/material.dart';

/// Placeholder view for the Emotions Regulator feature.
class EmotionsRegulatorView extends StatelessWidget {
  const EmotionsRegulatorView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Emotions Regulator'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.tune, size: 64),
            SizedBox(height: 16),
            Text(
              'Emotions Regulator',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text('Coming soon...'),
          ],
        ),
      ),
    );
  }
}

