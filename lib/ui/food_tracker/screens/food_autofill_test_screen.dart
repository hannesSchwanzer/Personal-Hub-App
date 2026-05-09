import 'package:flutter/material.dart';
import 'package:personal_hub_app/ui/cooking/widgets/food_autofill_widget.dart';
import 'package:personal_hub_app/domain/entities/food/food_entities.dart';

/// A simple screen to test the FoodAutofillWidget.
class FoodAutofillTestScreen extends StatelessWidget {
  const FoodAutofillTestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Food Autofill Test'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FoodAutofillWidget(
              onSelected: (FoodAutoFillEntity? food, String input) {
                // Just print values for testing for now
                debugPrint('Selected: \\${food?.name ?? "none"} | Input: $input');
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Selected: \\${food?.name ?? "none"} | Input: $input'),
                  ),
                );
              },
            ),
            const SizedBox(height: 24),
            const Text('Type to search food and select a suggestion.'),
          ],
        ),
      ),
    );
  }
}

