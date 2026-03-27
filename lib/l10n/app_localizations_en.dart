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
}
