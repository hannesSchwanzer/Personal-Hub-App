import 'package:flutter/material.dart';
import 'package:personal_hub_app/ui/right_in_the_feels/models/emotion_ui_model.dart';

/// Hierarchical list of all available emotions for the emotion tracker.
///
/// This tree may be referenced throughout the app where emotion selection is needed.
/// All ids are unique and use the format: emotion_parent1_parent2_name (snake_case).
const List<EmotionUiModel> emotionTree = [
  // Happy - Yellow tones
  EmotionUiModel(
    id: 'emotion_happy',
    color: Color(0xFFFFD54F),
    children: [
      EmotionUiModel(
        id: 'emotion_happy_optimistic',
        color: Color(0xFFFFE082),
        children: [
          EmotionUiModel(id: 'emotion_happy_optimistic_inspired', color: Color(0xFFFFECB3)),
          EmotionUiModel(id: 'emotion_happy_optimistic_hopeful', color: Color(0xFFFFECB3)),
        ],
      ),
      EmotionUiModel(
        id: 'emotion_happy_trusting',
        color: Color(0xFFFFE082),
        children: [
          EmotionUiModel(id: 'emotion_happy_trusting_intimate', color: Color(0xFFFFECB3)),
          EmotionUiModel(id: 'emotion_happy_trusting_sensitive', color: Color(0xFFFFECB3)),
        ],
      ),
      EmotionUiModel(
        id: 'emotion_happy_peaceful',
        color: Color(0xFFFFE082),
        children: [
          EmotionUiModel(id: 'emotion_happy_peaceful_thankful', color: Color(0xFFFFECB3)),
          EmotionUiModel(id: 'emotion_happy_peaceful_loving', color: Color(0xFFFFECB3)),
        ],
      ),
      EmotionUiModel(
        id: 'emotion_happy_powerful',
        color: Color(0xFFFFE082),
        children: [
          EmotionUiModel(id: 'emotion_happy_powerful_creative', color: Color(0xFFFFECB3)),
          EmotionUiModel(id: 'emotion_happy_powerful_courageous', color: Color(0xFFFFECB3)),
        ],
      ),
      EmotionUiModel(
        id: 'emotion_happy_accepted',
        color: Color(0xFFFFE082),
        children: [
          EmotionUiModel(id: 'emotion_happy_accepted_valued', color: Color(0xFFFFECB3)),
          EmotionUiModel(id: 'emotion_happy_accepted_respected', color: Color(0xFFFFECB3)),
        ],
      ),
      EmotionUiModel(
        id: 'emotion_happy_proud',
        color: Color(0xFFFFE082),
        children: [
          EmotionUiModel(id: 'emotion_happy_proud_confident', color: Color(0xFFFFECB3)),
          EmotionUiModel(id: 'emotion_happy_proud_successful', color: Color(0xFFFFECB3)),
        ],
      ),
      EmotionUiModel(
        id: 'emotion_happy_interested',
        color: Color(0xFFFFE082),
        children: [
          EmotionUiModel(id: 'emotion_happy_interested_inquisitive', color: Color(0xFFFFECB3)),
          EmotionUiModel(id: 'emotion_happy_interested_curious', color: Color(0xFFFFECB3)),
        ],
      ),
      EmotionUiModel(
        id: 'emotion_happy_content',
        color: Color(0xFFFFE082),
        children: [
          EmotionUiModel(id: 'emotion_happy_content_joyful', color: Color(0xFFFFECB3)),
          EmotionUiModel(id: 'emotion_happy_content_free', color: Color(0xFFFFECB3)),
        ],
      ),
      EmotionUiModel(
        id: 'emotion_happy_playful',
        color: Color(0xFFFFE082),
        children: [
          EmotionUiModel(id: 'emotion_happy_playful_cheeky', color: Color(0xFFFFECB3)),
          EmotionUiModel(id: 'emotion_happy_playful_aroused', color: Color(0xFFFFECB3)),
        ],
      ),
    ],
  ),
  // Angry - Red tones
  EmotionUiModel(
    id: 'emotion_angry',
    color: Color(0xFFE57373),
    children: [
      EmotionUiModel(
        id: 'emotion_angry_critical',
        color: Color(0xFFEF9A9A),
        children: [
          EmotionUiModel(id: 'emotion_angry_critical_dismissive', color: Color(0xFFFFCDD2)),
          EmotionUiModel(id: 'emotion_angry_critical_skeptical', color: Color(0xFFFFCDD2)),
        ],
      ),
      EmotionUiModel(
        id: 'emotion_angry_distant',
        color: Color(0xFFEF9A9A),
        children: [
          EmotionUiModel(id: 'emotion_angry_distant_numb', color: Color(0xFFFFCDD2)),
          EmotionUiModel(id: 'emotion_angry_distant_withdrawn', color: Color(0xFFFFCDD2)),
        ],
      ),
      EmotionUiModel(
        id: 'emotion_angry_frustrated',
        color: Color(0xFFEF9A9A),
        children: [
          EmotionUiModel(id: 'emotion_angry_frustrated_annoyed', color: Color(0xFFFFCDD2)),
          EmotionUiModel(id: 'emotion_angry_frustrated_infuriated', color: Color(0xFFFFCDD2)),
        ],
      ),
      EmotionUiModel(
        id: 'emotion_angry_aggressive',
        color: Color(0xFFEF9A9A),
        children: [
          EmotionUiModel(id: 'emotion_angry_aggressive_hostile', color: Color(0xFFFFCDD2)),
          EmotionUiModel(id: 'emotion_angry_aggressive_provoked', color: Color(0xFFFFCDD2)),
        ],
      ),
      EmotionUiModel(
        id: 'emotion_angry_mad',
        color: Color(0xFFEF9A9A),
        children: [
          EmotionUiModel(id: 'emotion_angry_mad_jealous', color: Color(0xFFFFCDD2)),
          EmotionUiModel(id: 'emotion_angry_mad_furious', color: Color(0xFFFFCDD2)),
        ],
      ),
      EmotionUiModel(
        id: 'emotion_angry_bitter',
        color: Color(0xFFEF9A9A),
        children: [
          EmotionUiModel(id: 'emotion_angry_bitter_violated', color: Color(0xFFFFCDD2)),
          EmotionUiModel(id: 'emotion_angry_bitter_indignant', color: Color(0xFFFFCDD2)),
        ],
      ),
      EmotionUiModel(
        id: 'emotion_angry_humiliated',
        color: Color(0xFFEF9A9A),
        children: [
          EmotionUiModel(id: 'emotion_angry_humiliated_disrespected', color: Color(0xFFFFCDD2)),
          EmotionUiModel(id: 'emotion_angry_humiliated_ridiculed', color: Color(0xFFFFCDD2)),
        ],
      ),
      EmotionUiModel(
        id: 'emotion_angry_let_down',
        color: Color(0xFFEF9A9A),
        children: [
          EmotionUiModel(id: 'emotion_angry_let_down_resentful', color: Color(0xFFFFCDD2)),
          EmotionUiModel(id: 'emotion_angry_let_down_betrayed', color: Color(0xFFFFCDD2)),
        ],
      ),
    ],
  ),
  // Sad - Blue tones
  EmotionUiModel(
    id: 'emotion_sad',
    color: Color(0xFF64B5F6),
    children: [
      EmotionUiModel(
        id: 'emotion_sad_hurt',
        color: Color(0xFF90CAF9),
        children: [
          EmotionUiModel(id: 'emotion_sad_hurt_embarrassed', color: Color(0xFFBBDEFB)),
          EmotionUiModel(id: 'emotion_sad_hurt_disappointed', color: Color(0xFFBBDEFB)),
        ],
      ),
      EmotionUiModel(
        id: 'emotion_sad_depressed',
        color: Color(0xFF90CAF9),
        children: [
          EmotionUiModel(id: 'emotion_sad_depressed_inferior', color: Color(0xFFBBDEFB)),
          EmotionUiModel(id: 'emotion_sad_depressed_empty', color: Color(0xFFBBDEFB)),
        ],
      ),
      EmotionUiModel(
        id: 'emotion_sad_guilty',
        color: Color(0xFF90CAF9),
        children: [
          EmotionUiModel(id: 'emotion_sad_guilty_remorseful', color: Color(0xFFBBDEFB)),
          EmotionUiModel(id: 'emotion_sad_guilty_ashamed', color: Color(0xFFBBDEFB)),
        ],
      ),
      EmotionUiModel(
        id: 'emotion_sad_despair',
        color: Color(0xFF90CAF9),
        children: [
          EmotionUiModel(id: 'emotion_sad_despair_powerless', color: Color(0xFFBBDEFB)),
          EmotionUiModel(id: 'emotion_sad_despair_grief', color: Color(0xFFBBDEFB)),
        ],
      ),
      EmotionUiModel(
        id: 'emotion_sad_vulnerable',
        color: Color(0xFF90CAF9),
        children: [
          EmotionUiModel(id: 'emotion_sad_vulnerable_fragile', color: Color(0xFFBBDEFB)),
          EmotionUiModel(id: 'emotion_sad_vulnerable_victimized', color: Color(0xFFBBDEFB)),
        ],
      ),
      EmotionUiModel(
        id: 'emotion_sad_lonely',
        color: Color(0xFF90CAF9),
        children: [
          EmotionUiModel(id: 'emotion_sad_lonely_abandoned', color: Color(0xFFBBDEFB)),
          EmotionUiModel(id: 'emotion_sad_lonely_isolated', color: Color(0xFFBBDEFB)),
        ],
      ),
    ],
  ),
  // Fearful - Purple tones
  EmotionUiModel(
    id: 'emotion_fearful',
    color: Color(0xFFBA68C8),
    children: [
      EmotionUiModel(
        id: 'emotion_fearful_scared',
        color: Color(0xFFCE93D8),
        children: [
          EmotionUiModel(id: 'emotion_fearful_scared_helpless', color: Color(0xFFE1BEE7)),
          EmotionUiModel(id: 'emotion_fearful_scared_frightened', color: Color(0xFFE1BEE7)),
        ],
      ),
      EmotionUiModel(
        id: 'emotion_fearful_anxious',
        color: Color(0xFFCE93D8),
        children: [
          EmotionUiModel(id: 'emotion_fearful_anxious_overwhelmed', color: Color(0xFFE1BEE7)),
          EmotionUiModel(id: 'emotion_fearful_anxious_worried', color: Color(0xFFE1BEE7)),
        ],
      ),
      EmotionUiModel(
        id: 'emotion_fearful_insecure',
        color: Color(0xFFCE93D8),
        children: [
          EmotionUiModel(id: 'emotion_fearful_insecure_inadequate', color: Color(0xFFE1BEE7)),
          EmotionUiModel(id: 'emotion_fearful_insecure_inferior', color: Color(0xFFE1BEE7)),
        ],
      ),
      EmotionUiModel(
        id: 'emotion_fearful_weak',
        color: Color(0xFFCE93D8),
        children: [
          EmotionUiModel(id: 'emotion_fearful_weak_worthless', color: Color(0xFFE1BEE7)),
          EmotionUiModel(id: 'emotion_fearful_weak_insignificant', color: Color(0xFFE1BEE7)),
        ],
      ),
      EmotionUiModel(
        id: 'emotion_fearful_rejected',
        color: Color(0xFFCE93D8),
        children: [
          EmotionUiModel(id: 'emotion_fearful_rejected_excluded', color: Color(0xFFE1BEE7)),
          EmotionUiModel(id: 'emotion_fearful_rejected_persecuted', color: Color(0xFFE1BEE7)),
        ],
      ),
      EmotionUiModel(
        id: 'emotion_fearful_threatened',
        color: Color(0xFFCE93D8),
        children: [
          EmotionUiModel(id: 'emotion_fearful_threatened_nervous', color: Color(0xFFE1BEE7)),
          EmotionUiModel(id: 'emotion_fearful_threatened_exposed', color: Color(0xFFE1BEE7)),
        ],
      ),
    ],
  ),
  // Surprised - Teal tones
  EmotionUiModel(
    id: 'emotion_surprised',
    color: Color(0xFF4DB6AC),
    children: [
      EmotionUiModel(
        id: 'emotion_surprised_startled',
        color: Color(0xFF80CBC4),
        children: [
          EmotionUiModel(id: 'emotion_surprised_startled_shocked', color: Color(0xFFB2DFDB)),
          EmotionUiModel(id: 'emotion_surprised_startled_dismayed', color: Color(0xFFB2DFDB)),
        ],
      ),
      EmotionUiModel(
        id: 'emotion_surprised_confused',
        color: Color(0xFF80CBC4),
        children: [
          EmotionUiModel(id: 'emotion_surprised_confused_disillusioned', color: Color(0xFFB2DFDB)),
          EmotionUiModel(id: 'emotion_surprised_confused_perplexed', color: Color(0xFFB2DFDB)),
        ],
      ),
      EmotionUiModel(
        id: 'emotion_surprised_amazed',
        color: Color(0xFF80CBC4),
        children: [
          EmotionUiModel(id: 'emotion_surprised_amazed_astonished', color: Color(0xFFB2DFDB)),
          EmotionUiModel(id: 'emotion_surprised_amazed_awe', color: Color(0xFFB2DFDB)),
        ],
      ),
      EmotionUiModel(
        id: 'emotion_surprised_excited',
        color: Color(0xFF80CBC4),
        children: [
          EmotionUiModel(id: 'emotion_surprised_excited_eager', color: Color(0xFFB2DFDB)),
          EmotionUiModel(id: 'emotion_surprised_excited_energetic', color: Color(0xFFB2DFDB)),
        ],
      ),
    ],
  ),
  // Disgusted - Brown tones
  EmotionUiModel(
    id: 'emotion_disgusted',
    color: Color(0xFF8D6E63),
    children: [
      EmotionUiModel(
        id: 'emotion_disgusted_disapproving',
        color: Color(0xFFA1887F),
        children: [
          EmotionUiModel(id: 'emotion_disgusted_disapproving_judgmental', color: Color(0xFFBCAAA4)),
          EmotionUiModel(id: 'emotion_disgusted_disapproving_embarrassed', color: Color(0xFFBCAAA4)),
        ],
      ),
      EmotionUiModel(
        id: 'emotion_disgusted_disappointed',
        color: Color(0xFFA1887F),
        children: [
          EmotionUiModel(id: 'emotion_disgusted_disappointed_appalled', color: Color(0xFFBCAAA4)),
          EmotionUiModel(id: 'emotion_disgusted_disappointed_revolted', color: Color(0xFFBCAAA4)),
        ],
      ),
      EmotionUiModel(
        id: 'emotion_disgusted_awful',
        color: Color(0xFFA1887F),
        children: [
          EmotionUiModel(id: 'emotion_disgusted_awful_nauseated', color: Color(0xFFBCAAA4)),
          EmotionUiModel(id: 'emotion_disgusted_awful_detestable', color: Color(0xFFBCAAA4)),
        ],
      ),
      EmotionUiModel(
        id: 'emotion_disgusted_repelled',
        color: Color(0xFFA1887F),
        children: [
          EmotionUiModel(id: 'emotion_disgusted_repelled_horrified', color: Color(0xFFBCAAA4)),
          EmotionUiModel(id: 'emotion_disgusted_repelled_hesitant', color: Color(0xFFBCAAA4)),
        ],
      ),
    ],
  ),
  // Bad - Gray tones
  EmotionUiModel(
    id: 'emotion_bad',
    color: Color(0xFF90A4AE),
    children: [
      EmotionUiModel(
        id: 'emotion_bad_tired',
        color: Color(0xFFB0BEC5),
        children: [
          EmotionUiModel(id: 'emotion_bad_tired_sleepy', color: Color(0xFFCFD8DC)),
          EmotionUiModel(id: 'emotion_bad_tired_unfocused', color: Color(0xFFCFD8DC)),
        ],
      ),
      EmotionUiModel(
        id: 'emotion_bad_stressed',
        color: Color(0xFFB0BEC5),
        children: [
          EmotionUiModel(id: 'emotion_bad_stressed_out_of_control', color: Color(0xFFCFD8DC)),
          EmotionUiModel(id: 'emotion_bad_stressed_overwhelmed', color: Color(0xFFCFD8DC)),
        ],
      ),
      EmotionUiModel(
        id: 'emotion_bad_busy',
        color: Color(0xFFB0BEC5),
        children: [
          EmotionUiModel(id: 'emotion_bad_busy_pressured', color: Color(0xFFCFD8DC)),
          EmotionUiModel(id: 'emotion_bad_busy_rushed', color: Color(0xFFCFD8DC)),
        ],
      ),
      EmotionUiModel(
        id: 'emotion_bad_bored',
        color: Color(0xFFB0BEC5),
        children: [
          EmotionUiModel(id: 'emotion_bad_bored_indifferent', color: Color(0xFFCFD8DC)),
          EmotionUiModel(id: 'emotion_bad_bored_apathetic', color: Color(0xFFCFD8DC)),
        ],
      ),
    ],
  ),
];

