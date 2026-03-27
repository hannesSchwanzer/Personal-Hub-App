import 'emotion.dart';
import 'package:flutter/material.dart';

/// Hierarchical list of all available emotions for the emotion tracker.
///
/// This tree may be referenced throughout the app where emotion selection is needed.
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

