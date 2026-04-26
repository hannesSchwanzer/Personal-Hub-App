import 'package:flutter/material.dart';

enum LanguageOption { english, german, custom, auto }

class LanguageSelector extends StatefulWidget {
  final String label;
  final void Function(String? language) onChanged;

  const LanguageSelector({
    super.key,
    required this.label,
    required this.onChanged,
  });

  @override
  State<LanguageSelector> createState() => _LanguageSelectorState();
}

class _LanguageSelectorState extends State<LanguageSelector> {
  LanguageOption _selected = LanguageOption.auto;
  final TextEditingController _customController = TextEditingController();

  void _emitValue() {
    switch (_selected) {
      case LanguageOption.english:
        widget.onChanged('english');
        break;
      case LanguageOption.german:
        widget.onChanged('german');
        break;
      case LanguageOption.custom:
        widget.onChanged(_customController.text.trim().isEmpty
            ? null
            : _customController.text.trim());
        break;
      case LanguageOption.auto:
        widget.onChanged(null);
        break;
    }
  }

  @override
  void initState() {
    super.initState();
    _emitValue();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.label, style: const TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),

        DropdownButton<LanguageOption>(
          value: _selected,
          isExpanded: true,
          items: const [
            DropdownMenuItem(
              value: LanguageOption.auto,
              child: Text('Auto-detect'),
            ),
            DropdownMenuItem(
              value: LanguageOption.english,
              child: Text('English'),
            ),
            DropdownMenuItem(
              value: LanguageOption.german,
              child: Text('Deutsch'),
            ),
            DropdownMenuItem(
              value: LanguageOption.custom,
              child: Text('Custom'),
            ),
          ],
          onChanged: (value) {
            if (value == null) return;
            setState(() {
              _selected = value;
            });
            _emitValue();
          },
        ),

        if (_selected == LanguageOption.custom)
          TextField(
            controller: _customController,
            decoration: const InputDecoration(
              labelText: 'Enter language',
            ),
            onChanged: (_) => _emitValue(),
          ),
      ],
    );
  }
}
