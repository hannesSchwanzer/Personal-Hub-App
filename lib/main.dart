import 'package:flutter/material.dart';
import 'package:personal_hub_app/ui/hub/widgets/hub_view.dart';

void main() {
  runApp(const PersonalHubApp());
}

class PersonalHubApp extends StatelessWidget {
  const PersonalHubApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Hub',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HubView(),
    );
  }
}
