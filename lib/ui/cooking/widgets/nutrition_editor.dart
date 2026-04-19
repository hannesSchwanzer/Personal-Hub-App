import 'package:flutter/material.dart';
import 'package:personal_hub_app/domain/entities/cooking/recipe_entity.dart';

/// Widget for editing recipe nutrition info.
class NutritionEditor extends StatefulWidget {
  final NutritionInfoEntity initial;
  final ValueChanged<NutritionInfoEntity> onChanged;

  const NutritionEditor({
    required this.initial,
    required this.onChanged,
    Key? key,
  }) : super(key: key);

  @override
  State<NutritionEditor> createState() => _NutritionEditorState();
}

class _NutritionEditorState extends State<NutritionEditor> {
  late NutritionInfoEntity _n;

  @override
  void initState() {
    super.initState();
    _n = widget.initial;
  }

  void _set(Map<String, dynamic> update) {
    setState(() {
      _n = _n.copyWith(
        calories: update['c'] ?? _n.calories,
        carbohydratesGrams: update['carb'] ?? _n.carbohydratesGrams,
        proteinGrams: update['p'] ?? _n.proteinGrams,
        fatGrams: update['f'] ?? _n.fatGrams,
      );
      widget.onChanged(_n);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Nutrition', style: TextStyle(fontWeight: FontWeight.bold)),
        Row(
          children: [
            Expanded(
              child: TextFormField(
                initialValue: _n.calories?.toString() ?? '',
                decoration: const InputDecoration(labelText: 'Calories'),
                keyboardType: TextInputType.number,
                onChanged: (v) => _set({'c': int.tryParse(v)}),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: TextFormField(
                initialValue: _n.carbohydratesGrams?.toString() ?? '',
                decoration: const InputDecoration(labelText: 'Carbs (g)'),
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
                onChanged: (v) => _set({'carb': double.tryParse(v)}),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: TextFormField(
                initialValue: _n.proteinGrams?.toString() ?? '',
                decoration: const InputDecoration(labelText: 'Protein (g)'),
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
                onChanged: (v) => _set({'p': double.tryParse(v)}),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: TextFormField(
                initialValue: _n.fatGrams?.toString() ?? '',
                decoration: const InputDecoration(labelText: 'Fat (g)'),
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
                onChanged: (v) => _set({'f': double.tryParse(v)}),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

