import 'package:flutter/material.dart';
import 'package:personal_hub_app/domain/entities/cooking/recipe_entity.dart';

/// Screen for editing preparation time and cooking time. Returns updated values on save.
class CookingTimesEditorScreen extends StatefulWidget {
  /// Initial values to prepopulate the fields.
  final int preparationTimeMinutes;
  final int cookingTimeMinutes;

  const CookingTimesEditorScreen({
    super.key,
    required this.preparationTimeMinutes,
    required this.cookingTimeMinutes,
  });

  @override
  State<CookingTimesEditorScreen> createState() => _CookingTimesEditorScreenState();
}

class _CookingTimesEditorScreenState extends State<CookingTimesEditorScreen> {
  late int _preparationTimeMinutes;
  late int _cookingTimeMinutes;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _preparationTimeMinutes = widget.preparationTimeMinutes;
    _cookingTimeMinutes = widget.cookingTimeMinutes;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edit Cooking Times')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                initialValue: _preparationTimeMinutes.toString(),
                decoration: const InputDecoration(labelText: 'Prep Time (min)'),
                keyboardType: TextInputType.number,
                validator: (v) {
                  final value = int.tryParse(v ?? '');
                  if (value == null || value < 0) return 'Enter 0 or more';
                  return null;
                },
                onSaved: (v) => _preparationTimeMinutes = int.parse(v ?? '0'),
              ),
              const SizedBox(height: 16),
              TextFormField(
                initialValue: _cookingTimeMinutes.toString(),
                decoration: const InputDecoration(labelText: 'Cooking Time (min)'),
                keyboardType: TextInputType.number,
                validator: (v) {
                  final value = int.tryParse(v ?? '');
                  if (value == null || value < 0) return 'Enter 0 or more';
                  return null;
                },
                onSaved: (v) => _cookingTimeMinutes = int.parse(v ?? '0'),
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: () {
                  if (!_formKey.currentState!.validate()) return;
                  _formKey.currentState!.save();
                  Navigator.of(context).pop({
                    'preparationTimeMinutes': _preparationTimeMinutes,
                    'cookingTimeMinutes': _cookingTimeMinutes,
                  });
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

