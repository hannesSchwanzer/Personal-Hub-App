import 'package:flutter/material.dart';

/// Emotion data model for the hierarchical emotion selection.
class Emotion {
  final String nameKey;
  final Color color;
  final List<Emotion> children;

  const Emotion({
    required this.nameKey,
    required this.color,
    this.children = const [],
  });

  /// Gets the hardcoded English name for this emotion.
  String getName() {
    return nameKey;
  }
}


/// Hierarchical emotion data with 3 levels of depth.
const List<Emotion> emotionTree = [
  // Happy - Yellow tones
  Emotion(
    nameKey: 'Happy',
    color: Color(0xFFFFD54F),
    children: [
      Emotion(
        nameKey: 'Optimistic',
        color: Color(0xFFFFE082),
        children: [
          Emotion(nameKey: 'Inspired', color: Color(0xFFFFECB3)),
          Emotion(nameKey: 'Hopeful', color: Color(0xFFFFECB3)),
        ],
      ),
      Emotion(
        nameKey: 'Trusting',
        color: Color(0xFFFFE082),
        children: [
          Emotion(nameKey: 'Intimate', color: Color(0xFFFFECB3)),
          Emotion(nameKey: 'Sensitive', color: Color(0xFFFFECB3)),
        ],
      ),
      Emotion(
        nameKey: 'Peaceful',
        color: Color(0xFFFFE082),
        children: [
          Emotion(nameKey: 'Thankful', color: Color(0xFFFFECB3)),
          Emotion(nameKey: 'Loving', color: Color(0xFFFFECB3)),
        ],
      ),
      Emotion(
        nameKey: 'Powerful',
        color: Color(0xFFFFE082),
        children: [
          Emotion(nameKey: 'Creative', color: Color(0xFFFFECB3)),
          Emotion(nameKey: 'Courageous', color: Color(0xFFFFECB3)),
        ],
      ),
      Emotion(
        nameKey: 'Accepted',
        color: Color(0xFFFFE082),
        children: [
          Emotion(nameKey: 'Valued', color: Color(0xFFFFECB3)),
          Emotion(nameKey: 'Respected', color: Color(0xFFFFECB3)),
        ],
      ),
      Emotion(
        nameKey: 'Proud',
        color: Color(0xFFFFE082),
        children: [
          Emotion(nameKey: 'Confident', color: Color(0xFFFFECB3)),
          Emotion(nameKey: 'Successful', color: Color(0xFFFFECB3)),
        ],
      ),
      Emotion(
        nameKey: 'Interested',
        color: Color(0xFFFFE082),
        children: [
          Emotion(nameKey: 'Inquisitive', color: Color(0xFFFFECB3)),
          Emotion(nameKey: 'Curious', color: Color(0xFFFFECB3)),
        ],
      ),
      Emotion(
        nameKey: 'Content',
        color: Color(0xFFFFE082),
        children: [
          Emotion(nameKey: 'Joyful', color: Color(0xFFFFECB3)),
          Emotion(nameKey: 'Free', color: Color(0xFFFFECB3)),
        ],
      ),
      Emotion(
        nameKey: 'Playful',
        color: Color(0xFFFFE082),
        children: [
          Emotion(nameKey: 'Cheeky', color: Color(0xFFFFECB3)),
          Emotion(nameKey: 'Aroused', color: Color(0xFFFFECB3)),
        ],
      ),
    ],
  ),

  // Angry - Red tones
  Emotion(
    nameKey: 'Angry',
    color: Color(0xFFE57373),
    children: [
      Emotion(
        nameKey: 'Critical',
        color: Color(0xFFEF9A9A),
        children: [
          Emotion(nameKey: 'Dismissive', color: Color(0xFFFFCDD2)),
          Emotion(nameKey: 'Skeptical', color: Color(0xFFFFCDD2)),
        ],
      ),
      Emotion(
        nameKey: 'Distant',
        color: Color(0xFFEF9A9A),
        children: [
          Emotion(nameKey: 'Numb', color: Color(0xFFFFCDD2)),
          Emotion(nameKey: 'Withdrawn', color: Color(0xFFFFCDD2)),
        ],
      ),
      Emotion(
        nameKey: 'Frustrated',
        color: Color(0xFFEF9A9A),
        children: [
          Emotion(nameKey: 'Annoyed', color: Color(0xFFFFCDD2)),
          Emotion(nameKey: 'Infuriated', color: Color(0xFFFFCDD2)),
        ],
      ),
      Emotion(
        nameKey: 'Aggressive',
        color: Color(0xFFEF9A9A),
        children: [
          Emotion(nameKey: 'Hostile', color: Color(0xFFFFCDD2)),
          Emotion(nameKey: 'Provoked', color: Color(0xFFFFCDD2)),
        ],
      ),
      Emotion(
        nameKey: 'Mad',
        color: Color(0xFFEF9A9A),
        children: [
          Emotion(nameKey: 'Jealous', color: Color(0xFFFFCDD2)),
          Emotion(nameKey: 'Furious', color: Color(0xFFFFCDD2)),
        ],
      ),
      Emotion(
        nameKey: 'Bitter',
        color: Color(0xFFEF9A9A),
        children: [
          Emotion(nameKey: 'Violated', color: Color(0xFFFFCDD2)),
          Emotion(nameKey: 'Indignant', color: Color(0xFFFFCDD2)),
        ],
      ),
      Emotion(
        nameKey: 'Humiliated',
        color: Color(0xFFEF9A9A),
        children: [
          Emotion(nameKey: 'Disrespected', color: Color(0xFFFFCDD2)),
          Emotion(nameKey: 'Ridiculed', color: Color(0xFFFFCDD2)),
        ],
      ),
      Emotion(
        nameKey: 'Let Down',
        color: Color(0xFFEF9A9A),
        children: [
          Emotion(nameKey: 'Resentful', color: Color(0xFFFFCDD2)),
          Emotion(nameKey: 'Betrayed', color: Color(0xFFFFCDD2)),
        ],
      ),
    ],
  ),

  // Sad - Blue tones
  Emotion(
    nameKey: 'Sad',
    color: Color(0xFF64B5F6),
    children: [
      Emotion(
        nameKey: 'Hurt',
        color: Color(0xFF90CAF9),
        children: [
          Emotion(nameKey: 'Embarrassed', color: Color(0xFFBBDEFB)),
          Emotion(nameKey: 'Disappointed', color: Color(0xFFBBDEFB)),
        ],
      ),
      Emotion(
        nameKey: 'Depressed',
        color: Color(0xFF90CAF9),
        children: [
          Emotion(nameKey: 'Inferior', color: Color(0xFFBBDEFB)),
          Emotion(nameKey: 'Empty', color: Color(0xFFBBDEFB)),
        ],
      ),
      Emotion(
        nameKey: 'Guilty',
        color: Color(0xFF90CAF9),
        children: [
          Emotion(nameKey: 'Remorseful', color: Color(0xFFBBDEFB)),
          Emotion(nameKey: 'Ashamed', color: Color(0xFFBBDEFB)),
        ],
      ),
      Emotion(
        nameKey: 'Despair',
        color: Color(0xFF90CAF9),
        children: [
          Emotion(nameKey: 'Powerless', color: Color(0xFFBBDEFB)),
          Emotion(nameKey: 'Grief', color: Color(0xFFBBDEFB)),
        ],
      ),
      Emotion(
        nameKey: 'Vulnerable',
        color: Color(0xFF90CAF9),
        children: [
          Emotion(nameKey: 'Fragile', color: Color(0xFFBBDEFB)),
          Emotion(nameKey: 'Victimized', color: Color(0xFFBBDEFB)),
        ],
      ),
      Emotion(
        nameKey: 'Lonely',
        color: Color(0xFF90CAF9),
        children: [
          Emotion(nameKey: 'Abandoned', color: Color(0xFFBBDEFB)),
          Emotion(nameKey: 'Isolated', color: Color(0xFFBBDEFB)),
        ],
      ),
    ],
  ),

  // Fearful - Purple tones
  Emotion(
    nameKey: 'Fearful',
    color: Color(0xFFBA68C8),
    children: [
      Emotion(
        nameKey: 'Scared',
        color: Color(0xFFCE93D8),
        children: [
          Emotion(nameKey: 'Helpless', color: Color(0xFFE1BEE7)),
          Emotion(nameKey: 'Frightened', color: Color(0xFFE1BEE7)),
        ],
      ),
      Emotion(
        nameKey: 'Anxious',
        color: Color(0xFFCE93D8),
        children: [
          Emotion(nameKey: 'Overwhelmed', color: Color(0xFFE1BEE7)),
          Emotion(nameKey: 'Worried', color: Color(0xFFE1BEE7)),
        ],
      ),
      Emotion(
        nameKey: 'Insecure',
        color: Color(0xFFCE93D8),
        children: [
          Emotion(nameKey: 'Inadequate', color: Color(0xFFE1BEE7)),
          Emotion(nameKey: 'Inferior', color: Color(0xFFE1BEE7)),
        ],
      ),
      Emotion(
        nameKey: 'Weak',
        color: Color(0xFFCE93D8),
        children: [
          Emotion(nameKey: 'Worthless', color: Color(0xFFE1BEE7)),
          Emotion(nameKey: 'Insignificant', color: Color(0xFFE1BEE7)),
        ],
      ),
      Emotion(
        nameKey: 'Rejected',
        color: Color(0xFFCE93D8),
        children: [
          Emotion(nameKey: 'Excluded', color: Color(0xFFE1BEE7)),
          Emotion(nameKey: 'Persecuted', color: Color(0xFFE1BEE7)),
        ],
      ),
      Emotion(
        nameKey: 'Threatened',
        color: Color(0xFFCE93D8),
        children: [
          Emotion(nameKey: 'Nervous', color: Color(0xFFE1BEE7)),
          Emotion(nameKey: 'Exposed', color: Color(0xFFE1BEE7)),
        ],
      ),
    ],
  ),

  // Surprised - Teal tones
  Emotion(
    nameKey: 'Surprised',
    color: Color(0xFF4DB6AC),
    children: [
      Emotion(
        nameKey: 'Startled',
        color: Color(0xFF80CBC4),
        children: [
          Emotion(nameKey: 'Shocked', color: Color(0xFFB2DFDB)),
          Emotion(nameKey: 'Dismayed', color: Color(0xFFB2DFDB)),
        ],
      ),
      Emotion(
        nameKey: 'Confused',
        color: Color(0xFF80CBC4),
        children: [
          Emotion(nameKey: 'Disillusioned', color: Color(0xFFB2DFDB)),
          Emotion(nameKey: 'Perplexed', color: Color(0xFFB2DFDB)),
        ],
      ),
      Emotion(
        nameKey: 'Amazed',
        color: Color(0xFF80CBC4),
        children: [
          Emotion(nameKey: 'Astonished', color: Color(0xFFB2DFDB)),
          Emotion(nameKey: 'Awe', color: Color(0xFFB2DFDB)),
        ],
      ),
      Emotion(
        nameKey: 'Excited',
        color: Color(0xFF80CBC4),
        children: [
          Emotion(nameKey: 'Eager', color: Color(0xFFB2DFDB)),
          Emotion(nameKey: 'Energetic', color: Color(0xFFB2DFDB)),
        ],
      ),
    ],
  ),

  // Disgusted - Brown tones
  Emotion(
    nameKey: 'Disgusted',
    color: Color(0xFF8D6E63),
    children: [
      Emotion(
        nameKey: 'Disapproving',
        color: Color(0xFFA1887F),
        children: [
          Emotion(nameKey: 'Judgmental', color: Color(0xFFBCAAA4)),
          Emotion(nameKey: 'Embarrassed', color: Color(0xFFBCAAA4)),
        ],
      ),
      Emotion(
        nameKey: 'Disappointed',
        color: Color(0xFFA1887F),
        children: [
          Emotion(nameKey: 'Appalled', color: Color(0xFFBCAAA4)),
          Emotion(nameKey: 'Revolted', color: Color(0xFFBCAAA4)),
        ],
      ),
      Emotion(
        nameKey: 'Awful',
        color: Color(0xFFA1887F),
        children: [
          Emotion(nameKey: 'Nauseated', color: Color(0xFFBCAAA4)),
          Emotion(nameKey: 'Detestable', color: Color(0xFFBCAAA4)),
        ],
      ),
      Emotion(
        nameKey: 'Repelled',
        color: Color(0xFFA1887F),
        children: [
          Emotion(nameKey: 'Horrified', color: Color(0xFFBCAAA4)),
          Emotion(nameKey: 'Hesitant', color: Color(0xFFBCAAA4)),
        ],
      ),
    ],
  ),

  // Bad - Gray tones
  Emotion(
    nameKey: 'Bad',
    color: Color(0xFF90A4AE),
    children: [
      Emotion(
        nameKey: 'Tired',
        color: Color(0xFFB0BEC5),
        children: [
          Emotion(nameKey: 'Sleepy', color: Color(0xFFCFD8DC)),
          Emotion(nameKey: 'Unfocused', color: Color(0xFFCFD8DC)),
        ],
      ),
      Emotion(
        nameKey: 'Stressed',
        color: Color(0xFFB0BEC5),
        children: [
          Emotion(nameKey: 'Out of control', color: Color(0xFFCFD8DC)),
          Emotion(nameKey: 'Overwhelmed', color: Color(0xFFCFD8DC)),
        ],
      ),
      Emotion(
        nameKey: 'Busy',
        color: Color(0xFFB0BEC5),
        children: [
          Emotion(nameKey: 'Pressured', color: Color(0xFFCFD8DC)),
          Emotion(nameKey: 'Rushed', color: Color(0xFFCFD8DC)),
        ],
      ),
      Emotion(
        nameKey: 'Bored',
        color: Color(0xFFB0BEC5),
        children: [
          Emotion(nameKey: 'Indifferent', color: Color(0xFFCFD8DC)),
          Emotion(nameKey: 'Apathetic', color: Color(0xFFCFD8DC)),
        ],
      ),
    ],
  ),
];

