import 'package:flutter/material.dart';

import 'package:personal_hub_app/domain/entities/food/recipe_entity.dart';

/// Screen for editing recipe durations (prep, cook, rest). Returns updated [DurationEntity] on save.
class CookingTimesEditorScreen extends StatefulWidget {
  /// Initial duration values to prepopulate the fields.
  final DurationEntity initialDuration;

  const CookingTimesEditorScreen({
    super.key,
    required this.initialDuration,
  });

  @override
  State<CookingTimesEditorScreen> createState() => _CookingTimesEditorScreenState();
}

class _CookingTimesEditorScreenState extends State<CookingTimesEditorScreen> {
  late int? _prepTimeMinutes;
  late int? _cookTimeMinutes;
  late int? _restTimeMinutes;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _prepTimeMinutes = widget.initialDuration.prepTimeMinutes;
    _cookTimeMinutes = widget.initialDuration.cookTimeMinutes;
    _restTimeMinutes = widget.initialDuration.restTimeMinutes;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edit Recipe Times')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                initialValue: (_prepTimeMinutes ?? '').toString(),
                decoration: const InputDecoration(labelText: 'Prep Time (min)'),
                keyboardType: TextInputType.number,
                validator: (v) {
                  if (v == null || v.isEmpty) return null; // allow null
                  final value = int.tryParse(v);
                  if (value == null || value < 0) return 'Enter 0 or more';
                  return null;
                },
                onSaved: (v) => _prepTimeMinutes = (v == null || v.isEmpty) ? null : int.parse(v),
              ),
              const SizedBox(height: 16),
              TextFormField(
                initialValue: (_cookTimeMinutes ?? '').toString(),
                decoration: const InputDecoration(labelText: 'Cooking Time (min)'),
                keyboardType: TextInputType.number,
                validator: (v) {
                  if (v == null || v.isEmpty) return null;
                  final value = int.tryParse(v);
                  if (value == null || value < 0) return 'Enter 0 or more';
                  return null;
                },
                onSaved: (v) => _cookTimeMinutes = (v == null || v.isEmpty) ? null : int.parse(v),
              ),
              const SizedBox(height: 16),
              TextFormField(
                initialValue: (_restTimeMinutes ?? '').toString(),
                decoration: const InputDecoration(labelText: 'Rest Time (min)'),
                keyboardType: TextInputType.number,
                validator: (v) {
                  if (v == null || v.isEmpty) return null;
                  final value = int.tryParse(v);
                  if (value == null || value < 0) return 'Enter 0 or more';
                  return null;
                },
                onSaved: (v) => _restTimeMinutes = (v == null || v.isEmpty) ? null : int.parse(v),
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: () {
                  if (!_formKey.currentState!.validate()) return;
                  _formKey.currentState!.save();
                  Navigator.of(context).pop(
                    DurationEntity(
                      prepTimeMinutes: _prepTimeMinutes,
                      cookTimeMinutes: _cookTimeMinutes,
                      restTimeMinutes: _restTimeMinutes,
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

