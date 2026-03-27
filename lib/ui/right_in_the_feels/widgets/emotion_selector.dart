import 'package:flutter/material.dart';
import 'package:personal_hub_app/domain/models/emotion.dart';

/// Reusable hierarchical emotion selector widget.
///
/// Features:
/// - 1-3 level deep emotion selection
/// - Exposes callbacks per level
/// - Shows selected path
/// - Designed for composition in forms or trackers
///
/// Example usage:
/// ```dart
/// EmotionSelector(
///   rootEmotions: myEmotionList,
///   onSelectionChanged: (level1, level2, level3) { ... },
/// )
/// ```
class EmotionSelector extends StatefulWidget {
  final List<Emotion> rootEmotions;
  final void Function(
    Emotion? selectedLevel1,
    Emotion? selectedLevel2,
    Emotion? selectedLevel3,
  )? onSelectionChanged;
  final String? emotionPathLabel; // Optional label for selected path

  const EmotionSelector({
    super.key,
    required this.rootEmotions,
    this.onSelectionChanged,
    this.emotionPathLabel,
  });

  @override
  State<EmotionSelector> createState() => _EmotionSelectorState();
}

class _EmotionSelectorState extends State<EmotionSelector> {
  Emotion? _selectedLevel1;
  Emotion? _selectedLevel2;
  Emotion? _selectedLevel3;

  void _selectLevel1(Emotion emotion) {
    setState(() {
      if (_selectedLevel1 == emotion) {
        _selectedLevel1 = null;
        _selectedLevel2 = null;
        _selectedLevel3 = null;
      } else {
        _selectedLevel1 = emotion;
        _selectedLevel2 = null;
        _selectedLevel3 = null;
      }
      widget.onSelectionChanged?.call(_selectedLevel1, _selectedLevel2, _selectedLevel3);
    });
  }

  void _selectLevel2(Emotion emotion) {
    setState(() {
      if (_selectedLevel2 == emotion) {
        _selectedLevel2 = null;
        _selectedLevel3 = null;
      } else {
        _selectedLevel2 = emotion;
        _selectedLevel3 = null;
      }
      widget.onSelectionChanged?.call(_selectedLevel1, _selectedLevel2, _selectedLevel3);
    });
  }

  void _selectLevel3(Emotion emotion) {
    setState(() {
      if (_selectedLevel3 == emotion) {
        _selectedLevel3 = null;
      } else {
        _selectedLevel3 = emotion;
      }
      widget.onSelectionChanged?.call(_selectedLevel1, _selectedLevel2, _selectedLevel3);
    });
  }

  String _getSelectedEmotionPath() {
    final parts = <String>[];
    if (_selectedLevel1 != null) parts.add(_selectedLevel1!.getName());
    if (_selectedLevel2 != null) parts.add(_selectedLevel2!.getName());
    if (_selectedLevel3 != null) parts.add(_selectedLevel3!.getName());
    return parts.join(' → ');
  }

  @override
  Widget build(BuildContext context) {
    final showPath = _getSelectedEmotionPath().isNotEmpty && (widget.emotionPathLabel != null || true);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildEmotionRow(
          emotions: widget.rootEmotions,
          selectedEmotion: _selectedLevel1,
          onSelect: _selectLevel1,
          level: 1,
        ),
        if (_selectedLevel1 != null && _selectedLevel1!.children.isNotEmpty)
          _buildAnimatedEmotionLevel(
            emotions: _selectedLevel1!.children,
            selectedEmotion: _selectedLevel2,
            onSelect: _selectLevel2,
            level: 2,
          ),
        if (_selectedLevel2 != null && _selectedLevel2!.children.isNotEmpty)
          _buildAnimatedEmotionLevel(
            emotions: _selectedLevel2!.children,
            selectedEmotion: _selectedLevel3,
            onSelect: _selectLevel3,
            level: 3,
          ),
        if (showPath) ...[
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primaryContainer,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                const Icon(Icons.check_circle_outline, size: 20),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    _getSelectedEmotionPath(),
                    style: const TextStyle(fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildAnimatedEmotionLevel({
    required List<Emotion> emotions,
    required Emotion? selectedEmotion,
    required Function(Emotion) onSelect,
    required int level,
  }) {
    return AnimatedSize(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOut,
      child: Padding(
        padding: EdgeInsets.only(left: (level-1)*16.0, top: 12),
        child: _buildEmotionRow(
          emotions: emotions,
          selectedEmotion: selectedEmotion,
          onSelect: onSelect,
          level: level,
        ),
      ),
    );
  }

  Widget _buildEmotionRow({
    required List<Emotion> emotions,
    required Emotion? selectedEmotion,
    required Function(Emotion) onSelect,
    required int level,
  }) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: emotions.map((emotion) {
        final isSelected = selectedEmotion == emotion;
        return _EmotionChip(
          emotion: emotion,
          isSelected: isSelected,
          onTap: () => onSelect(emotion),
          level: level,
        );
      }).toList(),
    );
  }
}

/// Private, stateless emotion chip used by the selector.
class _EmotionChip extends StatelessWidget {
  final Emotion emotion;
  final bool isSelected;
  final VoidCallback onTap;
  final int level;

  const _EmotionChip({
    required this.emotion,
    required this.isSelected,
    required this.onTap,
    required this.level,
  });

  @override
  Widget build(BuildContext context) {
    final double fontSize = 14.0 - (level - 1);
    final double paddingH = 16.0 - (level - 1) * 2.0;
    final double paddingV = 10.0 - (level - 1) * 1.0;
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          padding: EdgeInsets.symmetric(horizontal: paddingH, vertical: paddingV),
          decoration: BoxDecoration(
            color: isSelected
                ? emotion.color
                : emotion.color.withAlpha((0.3*255).round()),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: isSelected
                  ? emotion.color.withAlpha((0.8*255).round())
                  : emotion.color.withAlpha((0.5*255).round()),
              width: isSelected ? 2 : 1,
            ),
            boxShadow: isSelected
                ? [
                    BoxShadow(
                      color: emotion.color.withAlpha((0.4*255).round()),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ]
                : null,
          ),
          child: Text(
            emotion.getName(),
            style: TextStyle(
              fontSize: fontSize,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
              color: isSelected ? Colors.black87 : Colors.black54,
            ),
          ),
        ),
      ),
    );
  }
}

