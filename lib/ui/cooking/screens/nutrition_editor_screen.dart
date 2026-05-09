import 'package:flutter/material.dart';
import 'package:personal_hub_app/domain/entities/food/nutrition_entity.dart';

/// Screen for editing nutrition information. Returns updated NutritionInfoEntity on save.
class NutritionEditorScreen extends StatefulWidget {
  /// The initial nutrition info to be edited.
  final NutritionEntity initial;

  const NutritionEditorScreen({
    Key? key,
    required this.initial,
  }) : super(key: key);

  @override
  State<NutritionEditorScreen> createState() => _NutritionEditorScreenState();
}

class _NutritionEditorScreenState extends State<NutritionEditorScreen> {
  late double? calories;
  late double? proteinGrams;
  late double? carbohydratesGrams;
  late double? fatGrams;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    calories = widget.initial.energyKcal;
    proteinGrams = widget.initial.proteins;
    carbohydratesGrams = widget.initial.carbohydrates;
    fatGrams = widget.initial.fat;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edit Nutrition Info')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                initialValue: calories?.toString() ?? '',
                decoration: const InputDecoration(labelText: 'Calories'),
                keyboardType: TextInputType.number,
                validator: (v) {
                  final value = int.tryParse(v ?? '');
                  if (value == null || value < 0) return 'Enter 0 or more';
                  return null;
                },
                onSaved: (v) => calories = double.tryParse(v ?? ''),
              ),
              const SizedBox(height: 16),
              TextFormField(
                initialValue: proteinGrams?.toString() ?? '',
                decoration: const InputDecoration(labelText: 'Protein (g)'),
                keyboardType: TextInputType.number,
                validator: (v) {
                  final value = double.tryParse(v ?? '');
                  if (value == null || value < 0) return 'Enter 0 or more';
                  return null;
                },
                onSaved: (v) => proteinGrams = double.tryParse(v ?? ''),
              ),
              const SizedBox(height: 16),
              TextFormField(
                initialValue: carbohydratesGrams?.toString() ?? '',
                decoration: const InputDecoration(labelText: 'Carbs (g)'),
                keyboardType: TextInputType.number,
                validator: (v) {
                  final value = double.tryParse(v ?? '');
                  if (value == null || value < 0) return 'Enter 0 or more';
                  return null;
                },
                onSaved: (v) => carbohydratesGrams = double.tryParse(v ?? ''),
              ),
              const SizedBox(height: 16),
              TextFormField(
                initialValue: fatGrams?.toString() ?? '',
                decoration: const InputDecoration(labelText: 'Fat (g)'),
                keyboardType: TextInputType.number,
                validator: (v) {
                  final value = double.tryParse(v ?? '');
                  if (value == null || value < 0) return 'Enter 0 or more';
                  return null;
                },
                onSaved: (v) => fatGrams = double.tryParse(v ?? ''),
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: () {
                  if (!_formKey.currentState!.validate()) return;
                  _formKey.currentState!.save();
                  Navigator.of(context).pop(
                    NutritionEntity(
                      energyKcal: calories,
                      proteins: proteinGrams,
                      carbohydrates: carbohydratesGrams,
                      fat: fatGrams,
                    ),
                  );
                },
                child: const Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

