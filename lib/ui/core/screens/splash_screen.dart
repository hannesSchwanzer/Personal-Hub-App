import 'package:flutter/material.dart';

/// A simple splash screen shown while the app is loading or bootstrapping.
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // You can replace this with your own branding or animation if desired
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

