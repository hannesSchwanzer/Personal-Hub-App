import 'package:flutter/material.dart';
import 'package:personal_hub_app/domain/models/emotion.dart';
import 'package:personal_hub_app/l10n/app_localizations.dart';

extension EmotionLocalization on Emotion {
  /// Returns the localized name for this emotion using the provided [context].
  /// If the emotion is not found, falls back to the key.
  String localizedName(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    switch (nameKey) {
      // Happy
      case 'emotion_happy':
        return l10n.emotion_happy;
      case 'emotion_happy_optimistic':
        return l10n.emotion_happy_optimistic;
      case 'emotion_happy_optimistic_inspired':
        return l10n.emotion_happy_optimistic_inspired;
      case 'emotion_happy_optimistic_hopeful':
        return l10n.emotion_happy_optimistic_hopeful;
      case 'emotion_happy_trusting':
        return l10n.emotion_happy_trusting;
      case 'emotion_happy_trusting_intimate':
        return l10n.emotion_happy_trusting_intimate;
      case 'emotion_happy_trusting_sensitive':
        return l10n.emotion_happy_trusting_sensitive;
      case 'emotion_happy_peaceful':
        return l10n.emotion_happy_peaceful;
      case 'emotion_happy_peaceful_thankful':
        return l10n.emotion_happy_peaceful_thankful;
      case 'emotion_happy_peaceful_loving':
        return l10n.emotion_happy_peaceful_loving;
      case 'emotion_happy_powerful':
        return l10n.emotion_happy_powerful;
      case 'emotion_happy_powerful_creative':
        return l10n.emotion_happy_powerful_creative;
      case 'emotion_happy_powerful_courageous':
        return l10n.emotion_happy_powerful_courageous;
      case 'emotion_happy_accepted':
        return l10n.emotion_happy_accepted;
      case 'emotion_happy_accepted_valued':
        return l10n.emotion_happy_accepted_valued;
      case 'emotion_happy_accepted_respected':
        return l10n.emotion_happy_accepted_respected;
      case 'emotion_happy_proud':
        return l10n.emotion_happy_proud;
      case 'emotion_happy_proud_confident':
        return l10n.emotion_happy_proud_confident;
      case 'emotion_happy_proud_successful':
        return l10n.emotion_happy_proud_successful;
      case 'emotion_happy_interested':
        return l10n.emotion_happy_interested;
      case 'emotion_happy_interested_inquisitive':
        return l10n.emotion_happy_interested_inquisitive;
      case 'emotion_happy_interested_curious':
        return l10n.emotion_happy_interested_curious;
      case 'emotion_happy_content':
        return l10n.emotion_happy_content;
      case 'emotion_happy_content_joyful':
        return l10n.emotion_happy_content_joyful;
      case 'emotion_happy_content_free':
        return l10n.emotion_happy_content_free;
      case 'emotion_happy_playful':
        return l10n.emotion_happy_playful;
      case 'emotion_happy_playful_cheeky':
        return l10n.emotion_happy_playful_cheeky;
      case 'emotion_happy_playful_aroused':
        return l10n.emotion_happy_playful_aroused;

      // Angry
      case 'emotion_angry':
        return l10n.emotion_angry;
      case 'emotion_angry_critical':
        return l10n.emotion_angry_critical;
      case 'emotion_angry_critical_dismissive':
        return l10n.emotion_angry_critical_dismissive;
      case 'emotion_angry_critical_skeptical':
        return l10n.emotion_angry_critical_skeptical;
      case 'emotion_angry_distant':
        return l10n.emotion_angry_distant;
      case 'emotion_angry_distant_numb':
        return l10n.emotion_angry_distant_numb;
      case 'emotion_angry_distant_withdrawn':
        return l10n.emotion_angry_distant_withdrawn;
      case 'emotion_angry_frustrated':
        return l10n.emotion_angry_frustrated;
      case 'emotion_angry_frustrated_annoyed':
        return l10n.emotion_angry_frustrated_annoyed;
      case 'emotion_angry_frustrated_infuriated':
        return l10n.emotion_angry_frustrated_infuriated;
      case 'emotion_angry_aggressive':
        return l10n.emotion_angry_aggressive;
      case 'emotion_angry_aggressive_hostile':
        return l10n.emotion_angry_aggressive_hostile;
      case 'emotion_angry_aggressive_provoked':
        return l10n.emotion_angry_aggressive_provoked;
      case 'emotion_angry_mad':
        return l10n.emotion_angry_mad;
      case 'emotion_angry_mad_jealous':
        return l10n.emotion_angry_mad_jealous;
      case 'emotion_angry_mad_furious':
        return l10n.emotion_angry_mad_furious;
      case 'emotion_angry_bitter':
        return l10n.emotion_angry_bitter;
      case 'emotion_angry_bitter_violated':
        return l10n.emotion_angry_bitter_violated;
      case 'emotion_angry_bitter_indignant':
        return l10n.emotion_angry_bitter_indignant;
      case 'emotion_angry_humiliated':
        return l10n.emotion_angry_humiliated;
      case 'emotion_angry_humiliated_disrespected':
        return l10n.emotion_angry_humiliated_disrespected;
      case 'emotion_angry_humiliated_ridiculed':
        return l10n.emotion_angry_humiliated_ridiculed;
      case 'emotion_angry_let_down':
        return l10n.emotion_angry_let_down;
      case 'emotion_angry_let_down_resentful':
        return l10n.emotion_angry_let_down_resentful;
      case 'emotion_angry_let_down_betrayed':
        return l10n.emotion_angry_let_down_betrayed;

      // Sad
      case 'emotion_sad':
        return l10n.emotion_sad;
      case 'emotion_sad_hurt':
        return l10n.emotion_sad_hurt;
      case 'emotion_sad_hurt_embarrassed':
        return l10n.emotion_sad_hurt_embarrassed;
      case 'emotion_sad_hurt_disappointed':
        return l10n.emotion_sad_hurt_disappointed;
      case 'emotion_sad_depressed':
        return l10n.emotion_sad_depressed;
      case 'emotion_sad_depressed_inferior':
        return l10n.emotion_sad_depressed_inferior;
      case 'emotion_sad_depressed_empty':
        return l10n.emotion_sad_depressed_empty;
      case 'emotion_sad_guilty':
        return l10n.emotion_sad_guilty;
      case 'emotion_sad_guilty_remorseful':
        return l10n.emotion_sad_guilty_remorseful;
      case 'emotion_sad_guilty_ashamed':
        return l10n.emotion_sad_guilty_ashamed;
      case 'emotion_sad_despair':
        return l10n.emotion_sad_despair;
      case 'emotion_sad_despair_powerless':
        return l10n.emotion_sad_despair_powerless;
      case 'emotion_sad_despair_grief':
        return l10n.emotion_sad_despair_grief;
      case 'emotion_sad_vulnerable':
        return l10n.emotion_sad_vulnerable;
      case 'emotion_sad_vulnerable_fragile':
        return l10n.emotion_sad_vulnerable_fragile;
      case 'emotion_sad_vulnerable_victimized':
        return l10n.emotion_sad_vulnerable_victimized;
      case 'emotion_sad_lonely':
        return l10n.emotion_sad_lonely;
      case 'emotion_sad_lonely_abandoned':
        return l10n.emotion_sad_lonely_abandoned;
      case 'emotion_sad_lonely_isolated':
        return l10n.emotion_sad_lonely_isolated;

      // Fearful
      case 'emotion_fearful':
        return l10n.emotion_fearful;
      case 'emotion_fearful_scared':
        return l10n.emotion_fearful_scared;
      case 'emotion_fearful_scared_helpless':
        return l10n.emotion_fearful_scared_helpless;
      case 'emotion_fearful_scared_frightened':
        return l10n.emotion_fearful_scared_frightened;
      case 'emotion_fearful_anxious':
        return l10n.emotion_fearful_anxious;
      case 'emotion_fearful_anxious_overwhelmed':
        return l10n.emotion_fearful_anxious_overwhelmed;
      case 'emotion_fearful_anxious_worried':
        return l10n.emotion_fearful_anxious_worried;
      case 'emotion_fearful_insecure':
        return l10n.emotion_fearful_insecure;
      case 'emotion_fearful_insecure_inadequate':
        return l10n.emotion_fearful_insecure_inadequate;
      case 'emotion_fearful_insecure_inferior':
        return l10n.emotion_fearful_insecure_inferior;
      case 'emotion_fearful_weak':
        return l10n.emotion_fearful_weak;
      case 'emotion_fearful_weak_worthless':
        return l10n.emotion_fearful_weak_worthless;
      case 'emotion_fearful_weak_insignificant':
        return l10n.emotion_fearful_weak_insignificant;
      case 'emotion_fearful_rejected':
        return l10n.emotion_fearful_rejected;
      case 'emotion_fearful_rejected_excluded':
        return l10n.emotion_fearful_rejected_excluded;
      case 'emotion_fearful_rejected_persecuted':
        return l10n.emotion_fearful_rejected_persecuted;
      case 'emotion_fearful_threatened':
        return l10n.emotion_fearful_threatened;
      case 'emotion_fearful_threatened_nervous':
        return l10n.emotion_fearful_threatened_nervous;
      case 'emotion_fearful_threatened_exposed':
        return l10n.emotion_fearful_threatened_exposed;

      // Surprised
      case 'emotion_surprised':
        return l10n.emotion_surprised;
      case 'emotion_surprised_startled':
        return l10n.emotion_surprised_startled;
      case 'emotion_surprised_startled_shocked':
        return l10n.emotion_surprised_startled_shocked;
      case 'emotion_surprised_startled_dismayed':
        return l10n.emotion_surprised_startled_dismayed;
      case 'emotion_surprised_confused':
        return l10n.emotion_surprised_confused;
      case 'emotion_surprised_confused_disillusioned':
        return l10n.emotion_surprised_confused_disillusioned;
      case 'emotion_surprised_confused_perplexed':
        return l10n.emotion_surprised_confused_perplexed;
      case 'emotion_surprised_amazed':
        return l10n.emotion_surprised_amazed;
      case 'emotion_surprised_amazed_astonished':
        return l10n.emotion_surprised_amazed_astonished;
      case 'emotion_surprised_amazed_awe':
        return l10n.emotion_surprised_amazed_awe;
      case 'emotion_surprised_excited':
        return l10n.emotion_surprised_excited;
      case 'emotion_surprised_excited_eager':
        return l10n.emotion_surprised_excited_eager;
      case 'emotion_surprised_excited_energetic':
        return l10n.emotion_surprised_excited_energetic;

      // Disgusted
      case 'emotion_disgusted':
        return l10n.emotion_disgusted;
      case 'emotion_disgusted_disapproving':
        return l10n.emotion_disgusted_disapproving;
      case 'emotion_disgusted_disapproving_judgmental':
        return l10n.emotion_disgusted_disapproving_judgmental;
      case 'emotion_disgusted_disapproving_embarrassed':
        return l10n.emotion_disgusted_disapproving_embarrassed;
      case 'emotion_disgusted_disappointed':
        return l10n.emotion_disgusted_disappointed;
      case 'emotion_disgusted_disappointed_appalled':
        return l10n.emotion_disgusted_disappointed_appalled;
      case 'emotion_disgusted_disappointed_revolted':
        return l10n.emotion_disgusted_disappointed_revolted;
      case 'emotion_disgusted_awful':
        return l10n.emotion_disgusted_awful;
      case 'emotion_disgusted_awful_nauseated':
        return l10n.emotion_disgusted_awful_nauseated;
      case 'emotion_disgusted_awful_detestable':
        return l10n.emotion_disgusted_awful_detestable;
      case 'emotion_disgusted_repelled':
        return l10n.emotion_disgusted_repelled;
      case 'emotion_disgusted_repelled_horrified':
        return l10n.emotion_disgusted_repelled_horrified;
      case 'emotion_disgusted_repelled_hesitant':
        return l10n.emotion_disgusted_repelled_hesitant;

      // Bad
      case 'emotion_bad':
        return l10n.emotion_bad;
      case 'emotion_bad_tired':
        return l10n.emotion_bad_tired;
      case 'emotion_bad_tired_sleepy':
        return l10n.emotion_bad_tired_sleepy;
      case 'emotion_bad_tired_unfocused':
        return l10n.emotion_bad_tired_unfocused;
      case 'emotion_bad_stressed':
        return l10n.emotion_bad_stressed;
      case 'emotion_bad_stressed_out_of_control':
        return l10n.emotion_bad_stressed_out_of_control;
      case 'emotion_bad_stressed_overwhelmed':
        return l10n.emotion_bad_stressed_overwhelmed;
      case 'emotion_bad_busy':
        return l10n.emotion_bad_busy;
      case 'emotion_bad_busy_pressured':
        return l10n.emotion_bad_busy_pressured;
      case 'emotion_bad_busy_rushed':
        return l10n.emotion_bad_busy_rushed;
      case 'emotion_bad_bored':
        return l10n.emotion_bad_bored;
      case 'emotion_bad_bored_indifferent':
        return l10n.emotion_bad_bored_indifferent;
      case 'emotion_bad_bored_apathetic':
        return l10n.emotion_bad_bored_apathetic;

      default:
        debugPrint('Warning: No localized string found for emotion key: $nameKey');
        return nameKey;
    }
  }
}

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
    if (_selectedLevel1 != null) parts.add(_selectedLevel1!.localizedName(context));
    if (_selectedLevel2 != null) parts.add(_selectedLevel2!.localizedName(context));
    if (_selectedLevel3 != null) parts.add(_selectedLevel3!.localizedName(context));
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
            emotion.localizedName(context),
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

