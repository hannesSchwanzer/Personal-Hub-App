import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_de.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('de'),
    Locale('en'),
  ];

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @languagePickerTitle.
  ///
  /// In en, this message translates to:
  /// **'Language Picker'**
  String get languagePickerTitle;

  /// No description provided for @noAdditionalSettings.
  ///
  /// In en, this message translates to:
  /// **'No Additional Settings'**
  String get noAdditionalSettings;

  /// No description provided for @personalHub.
  ///
  /// In en, this message translates to:
  /// **'Personal Hub'**
  String get personalHub;

  /// No description provided for @hubFeatureGymTracking.
  ///
  /// In en, this message translates to:
  /// **'Gym Tracking'**
  String get hubFeatureGymTracking;

  /// No description provided for @hubFeatureGymTrackingDesc.
  ///
  /// In en, this message translates to:
  /// **'Track your workouts and progress'**
  String get hubFeatureGymTrackingDesc;

  /// No description provided for @hubFeatureMeditation.
  ///
  /// In en, this message translates to:
  /// **'Meditation'**
  String get hubFeatureMeditation;

  /// No description provided for @hubFeatureMeditationDesc.
  ///
  /// In en, this message translates to:
  /// **'Practice mindfulness and relaxation'**
  String get hubFeatureMeditationDesc;

  /// No description provided for @hubFeatureFeels.
  ///
  /// In en, this message translates to:
  /// **'Right in the Feels'**
  String get hubFeatureFeels;

  /// No description provided for @hubFeatureFeelsDesc.
  ///
  /// In en, this message translates to:
  /// **'Write and reflect on your feelings'**
  String get hubFeatureFeelsDesc;

  /// No description provided for @hubFeatureCooking.
  ///
  /// In en, this message translates to:
  /// **'Cooking'**
  String get hubFeatureCooking;

  /// No description provided for @hubFeatureCookingDesc.
  ///
  /// In en, this message translates to:
  /// **'Discover and save your favorite recipes'**
  String get hubFeatureCookingDesc;

  /// No description provided for @rightInTheFeels.
  ///
  /// In en, this message translates to:
  /// **'Right in the Feels'**
  String get rightInTheFeels;

  /// No description provided for @emotionTracker.
  ///
  /// In en, this message translates to:
  /// **'Emotion Tracker'**
  String get emotionTracker;

  /// No description provided for @emotionTrackerDesc.
  ///
  /// In en, this message translates to:
  /// **'Log and track your daily emotions'**
  String get emotionTrackerDesc;

  /// No description provided for @emotionExplorer.
  ///
  /// In en, this message translates to:
  /// **'Emotion Explorer'**
  String get emotionExplorer;

  /// No description provided for @emotionExplorerDesc.
  ///
  /// In en, this message translates to:
  /// **'Discover and understand your emotions'**
  String get emotionExplorerDesc;

  /// No description provided for @commsCheck.
  ///
  /// In en, this message translates to:
  /// **'Comms Check'**
  String get commsCheck;

  /// No description provided for @commsCheckDesc.
  ///
  /// In en, this message translates to:
  /// **'Check in with yourself and others'**
  String get commsCheckDesc;

  /// No description provided for @emotionsRegulator.
  ///
  /// In en, this message translates to:
  /// **'Emotions Regulator'**
  String get emotionsRegulator;

  /// No description provided for @emotionsRegulatorDesc.
  ///
  /// In en, this message translates to:
  /// **'Tools to help regulate your emotions'**
  String get emotionsRegulatorDesc;

  /// No description provided for @reflectionCorner.
  ///
  /// In en, this message translates to:
  /// **'Reflection Corner'**
  String get reflectionCorner;

  /// No description provided for @reflectionCornerDesc.
  ///
  /// In en, this message translates to:
  /// **'Reflect on your emotional journey'**
  String get reflectionCornerDesc;

  /// No description provided for @emotionTrackerTitle.
  ///
  /// In en, this message translates to:
  /// **'Track Your Emotions'**
  String get emotionTrackerTitle;

  /// No description provided for @emotionTrackerSectionFeeling.
  ///
  /// In en, this message translates to:
  /// **'What emotion are you feeling at the moment?'**
  String get emotionTrackerSectionFeeling;

  /// No description provided for @emotionTrackerSectionFeelingTooltip.
  ///
  /// In en, this message translates to:
  /// **'Pick the emotion that feels the most accurate. If you feel “neutral” or are not sure what you are feeling, try to sit with your body and notice physical sensations. Based on those sensations, try to intellectually guess what you might be feeling. As you guess, notice whether that feels right or wrong. In the beginning, it doesn\'t matter whether you pick the right answer or not. It only matters that you consciously try to access your emotion regularly.'**
  String get emotionTrackerSectionFeelingTooltip;

  /// No description provided for @emotionTrackerSectionJournal.
  ///
  /// In en, this message translates to:
  /// **'Write a bit about what you are feeling.'**
  String get emotionTrackerSectionJournal;

  /// No description provided for @emotionTrackerSectionJournalTooltip.
  ///
  /// In en, this message translates to:
  /// **'Journal your thoughts and try to articulate your feelings to the best of your ability. These entries will be used in the Reflection Corner.'**
  String get emotionTrackerSectionJournalTooltip;

  /// No description provided for @emotionTrackerJournalHint.
  ///
  /// In en, this message translates to:
  /// **'Write about your feelings...'**
  String get emotionTrackerJournalHint;

  /// No description provided for @emotionTrackerSectionBodyMap.
  ///
  /// In en, this message translates to:
  /// **'Draw a body map.'**
  String get emotionTrackerSectionBodyMap;

  /// No description provided for @emotionTrackerSectionBodyMapTooltip.
  ///
  /// In en, this message translates to:
  /// **'Draw the outline of your body and using different colors, shade in the areas where you feel sensations. Shade darker for intense sensations and lighter for light sensations.'**
  String get emotionTrackerSectionBodyMapTooltip;

  /// No description provided for @emotionTrackerSaveEntry.
  ///
  /// In en, this message translates to:
  /// **'Save Entry'**
  String get emotionTrackerSaveEntry;

  /// No description provided for @emotionTrackerEntrySaved.
  ///
  /// In en, this message translates to:
  /// **'Entry saved'**
  String get emotionTrackerEntrySaved;

  /// No description provided for @emotionTrackerClearEntry.
  ///
  /// In en, this message translates to:
  /// **'Clear Entry'**
  String get emotionTrackerClearEntry;

  /// No description provided for @reflectionCornerTitle.
  ///
  /// In en, this message translates to:
  /// **'Reflection Corner'**
  String get reflectionCornerTitle;

  /// No description provided for @reflectionCornerNoEntries.
  ///
  /// In en, this message translates to:
  /// **'No entries yet. Start tracking your emotions to see them here.'**
  String get reflectionCornerNoEntries;

  /// No description provided for @reflectionCornerEntryTitle.
  ///
  /// In en, this message translates to:
  /// **'Here is your journal entry you created on {entryDate}'**
  String reflectionCornerEntryTitle(Object entryDate);

  /// No description provided for @reflectionCornerEmotionEntry.
  ///
  /// In en, this message translates to:
  /// **'What emotion do you think you were feeling at this time?'**
  String get reflectionCornerEmotionEntry;

  /// No description provided for @reflectionCornerEmotionNow.
  ///
  /// In en, this message translates to:
  /// **'Looking back at this entry, how do you feel now?'**
  String get reflectionCornerEmotionNow;

  /// No description provided for @reflectionCornerReflectionPrompt.
  ///
  /// In en, this message translates to:
  /// **'Take a minute to reflect on your previous entry.\nWhat do you think about your state of mind at the time?'**
  String get reflectionCornerReflectionPrompt;

  /// No description provided for @reflectionCornerReflectionHint.
  ///
  /// In en, this message translates to:
  /// **'Write your thoughts...'**
  String get reflectionCornerReflectionHint;

  /// No description provided for @reflectionCornerSubmitReflection.
  ///
  /// In en, this message translates to:
  /// **'Submit'**
  String get reflectionCornerSubmitReflection;

  /// No description provided for @reflectionCornerReflectionSaved.
  ///
  /// In en, this message translates to:
  /// **'Reflection saved'**
  String get reflectionCornerReflectionSaved;

  /// No description provided for @emotion_happy.
  ///
  /// In en, this message translates to:
  /// **'Happy'**
  String get emotion_happy;

  /// No description provided for @emotion_happy_optimistic.
  ///
  /// In en, this message translates to:
  /// **'Optimistic'**
  String get emotion_happy_optimistic;

  /// No description provided for @emotion_happy_optimistic_inspired.
  ///
  /// In en, this message translates to:
  /// **'Inspired'**
  String get emotion_happy_optimistic_inspired;

  /// No description provided for @emotion_happy_optimistic_hopeful.
  ///
  /// In en, this message translates to:
  /// **'Hopeful'**
  String get emotion_happy_optimistic_hopeful;

  /// No description provided for @emotion_happy_trusting.
  ///
  /// In en, this message translates to:
  /// **'Trusting'**
  String get emotion_happy_trusting;

  /// No description provided for @emotion_happy_trusting_intimate.
  ///
  /// In en, this message translates to:
  /// **'Intimate'**
  String get emotion_happy_trusting_intimate;

  /// No description provided for @emotion_happy_trusting_sensitive.
  ///
  /// In en, this message translates to:
  /// **'Sensitive'**
  String get emotion_happy_trusting_sensitive;

  /// No description provided for @emotion_happy_peaceful.
  ///
  /// In en, this message translates to:
  /// **'Peaceful'**
  String get emotion_happy_peaceful;

  /// No description provided for @emotion_happy_peaceful_thankful.
  ///
  /// In en, this message translates to:
  /// **'Thankful'**
  String get emotion_happy_peaceful_thankful;

  /// No description provided for @emotion_happy_peaceful_loving.
  ///
  /// In en, this message translates to:
  /// **'Loving'**
  String get emotion_happy_peaceful_loving;

  /// No description provided for @emotion_happy_powerful.
  ///
  /// In en, this message translates to:
  /// **'Powerful'**
  String get emotion_happy_powerful;

  /// No description provided for @emotion_happy_powerful_creative.
  ///
  /// In en, this message translates to:
  /// **'Creative'**
  String get emotion_happy_powerful_creative;

  /// No description provided for @emotion_happy_powerful_courageous.
  ///
  /// In en, this message translates to:
  /// **'Courageous'**
  String get emotion_happy_powerful_courageous;

  /// No description provided for @emotion_happy_accepted.
  ///
  /// In en, this message translates to:
  /// **'Accepted'**
  String get emotion_happy_accepted;

  /// No description provided for @emotion_happy_accepted_valued.
  ///
  /// In en, this message translates to:
  /// **'Valued'**
  String get emotion_happy_accepted_valued;

  /// No description provided for @emotion_happy_accepted_respected.
  ///
  /// In en, this message translates to:
  /// **'Respected'**
  String get emotion_happy_accepted_respected;

  /// No description provided for @emotion_happy_proud.
  ///
  /// In en, this message translates to:
  /// **'Proud'**
  String get emotion_happy_proud;

  /// No description provided for @emotion_happy_proud_confident.
  ///
  /// In en, this message translates to:
  /// **'Confident'**
  String get emotion_happy_proud_confident;

  /// No description provided for @emotion_happy_proud_successful.
  ///
  /// In en, this message translates to:
  /// **'Successful'**
  String get emotion_happy_proud_successful;

  /// No description provided for @emotion_happy_interested.
  ///
  /// In en, this message translates to:
  /// **'Interested'**
  String get emotion_happy_interested;

  /// No description provided for @emotion_happy_interested_inquisitive.
  ///
  /// In en, this message translates to:
  /// **'Inquisitive'**
  String get emotion_happy_interested_inquisitive;

  /// No description provided for @emotion_happy_interested_curious.
  ///
  /// In en, this message translates to:
  /// **'Curious'**
  String get emotion_happy_interested_curious;

  /// No description provided for @emotion_happy_content.
  ///
  /// In en, this message translates to:
  /// **'Content'**
  String get emotion_happy_content;

  /// No description provided for @emotion_happy_content_joyful.
  ///
  /// In en, this message translates to:
  /// **'Joyful'**
  String get emotion_happy_content_joyful;

  /// No description provided for @emotion_happy_content_free.
  ///
  /// In en, this message translates to:
  /// **'Free'**
  String get emotion_happy_content_free;

  /// No description provided for @emotion_happy_playful.
  ///
  /// In en, this message translates to:
  /// **'Playful'**
  String get emotion_happy_playful;

  /// No description provided for @emotion_happy_playful_cheeky.
  ///
  /// In en, this message translates to:
  /// **'Cheeky'**
  String get emotion_happy_playful_cheeky;

  /// No description provided for @emotion_happy_playful_aroused.
  ///
  /// In en, this message translates to:
  /// **'Aroused'**
  String get emotion_happy_playful_aroused;

  /// No description provided for @emotion_angry.
  ///
  /// In en, this message translates to:
  /// **'Angry'**
  String get emotion_angry;

  /// No description provided for @emotion_angry_critical.
  ///
  /// In en, this message translates to:
  /// **'Critical'**
  String get emotion_angry_critical;

  /// No description provided for @emotion_angry_critical_dismissive.
  ///
  /// In en, this message translates to:
  /// **'Dismissive'**
  String get emotion_angry_critical_dismissive;

  /// No description provided for @emotion_angry_critical_skeptical.
  ///
  /// In en, this message translates to:
  /// **'Skeptical'**
  String get emotion_angry_critical_skeptical;

  /// No description provided for @emotion_angry_distant.
  ///
  /// In en, this message translates to:
  /// **'Distant'**
  String get emotion_angry_distant;

  /// No description provided for @emotion_angry_distant_numb.
  ///
  /// In en, this message translates to:
  /// **'Numb'**
  String get emotion_angry_distant_numb;

  /// No description provided for @emotion_angry_distant_withdrawn.
  ///
  /// In en, this message translates to:
  /// **'Withdrawn'**
  String get emotion_angry_distant_withdrawn;

  /// No description provided for @emotion_angry_frustrated.
  ///
  /// In en, this message translates to:
  /// **'Frustrated'**
  String get emotion_angry_frustrated;

  /// No description provided for @emotion_angry_frustrated_annoyed.
  ///
  /// In en, this message translates to:
  /// **'Annoyed'**
  String get emotion_angry_frustrated_annoyed;

  /// No description provided for @emotion_angry_frustrated_infuriated.
  ///
  /// In en, this message translates to:
  /// **'Infuriated'**
  String get emotion_angry_frustrated_infuriated;

  /// No description provided for @emotion_angry_aggressive.
  ///
  /// In en, this message translates to:
  /// **'Aggressive'**
  String get emotion_angry_aggressive;

  /// No description provided for @emotion_angry_aggressive_hostile.
  ///
  /// In en, this message translates to:
  /// **'Hostile'**
  String get emotion_angry_aggressive_hostile;

  /// No description provided for @emotion_angry_aggressive_provoked.
  ///
  /// In en, this message translates to:
  /// **'Provoked'**
  String get emotion_angry_aggressive_provoked;

  /// No description provided for @emotion_angry_mad.
  ///
  /// In en, this message translates to:
  /// **'Mad'**
  String get emotion_angry_mad;

  /// No description provided for @emotion_angry_mad_jealous.
  ///
  /// In en, this message translates to:
  /// **'Jealous'**
  String get emotion_angry_mad_jealous;

  /// No description provided for @emotion_angry_mad_furious.
  ///
  /// In en, this message translates to:
  /// **'Furious'**
  String get emotion_angry_mad_furious;

  /// No description provided for @emotion_angry_bitter.
  ///
  /// In en, this message translates to:
  /// **'Bitter'**
  String get emotion_angry_bitter;

  /// No description provided for @emotion_angry_bitter_violated.
  ///
  /// In en, this message translates to:
  /// **'Violated'**
  String get emotion_angry_bitter_violated;

  /// No description provided for @emotion_angry_bitter_indignant.
  ///
  /// In en, this message translates to:
  /// **'Indignant'**
  String get emotion_angry_bitter_indignant;

  /// No description provided for @emotion_angry_humiliated.
  ///
  /// In en, this message translates to:
  /// **'Humiliated'**
  String get emotion_angry_humiliated;

  /// No description provided for @emotion_angry_humiliated_disrespected.
  ///
  /// In en, this message translates to:
  /// **'Disrespected'**
  String get emotion_angry_humiliated_disrespected;

  /// No description provided for @emotion_angry_humiliated_ridiculed.
  ///
  /// In en, this message translates to:
  /// **'Ridiculed'**
  String get emotion_angry_humiliated_ridiculed;

  /// No description provided for @emotion_angry_let_down.
  ///
  /// In en, this message translates to:
  /// **'Let Down'**
  String get emotion_angry_let_down;

  /// No description provided for @emotion_angry_let_down_resentful.
  ///
  /// In en, this message translates to:
  /// **'Resentful'**
  String get emotion_angry_let_down_resentful;

  /// No description provided for @emotion_angry_let_down_betrayed.
  ///
  /// In en, this message translates to:
  /// **'Betrayed'**
  String get emotion_angry_let_down_betrayed;

  /// No description provided for @emotion_sad.
  ///
  /// In en, this message translates to:
  /// **'Sad'**
  String get emotion_sad;

  /// No description provided for @emotion_sad_hurt.
  ///
  /// In en, this message translates to:
  /// **'Hurt'**
  String get emotion_sad_hurt;

  /// No description provided for @emotion_sad_hurt_embarrassed.
  ///
  /// In en, this message translates to:
  /// **'Embarrassed'**
  String get emotion_sad_hurt_embarrassed;

  /// No description provided for @emotion_sad_hurt_disappointed.
  ///
  /// In en, this message translates to:
  /// **'Disappointed'**
  String get emotion_sad_hurt_disappointed;

  /// No description provided for @emotion_sad_depressed.
  ///
  /// In en, this message translates to:
  /// **'Depressed'**
  String get emotion_sad_depressed;

  /// No description provided for @emotion_sad_depressed_inferior.
  ///
  /// In en, this message translates to:
  /// **'Inferior'**
  String get emotion_sad_depressed_inferior;

  /// No description provided for @emotion_sad_depressed_empty.
  ///
  /// In en, this message translates to:
  /// **'Empty'**
  String get emotion_sad_depressed_empty;

  /// No description provided for @emotion_sad_guilty.
  ///
  /// In en, this message translates to:
  /// **'Guilty'**
  String get emotion_sad_guilty;

  /// No description provided for @emotion_sad_guilty_remorseful.
  ///
  /// In en, this message translates to:
  /// **'Remorseful'**
  String get emotion_sad_guilty_remorseful;

  /// No description provided for @emotion_sad_guilty_ashamed.
  ///
  /// In en, this message translates to:
  /// **'Ashamed'**
  String get emotion_sad_guilty_ashamed;

  /// No description provided for @emotion_sad_despair.
  ///
  /// In en, this message translates to:
  /// **'Despair'**
  String get emotion_sad_despair;

  /// No description provided for @emotion_sad_despair_powerless.
  ///
  /// In en, this message translates to:
  /// **'Powerless'**
  String get emotion_sad_despair_powerless;

  /// No description provided for @emotion_sad_despair_grief.
  ///
  /// In en, this message translates to:
  /// **'Grief'**
  String get emotion_sad_despair_grief;

  /// No description provided for @emotion_sad_vulnerable.
  ///
  /// In en, this message translates to:
  /// **'Vulnerable'**
  String get emotion_sad_vulnerable;

  /// No description provided for @emotion_sad_vulnerable_fragile.
  ///
  /// In en, this message translates to:
  /// **'Fragile'**
  String get emotion_sad_vulnerable_fragile;

  /// No description provided for @emotion_sad_vulnerable_victimized.
  ///
  /// In en, this message translates to:
  /// **'Victimized'**
  String get emotion_sad_vulnerable_victimized;

  /// No description provided for @emotion_sad_lonely.
  ///
  /// In en, this message translates to:
  /// **'Lonely'**
  String get emotion_sad_lonely;

  /// No description provided for @emotion_sad_lonely_abandoned.
  ///
  /// In en, this message translates to:
  /// **'Abandoned'**
  String get emotion_sad_lonely_abandoned;

  /// No description provided for @emotion_sad_lonely_isolated.
  ///
  /// In en, this message translates to:
  /// **'Isolated'**
  String get emotion_sad_lonely_isolated;

  /// No description provided for @emotion_fearful.
  ///
  /// In en, this message translates to:
  /// **'Fearful'**
  String get emotion_fearful;

  /// No description provided for @emotion_fearful_scared.
  ///
  /// In en, this message translates to:
  /// **'Scared'**
  String get emotion_fearful_scared;

  /// No description provided for @emotion_fearful_scared_helpless.
  ///
  /// In en, this message translates to:
  /// **'Helpless'**
  String get emotion_fearful_scared_helpless;

  /// No description provided for @emotion_fearful_scared_frightened.
  ///
  /// In en, this message translates to:
  /// **'Frightened'**
  String get emotion_fearful_scared_frightened;

  /// No description provided for @emotion_fearful_anxious.
  ///
  /// In en, this message translates to:
  /// **'Anxious'**
  String get emotion_fearful_anxious;

  /// No description provided for @emotion_fearful_anxious_overwhelmed.
  ///
  /// In en, this message translates to:
  /// **'Overwhelmed'**
  String get emotion_fearful_anxious_overwhelmed;

  /// No description provided for @emotion_fearful_anxious_worried.
  ///
  /// In en, this message translates to:
  /// **'Worried'**
  String get emotion_fearful_anxious_worried;

  /// No description provided for @emotion_fearful_insecure.
  ///
  /// In en, this message translates to:
  /// **'Insecure'**
  String get emotion_fearful_insecure;

  /// No description provided for @emotion_fearful_insecure_inadequate.
  ///
  /// In en, this message translates to:
  /// **'Inadequate'**
  String get emotion_fearful_insecure_inadequate;

  /// No description provided for @emotion_fearful_insecure_inferior.
  ///
  /// In en, this message translates to:
  /// **'Inferior'**
  String get emotion_fearful_insecure_inferior;

  /// No description provided for @emotion_fearful_weak.
  ///
  /// In en, this message translates to:
  /// **'Weak'**
  String get emotion_fearful_weak;

  /// No description provided for @emotion_fearful_weak_worthless.
  ///
  /// In en, this message translates to:
  /// **'Worthless'**
  String get emotion_fearful_weak_worthless;

  /// No description provided for @emotion_fearful_weak_insignificant.
  ///
  /// In en, this message translates to:
  /// **'Insignificant'**
  String get emotion_fearful_weak_insignificant;

  /// No description provided for @emotion_fearful_rejected.
  ///
  /// In en, this message translates to:
  /// **'Rejected'**
  String get emotion_fearful_rejected;

  /// No description provided for @emotion_fearful_rejected_excluded.
  ///
  /// In en, this message translates to:
  /// **'Excluded'**
  String get emotion_fearful_rejected_excluded;

  /// No description provided for @emotion_fearful_rejected_persecuted.
  ///
  /// In en, this message translates to:
  /// **'Persecuted'**
  String get emotion_fearful_rejected_persecuted;

  /// No description provided for @emotion_fearful_threatened.
  ///
  /// In en, this message translates to:
  /// **'Threatened'**
  String get emotion_fearful_threatened;

  /// No description provided for @emotion_fearful_threatened_nervous.
  ///
  /// In en, this message translates to:
  /// **'Nervous'**
  String get emotion_fearful_threatened_nervous;

  /// No description provided for @emotion_fearful_threatened_exposed.
  ///
  /// In en, this message translates to:
  /// **'Exposed'**
  String get emotion_fearful_threatened_exposed;

  /// No description provided for @emotion_surprised.
  ///
  /// In en, this message translates to:
  /// **'Surprised'**
  String get emotion_surprised;

  /// No description provided for @emotion_surprised_startled.
  ///
  /// In en, this message translates to:
  /// **'Startled'**
  String get emotion_surprised_startled;

  /// No description provided for @emotion_surprised_startled_shocked.
  ///
  /// In en, this message translates to:
  /// **'Shocked'**
  String get emotion_surprised_startled_shocked;

  /// No description provided for @emotion_surprised_startled_dismayed.
  ///
  /// In en, this message translates to:
  /// **'Dismayed'**
  String get emotion_surprised_startled_dismayed;

  /// No description provided for @emotion_surprised_confused.
  ///
  /// In en, this message translates to:
  /// **'Confused'**
  String get emotion_surprised_confused;

  /// No description provided for @emotion_surprised_confused_disillusioned.
  ///
  /// In en, this message translates to:
  /// **'Disillusioned'**
  String get emotion_surprised_confused_disillusioned;

  /// No description provided for @emotion_surprised_confused_perplexed.
  ///
  /// In en, this message translates to:
  /// **'Perplexed'**
  String get emotion_surprised_confused_perplexed;

  /// No description provided for @emotion_surprised_amazed.
  ///
  /// In en, this message translates to:
  /// **'Amazed'**
  String get emotion_surprised_amazed;

  /// No description provided for @emotion_surprised_amazed_astonished.
  ///
  /// In en, this message translates to:
  /// **'Astonished'**
  String get emotion_surprised_amazed_astonished;

  /// No description provided for @emotion_surprised_amazed_awe.
  ///
  /// In en, this message translates to:
  /// **'Awe'**
  String get emotion_surprised_amazed_awe;

  /// No description provided for @emotion_surprised_excited.
  ///
  /// In en, this message translates to:
  /// **'Excited'**
  String get emotion_surprised_excited;

  /// No description provided for @emotion_surprised_excited_eager.
  ///
  /// In en, this message translates to:
  /// **'Eager'**
  String get emotion_surprised_excited_eager;

  /// No description provided for @emotion_surprised_excited_energetic.
  ///
  /// In en, this message translates to:
  /// **'Energetic'**
  String get emotion_surprised_excited_energetic;

  /// No description provided for @emotion_disgusted.
  ///
  /// In en, this message translates to:
  /// **'Disgusted'**
  String get emotion_disgusted;

  /// No description provided for @emotion_disgusted_disapproving.
  ///
  /// In en, this message translates to:
  /// **'Disapproving'**
  String get emotion_disgusted_disapproving;

  /// No description provided for @emotion_disgusted_disapproving_judgmental.
  ///
  /// In en, this message translates to:
  /// **'Judgmental'**
  String get emotion_disgusted_disapproving_judgmental;

  /// No description provided for @emotion_disgusted_disapproving_embarrassed.
  ///
  /// In en, this message translates to:
  /// **'Embarrassed'**
  String get emotion_disgusted_disapproving_embarrassed;

  /// No description provided for @emotion_disgusted_disappointed.
  ///
  /// In en, this message translates to:
  /// **'Disappointed'**
  String get emotion_disgusted_disappointed;

  /// No description provided for @emotion_disgusted_disappointed_appalled.
  ///
  /// In en, this message translates to:
  /// **'Appalled'**
  String get emotion_disgusted_disappointed_appalled;

  /// No description provided for @emotion_disgusted_disappointed_revolted.
  ///
  /// In en, this message translates to:
  /// **'Revolted'**
  String get emotion_disgusted_disappointed_revolted;

  /// No description provided for @emotion_disgusted_awful.
  ///
  /// In en, this message translates to:
  /// **'Awful'**
  String get emotion_disgusted_awful;

  /// No description provided for @emotion_disgusted_awful_nauseated.
  ///
  /// In en, this message translates to:
  /// **'Nauseated'**
  String get emotion_disgusted_awful_nauseated;

  /// No description provided for @emotion_disgusted_awful_detestable.
  ///
  /// In en, this message translates to:
  /// **'Detestable'**
  String get emotion_disgusted_awful_detestable;

  /// No description provided for @emotion_disgusted_repelled.
  ///
  /// In en, this message translates to:
  /// **'Repelled'**
  String get emotion_disgusted_repelled;

  /// No description provided for @emotion_disgusted_repelled_horrified.
  ///
  /// In en, this message translates to:
  /// **'Horrified'**
  String get emotion_disgusted_repelled_horrified;

  /// No description provided for @emotion_disgusted_repelled_hesitant.
  ///
  /// In en, this message translates to:
  /// **'Hesitant'**
  String get emotion_disgusted_repelled_hesitant;

  /// No description provided for @emotion_bad.
  ///
  /// In en, this message translates to:
  /// **'Bad'**
  String get emotion_bad;

  /// No description provided for @emotion_bad_tired.
  ///
  /// In en, this message translates to:
  /// **'Tired'**
  String get emotion_bad_tired;

  /// No description provided for @emotion_bad_tired_sleepy.
  ///
  /// In en, this message translates to:
  /// **'Sleepy'**
  String get emotion_bad_tired_sleepy;

  /// No description provided for @emotion_bad_tired_unfocused.
  ///
  /// In en, this message translates to:
  /// **'Unfocused'**
  String get emotion_bad_tired_unfocused;

  /// No description provided for @emotion_bad_stressed.
  ///
  /// In en, this message translates to:
  /// **'Stressed'**
  String get emotion_bad_stressed;

  /// No description provided for @emotion_bad_stressed_out_of_control.
  ///
  /// In en, this message translates to:
  /// **'Out of control'**
  String get emotion_bad_stressed_out_of_control;

  /// No description provided for @emotion_bad_stressed_overwhelmed.
  ///
  /// In en, this message translates to:
  /// **'Overwhelmed'**
  String get emotion_bad_stressed_overwhelmed;

  /// No description provided for @emotion_bad_busy.
  ///
  /// In en, this message translates to:
  /// **'Busy'**
  String get emotion_bad_busy;

  /// No description provided for @emotion_bad_busy_pressured.
  ///
  /// In en, this message translates to:
  /// **'Pressured'**
  String get emotion_bad_busy_pressured;

  /// No description provided for @emotion_bad_busy_rushed.
  ///
  /// In en, this message translates to:
  /// **'Rushed'**
  String get emotion_bad_busy_rushed;

  /// No description provided for @emotion_bad_bored.
  ///
  /// In en, this message translates to:
  /// **'Bored'**
  String get emotion_bad_bored;

  /// No description provided for @emotion_bad_bored_indifferent.
  ///
  /// In en, this message translates to:
  /// **'Indifferent'**
  String get emotion_bad_bored_indifferent;

  /// No description provided for @emotion_bad_bored_apathetic.
  ///
  /// In en, this message translates to:
  /// **'Apathetic'**
  String get emotion_bad_bored_apathetic;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['de', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'de':
      return AppLocalizationsDe();
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
