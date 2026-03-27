// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get settings => 'Einstellungen';

  @override
  String get languagePickerTitle => 'Sprachauswahl';

  @override
  String get noAdditionalSettings => 'Keine weiteren Einstellungen';

  @override
  String get personalHub => 'Persönlicher Hub';

  @override
  String get hubFeatureGymTracking => 'Trainings-Tracking';

  @override
  String get hubFeatureGymTrackingDesc =>
      'Verfolge deine Workouts und Fortschritte';

  @override
  String get hubFeatureMeditation => 'Meditation';

  @override
  String get hubFeatureMeditationDesc => 'Achtsamkeit und Entspannung üben';

  @override
  String get hubFeatureFeels => 'Mitten ins Gefühl';

  @override
  String get hubFeatureFeelsDesc =>
      'Schreibe auf und reflektiere deine Gefühle';

  @override
  String get hubFeatureCooking => 'Kochen';

  @override
  String get hubFeatureCookingDesc =>
      'Entdecke und speichere deine Lieblingsrezepte';
}
