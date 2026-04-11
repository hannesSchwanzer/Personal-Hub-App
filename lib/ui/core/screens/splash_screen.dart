import 'package:flutter/material.dart';

/// A simple splash screen shown while the app is loading or bootstrapping.
class SplashScreen extends StatelessWidget {
  final String? statusMessage;

  const SplashScreen({super.key, this.statusMessage});

  @override
  Widget build(BuildContext context) {
    // You can replace this with your own branding or animation if desired
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const CircularProgressIndicator(),
            if (statusMessage != null) ...[
              const SizedBox(height: 24),
              Text(
                statusMessage!,
                style: Theme.of(context).textTheme.bodyLarge,
                textAlign: TextAlign.center,
              ),
            ],
          ],
        ),
      ),
    );
  }
}