/// View for tracking emotions with hierarchical selection, journaling, and body map.
class EmotionTrackerView extends StatefulWidget {
  const EmotionTrackerView({super.key});

  @override
  State<EmotionTrackerView> createState() => _EmotionTrackerViewState();
}

class _EmotionTrackerViewState extends State<EmotionTrackerView> {
  Emotion? _selectedLevel1;
  Emotion? _selectedLevel2;
  Emotion? _selectedLevel3;
  final TextEditingController _journalController = TextEditingController();

  @override
  void dispose() {
    _journalController.dispose();
    super.dispose();
  }

  void _selectLevel1(Emotion emotion) {
    setState(() {
      if (_selectedLevel1 == emotion) {
        // Deselect if tapping same emotion
        _selectedLevel1 = null;
        _selectedLevel2 = null;
        _selectedLevel3 = null;
      } else {
        _selectedLevel1 = emotion;
        _selectedLevel2 = null;
        _selectedLevel3 = null;
      }
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
    });
  }

  void _selectLevel3(Emotion emotion) {
    setState(() {
      if (_selectedLevel3 == emotion) {
        _selectedLevel3 = null;
      } else {
        _selectedLevel3 = emotion;
      }
    });
  }

  String _getSelectedEmotionPath() {
      final parts = <String>[];
      if (_selectedLevel1 != null) {
        parts.add(_selectedLevel1!.getName());
      }
      if (_selectedLevel2 != null) {
        parts.add(_selectedLevel2!.getName());
      }
      if (_selectedLevel3 != null) {
        parts.add(_selectedLevel3!.getName());
    }
    return parts.join(' → ');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Emotion Tracker'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Section 1: Emotion Selection
            _buildSectionHeader('How are you feeling?', Icons.mood),
            const SizedBox(height: 12),
            _buildEmotionSelector(),
            if (_getSelectedEmotionPath().isNotEmpty) ...[
              const SizedBox(height: 12),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
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
            const SizedBox(height: 32),

            // Section 2: Journal Entry
            _buildSectionHeader("What's on your mind?", Icons.edit_note),
            const SizedBox(height: 12),
            TextField(
              controller: _journalController,
              maxLines: 5,
              decoration: InputDecoration(
                hintText: 'Write about your feelings...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                filled: true,
                fillColor: Theme.of(context)
                    .colorScheme
                    .surfaceContainerHighest
                    .withValues(alpha: 0.3),
              ),
            ),
            const SizedBox(height: 32),

            // Section 3: Body Map (Coming Soon)
            _buildSectionHeader('Body Map', Icons.accessibility_new),
            const SizedBox(height: 12),
            Container(
              height: 200,
              decoration: BoxDecoration(
                color: Theme.of(context)
                    .colorScheme
                    .surfaceContainerHighest
                    .withValues(alpha: 0.3),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color:
                      Theme.of(context).colorScheme.outline.withValues(alpha: 0.3),
                ),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.draw_outlined,
                      size: 48,
                      color: Theme.of(context).colorScheme.outline,
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Coming Soon',
                      style: TextStyle(
                        fontSize: 16,
                        color: Theme.of(context).colorScheme.outline,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Draw where you feel it',
                      style: TextStyle(
                        fontSize: 12,
                        color: Theme.of(context)
                            .colorScheme
                            .outline
                            .withValues(alpha: 0.7),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 32),

            // Save Button
            SizedBox(
              width: double.infinity,
              child: FilledButton.icon(
                onPressed:
                    _selectedLevel1 != null ? () => _saveEntry(context) : null,
                icon: const Icon(Icons.save),
                label: const Text('Save Entry'),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title, IconData icon) {
    return Row(
      children: [
        Icon(icon, size: 24),
        const SizedBox(width: 8),
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildEmotionSelector() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Level 1: Basic emotions
        _buildEmotionRow(
          emotions: emotionTree,
          selectedEmotion: _selectedLevel1,
          onSelect: _selectLevel1,
          level: 1,
        ),

        // Level 2: More specific emotions
        if (_selectedLevel1 != null && _selectedLevel1!.children.isNotEmpty)
          _buildAnimatedEmotionLevel(
            emotions: _selectedLevel1!.children,
            selectedEmotion: _selectedLevel2,
            onSelect: _selectLevel2,
            level: 2,
          ),

        // Level 3: Most specific emotions
        if (_selectedLevel2 != null && _selectedLevel2!.children.isNotEmpty)
          _buildAnimatedEmotionLevel(
            emotions: _selectedLevel2!.children,
            selectedEmotion: _selectedLevel3,
            onSelect: _selectLevel3,
            level: 3,
          ),
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
        padding: EdgeInsets.only(left: (level - 1) * 16.0, top: 12),
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

  void _saveEntry(BuildContext context) {
    // For now, just show a snackbar confirmation
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Entry saved'),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}

/// Custom chip widget for emotion selection.
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
    // Chip size decreases with each level
    final double fontSize = 14.0 - (level - 1) * 1.0;
    final double paddingH = 16.0 - (level - 1) * 2.0;
    final double paddingV = 10.0 - (level - 1) * 1.0;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          padding:
              EdgeInsets.symmetric(horizontal: paddingH, vertical: paddingV),
          decoration: BoxDecoration(
            color: isSelected
                ? emotion.color
                : emotion.color.withValues(alpha: 0.3),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: isSelected
                  ? emotion.color.withValues(alpha: 0.8)
                  : emotion.color.withValues(alpha: 0.5),
              width: isSelected ? 2 : 1,
            ),
            boxShadow: isSelected
                ? [
                    BoxShadow(
                      color: emotion.color.withValues(alpha: 0.4),
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

