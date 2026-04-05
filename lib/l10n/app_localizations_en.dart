// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get settings => 'Settings';

  @override
  String get languagePickerTitle => 'Language Picker';

  @override
  String get noAdditionalSettings => 'No Additional Settings';

  @override
  String get exportData => 'Export Data';

  @override
  String get exportSuccess => 'Data exported successfully';

  @override
  String get exportFailed => 'Failed to export data';

  @override
  String get exportCancelled => 'Export cancelled';

  @override
  String get importData => 'Import Data';

  @override
  String get importSuccess => 'Data imported successfully';

  @override
  String get importFailed => 'Failed to import data';

  @override
  String get importCancelled => 'Import cancelled';

  @override
  String get personalHub => 'Personal Hub';

  @override
  String get hubFeatureGymTracking => 'Gym Tracking';

  @override
  String get hubFeatureGymTrackingDesc => 'Track your workouts and progress';

  @override
  String get hubFeatureMeditation => 'Meditation';

  @override
  String get hubFeatureMeditationDesc => 'Practice mindfulness and relaxation';

  @override
  String get hubFeatureFeels => 'Right in the Feels';

  @override
  String get hubFeatureFeelsDesc => 'Write and reflect on your feelings';

  @override
  String get hubFeatureCooking => 'Cooking';

  @override
  String get hubFeatureCookingDesc => 'Discover and save your favorite recipes';

  @override
  String get rightInTheFeels => 'Right in the Feels';

  @override
  String get emotionTracker => 'Emotion Tracker';

  @override
  String get emotionTrackerDesc => 'Log and track your daily emotions';

  @override
  String get emotionExplorer => 'Emotion Explorer';

  @override
  String get emotionExplorerDesc => 'Discover and understand your emotions';

  @override
  String get commsCheck => 'Comms Check';

  @override
  String get commsCheckDesc => 'Check in with yourself and others';

  @override
  String get emotionsRegulator => 'Emotions Regulator';

  @override
  String get emotionsRegulatorDesc => 'Tools to help regulate your emotions';

  @override
  String get reflectionCorner => 'Reflection Corner';

  @override
  String get reflectionCornerDesc => 'Reflect on your emotional journey';

  @override
  String get emotionTrackerTitle => 'Track Your Emotions';

  @override
  String get emotionTrackerSectionFeeling =>
      'What emotion are you feeling at the moment?';

  @override
  String get emotionTrackerSectionFeelingTooltip =>
      'Pick the emotion that feels the most accurate. If you feel “neutral” or are not sure what you are feeling, try to sit with your body and notice physical sensations. Based on those sensations, try to intellectually guess what you might be feeling. As you guess, notice whether that feels right or wrong. In the beginning, it doesn\'t matter whether you pick the right answer or not. It only matters that you consciously try to access your emotion regularly.';

  @override
  String get emotionTrackerSectionJournal =>
      'Write a bit about what you are feeling.';

  @override
  String get emotionTrackerSectionJournalTooltip =>
      'Journal your thoughts and try to articulate your feelings to the best of your ability. These entries will be used in the Reflection Corner.';

  @override
  String get emotionTrackerJournalHint => 'Write about your feelings...';

  @override
  String get emotionTrackerSectionBodyMap => 'Draw a body map.';

  @override
  String get emotionTrackerSectionBodyMapTooltip =>
      'Draw the outline of your body and using different colors, shade in the areas where you feel sensations. Shade darker for intense sensations and lighter for light sensations.';

  @override
  String get emotionTrackerSaveEntry => 'Save Entry';

  @override
  String get emotionTrackerEntrySaved => 'Entry saved';

  @override
  String get emotionTrackerClearEntry => 'Clear Entry';

  @override
  String get reflectionCornerTitle => 'Reflection Corner';

  @override
  String get reflectionCornerNoEntries =>
      'No entries yet. Start tracking your emotions to see them here.';

  @override
  String reflectionCornerEntryTitle(Object entryDate) {
    return 'Here is your journal entry you created on $entryDate';
  }

  @override
  String get reflectionCornerEmotionEntry =>
      'What emotion do you think you were feeling at this time?';

  @override
  String get reflectionCornerEmotionNow =>
      'Looking back at this entry, how do you feel now?';

  @override
  String get reflectionCornerReflectionPrompt =>
      'Take a minute to reflect on your previous entry.\nWhat do you think about your state of mind at the time?';

  @override
  String get reflectionCornerReflectionHint => 'Write your thoughts...';

  @override
  String get reflectionCornerSubmitReflection => 'Submit';

  @override
  String get reflectionCornerReflectionSaved => 'Reflection saved';

  @override
  String get commsCheckStepWho =>
      'Who do you want to communicate with? How is your relationship with them?';

  @override
  String get commsCheckHintWho => 'Name, relationship, context...';

  @override
  String get commsCheckStepWhatToTell => 'What do you want to tell them?';

  @override
  String get commsCheckHintMessage => 'Your message';

  @override
  String get commsCheckStepFeeling =>
      'How do you feel about saying that to them?';

  @override
  String get commsCheckStepExpectedReaction =>
      'What do you expect their reaction to be?';

  @override
  String get commsCheckHintExpectedReaction => 'Expected reaction';

  @override
  String get commsCheckStepWantedReaction =>
      'How do you actually want them to react?';

  @override
  String get commsCheckHintWantedReaction => 'Desired reaction';

  @override
  String get commsCheckStepResponseAfterReaction =>
      'What would you say to them after they react that way?';

  @override
  String get commsCheckHintResponseAfterReaction => 'Your response';

  @override
  String get commsCheckStepReflection =>
      'Reflect on what you\'ve written. How do you feel about the whole situation?';

  @override
  String get commsCheckHintReflection => 'Reflection';

  @override
  String get commsCheckSubmit => 'Submit';

  @override
  String get commsCheckSaved => 'Comms Check saved!';

  @override
  String get back => 'Back';

  @override
  String get emotion_happy => 'Happy';

  @override
  String get emotion_happy_optimistic => 'Optimistic';

  @override
  String get emotion_happy_optimistic_inspired => 'Inspired';

  @override
  String get emotion_happy_optimistic_hopeful => 'Hopeful';

  @override
  String get emotion_happy_trusting => 'Trusting';

  @override
  String get emotion_happy_trusting_intimate => 'Intimate';

  @override
  String get emotion_happy_trusting_sensitive => 'Sensitive';

  @override
  String get emotion_happy_peaceful => 'Peaceful';

  @override
  String get emotion_happy_peaceful_thankful => 'Thankful';

  @override
  String get emotion_happy_peaceful_loving => 'Loving';

  @override
  String get emotion_happy_powerful => 'Powerful';

  @override
  String get emotion_happy_powerful_creative => 'Creative';

  @override
  String get emotion_happy_powerful_courageous => 'Courageous';

  @override
  String get emotion_happy_accepted => 'Accepted';

  @override
  String get emotion_happy_accepted_valued => 'Valued';

  @override
  String get emotion_happy_accepted_respected => 'Respected';

  @override
  String get emotion_happy_proud => 'Proud';

  @override
  String get emotion_happy_proud_confident => 'Confident';

  @override
  String get emotion_happy_proud_successful => 'Successful';

  @override
  String get emotion_happy_interested => 'Interested';

  @override
  String get emotion_happy_interested_inquisitive => 'Inquisitive';

  @override
  String get emotion_happy_interested_curious => 'Curious';

  @override
  String get emotion_happy_content => 'Content';

  @override
  String get emotion_happy_content_joyful => 'Joyful';

  @override
  String get emotion_happy_content_free => 'Free';

  @override
  String get emotion_happy_playful => 'Playful';

  @override
  String get emotion_happy_playful_cheeky => 'Cheeky';

  @override
  String get emotion_happy_playful_aroused => 'Aroused';

  @override
  String get emotion_angry => 'Angry';

  @override
  String get emotion_angry_critical => 'Critical';

  @override
  String get emotion_angry_critical_dismissive => 'Dismissive';

  @override
  String get emotion_angry_critical_skeptical => 'Skeptical';

  @override
  String get emotion_angry_distant => 'Distant';

  @override
  String get emotion_angry_distant_numb => 'Numb';

  @override
  String get emotion_angry_distant_withdrawn => 'Withdrawn';

  @override
  String get emotion_angry_frustrated => 'Frustrated';

  @override
  String get emotion_angry_frustrated_annoyed => 'Annoyed';

  @override
  String get emotion_angry_frustrated_infuriated => 'Infuriated';

  @override
  String get emotion_angry_aggressive => 'Aggressive';

  @override
  String get emotion_angry_aggressive_hostile => 'Hostile';

  @override
  String get emotion_angry_aggressive_provoked => 'Provoked';

  @override
  String get emotion_angry_mad => 'Mad';

  @override
  String get emotion_angry_mad_jealous => 'Jealous';

  @override
  String get emotion_angry_mad_furious => 'Furious';

  @override
  String get emotion_angry_bitter => 'Bitter';

  @override
  String get emotion_angry_bitter_violated => 'Violated';

  @override
  String get emotion_angry_bitter_indignant => 'Indignant';

  @override
  String get emotion_angry_humiliated => 'Humiliated';

  @override
  String get emotion_angry_humiliated_disrespected => 'Disrespected';

  @override
  String get emotion_angry_humiliated_ridiculed => 'Ridiculed';

  @override
  String get emotion_angry_let_down => 'Let Down';

  @override
  String get emotion_angry_let_down_resentful => 'Resentful';

  @override
  String get emotion_angry_let_down_betrayed => 'Betrayed';

  @override
  String get emotion_sad => 'Sad';

  @override
  String get emotion_sad_hurt => 'Hurt';

  @override
  String get emotion_sad_hurt_embarrassed => 'Embarrassed';

  @override
  String get emotion_sad_hurt_disappointed => 'Disappointed';

  @override
  String get emotion_sad_depressed => 'Depressed';

  @override
  String get emotion_sad_depressed_inferior => 'Inferior';

  @override
  String get emotion_sad_depressed_empty => 'Empty';

  @override
  String get emotion_sad_guilty => 'Guilty';

  @override
  String get emotion_sad_guilty_remorseful => 'Remorseful';

  @override
  String get emotion_sad_guilty_ashamed => 'Ashamed';

  @override
  String get emotion_sad_despair => 'Despair';

  @override
  String get emotion_sad_despair_powerless => 'Powerless';

  @override
  String get emotion_sad_despair_grief => 'Grief';

  @override
  String get emotion_sad_vulnerable => 'Vulnerable';

  @override
  String get emotion_sad_vulnerable_fragile => 'Fragile';

  @override
  String get emotion_sad_vulnerable_victimized => 'Victimized';

  @override
  String get emotion_sad_lonely => 'Lonely';

  @override
  String get emotion_sad_lonely_abandoned => 'Abandoned';

  @override
  String get emotion_sad_lonely_isolated => 'Isolated';

  @override
  String get emotion_fearful => 'Fearful';

  @override
  String get emotion_fearful_scared => 'Scared';

  @override
  String get emotion_fearful_scared_helpless => 'Helpless';

  @override
  String get emotion_fearful_scared_frightened => 'Frightened';

  @override
  String get emotion_fearful_anxious => 'Anxious';

  @override
  String get emotion_fearful_anxious_overwhelmed => 'Overwhelmed';

  @override
  String get emotion_fearful_anxious_worried => 'Worried';

  @override
  String get emotion_fearful_insecure => 'Insecure';

  @override
  String get emotion_fearful_insecure_inadequate => 'Inadequate';

  @override
  String get emotion_fearful_insecure_inferior => 'Inferior';

  @override
  String get emotion_fearful_weak => 'Weak';

  @override
  String get emotion_fearful_weak_worthless => 'Worthless';

  @override
  String get emotion_fearful_weak_insignificant => 'Insignificant';

  @override
  String get emotion_fearful_rejected => 'Rejected';

  @override
  String get emotion_fearful_rejected_excluded => 'Excluded';

  @override
  String get emotion_fearful_rejected_persecuted => 'Persecuted';

  @override
  String get emotion_fearful_threatened => 'Threatened';

  @override
  String get emotion_fearful_threatened_nervous => 'Nervous';

  @override
  String get emotion_fearful_threatened_exposed => 'Exposed';

  @override
  String get emotion_surprised => 'Surprised';

  @override
  String get emotion_surprised_startled => 'Startled';

  @override
  String get emotion_surprised_startled_shocked => 'Shocked';

  @override
  String get emotion_surprised_startled_dismayed => 'Dismayed';

  @override
  String get emotion_surprised_confused => 'Confused';

  @override
  String get emotion_surprised_confused_disillusioned => 'Disillusioned';

  @override
  String get emotion_surprised_confused_perplexed => 'Perplexed';

  @override
  String get emotion_surprised_amazed => 'Amazed';

  @override
  String get emotion_surprised_amazed_astonished => 'Astonished';

  @override
  String get emotion_surprised_amazed_awe => 'Awe';

  @override
  String get emotion_surprised_excited => 'Excited';

  @override
  String get emotion_surprised_excited_eager => 'Eager';

  @override
  String get emotion_surprised_excited_energetic => 'Energetic';

  @override
  String get emotion_disgusted => 'Disgusted';

  @override
  String get emotion_disgusted_disapproving => 'Disapproving';

  @override
  String get emotion_disgusted_disapproving_judgmental => 'Judgmental';

  @override
  String get emotion_disgusted_disapproving_embarrassed => 'Embarrassed';

  @override
  String get emotion_disgusted_disappointed => 'Disappointed';

  @override
  String get emotion_disgusted_disappointed_appalled => 'Appalled';

  @override
  String get emotion_disgusted_disappointed_revolted => 'Revolted';

  @override
  String get emotion_disgusted_awful => 'Awful';

  @override
  String get emotion_disgusted_awful_nauseated => 'Nauseated';

  @override
  String get emotion_disgusted_awful_detestable => 'Detestable';

  @override
  String get emotion_disgusted_repelled => 'Repelled';

  @override
  String get emotion_disgusted_repelled_horrified => 'Horrified';

  @override
  String get emotion_disgusted_repelled_hesitant => 'Hesitant';

  @override
  String get emotion_bad => 'Bad';

  @override
  String get emotion_bad_tired => 'Tired';

  @override
  String get emotion_bad_tired_sleepy => 'Sleepy';

  @override
  String get emotion_bad_tired_unfocused => 'Unfocused';

  @override
  String get emotion_bad_stressed => 'Stressed';

  @override
  String get emotion_bad_stressed_out_of_control => 'Out of control';

  @override
  String get emotion_bad_stressed_overwhelmed => 'Overwhelmed';

  @override
  String get emotion_bad_busy => 'Busy';

  @override
  String get emotion_bad_busy_pressured => 'Pressured';

  @override
  String get emotion_bad_busy_rushed => 'Rushed';

  @override
  String get emotion_bad_bored => 'Bored';

  @override
  String get emotion_bad_bored_indifferent => 'Indifferent';

  @override
  String get emotion_bad_bored_apathetic => 'Apathetic';

  @override
  String get emotionExplorerTitle => 'Emotion Explorer';

  @override
  String get emotionExplorerNoEmotions => 'No emotions available';

  @override
  String get emotionExplorerTooltip =>
      'For each emotion on this page, write about times when you most commonly feel this emotion.\nFor example, for the emotion \"Angry\", you could write \"I tend to get angry when I cannot meet deadlines that I have set for myself.\"';

  @override
  String get emotionExplorerQuestion => 'When do you feel this Emotion?';

  @override
  String get emotionExplorerJournalHint => 'When do you feel this emotion?';
}
