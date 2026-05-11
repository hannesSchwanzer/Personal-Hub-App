import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:personal_hub_app/domain/entities/food/nutrition_entity.dart';

/// Widget for editing recipe nutrition info.
class NutritionEditor extends StatefulWidget {
  final NutritionEntity initial;
  final ValueChanged<NutritionEntity> onChanged;

  const NutritionEditor({
    required this.initial,
    required this.onChanged,
    super.key,
  });

  @override
  State<NutritionEditor> createState() => _NutritionEditorState();
}

class _NutritionEditorState extends State<NutritionEditor> {
  late NutritionEntity _n;

  @override
  void initState() {
    super.initState();
    _n = widget.initial;
  }

  void _set(Map<String, dynamic> update) {
    setState(() {
      _n = _n.copyWith(
        energyKcal: update['c'] ?? _n.energyKcal,
        carbohydrates: update['carb'] ?? _n.carbohydrates,
        proteins: update['p'] ?? _n.proteins,
        fat: update['f'] ?? _n.fat,
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
                initialValue: _n.energyKcal?.toString() ?? '',
                decoration: const InputDecoration(labelText: 'Calories (kcal)'),
                keyboardType: TextInputType.number,
                onChanged: (v) => _set({'c': double.tryParse(v)}),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'^[0-9]*\.?[0-9]*')),
                ],
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: TextFormField(
                initialValue: _n.carbohydrates?.toString() ?? '',
                decoration: const InputDecoration(labelText: 'Carbs (g)'),
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
                onChanged: (v) => _set({'carb': double.tryParse(v)}),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'^[0-9]*\.?[0-9]*')),
                ],
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: TextFormField(
                initialValue: _n.proteins?.toString() ?? '',
                decoration: const InputDecoration(labelText: 'Protein (g)'),
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
                onChanged: (v) => _set({'p': double.tryParse(v)}),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'^[0-9]*\.?[0-9]*')),
                ],
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: TextFormField(
                initialValue: _n.fat?.toString() ?? '',
                decoration: const InputDecoration(labelText: 'Fat (g)'),
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
                onChanged: (v) => _set({'f': double.tryParse(v)}),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'^[0-9]*\.?[0-9]*')),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

