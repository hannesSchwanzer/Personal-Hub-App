import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// A reusable input widget for entering quantity with numeric validation.
///
/// Displays a label and unit abbreviation, and formats to only allow valid decimal numbers.
///
/// Example usage:
/// ```dart
/// QuantityInputWidget(
///   controller: myController,
///   unitAbbreviation: 'g',
///   isValid: isValid,
///   onChanged: (str) => ..., // validate
/// )
/// ```
class QuantityInputWidget extends StatelessWidget {
  final TextEditingController controller;
  final String? unitAbbreviation;
  final bool isValid;
  final void Function(String) onChanged;

  const QuantityInputWidget({
    Key? key,
    required this.controller,
    required this.unitAbbreviation,
    required this.isValid,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: controller,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            decoration: InputDecoration(
              labelText: 'Quantity',
              errorText: isValid ? null : 'Enter a valid number',
            ),
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'^[0-9]*\.?[0-9]*')),
            ],
            onChanged: onChanged,
          ),
        ),
        const SizedBox(width: 8),
        Text(
          unitAbbreviation ?? 'unit',
          style: const TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}

