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
  String get exportData => 'Daten exportieren';

  @override
  String get exportSuccess => 'Daten erfolgreich exportiert';

  @override
  String get exportFailed => 'Exportieren der Daten fehlgeschlagen';

  @override
  String get exportCancelled => 'Export abgebrochen';

  @override
  String get importData => 'Daten importieren';

  @override
  String get importSuccess => 'Daten erfolgreich importiert';

  @override
  String get importFailed => 'Importieren der Daten fehlgeschlagen';

  @override
  String get importCancelled => 'Import abgebrochen';

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

  @override
  String get rightInTheFeels => 'Mitten ins Gefühl';

  @override
  String get emotionTracker => 'Gefühlstracker';

  @override
  String get emotionTrackerDesc =>
      'Protokolliere und verfolge deine täglichen Gefühle';

  @override
  String get emotionExplorer => 'Gefühls-Explorer';

  @override
  String get emotionExplorerDesc => 'Entdecke und verstehe deine Gefühle';

  @override
  String get commsCheck => 'Kommunikations-Check';

  @override
  String get commsCheckDesc => 'Checke bei dir und anderen ein';

  @override
  String get emotionsRegulator => 'Gefühlsregler';

  @override
  String get emotionsRegulatorDesc =>
      'Werkzeuge zur Regulierung deiner Gefühle';

  @override
  String get reflectionCorner => 'Reflexions-Ecke';

  @override
  String get reflectionCornerDesc => 'Reflektiere deine emotionale Reise';

  @override
  String get emotionTrackerTitle => 'Verfolge deine Gefühle';

  @override
  String get emotionTrackerSectionFeeling =>
      'Welches Gefühl empfindest du im Moment?';

  @override
  String get emotionTrackerSectionFeelingTooltip =>
      'Wähle das Gefühl aus, das am ehesten zutrifft. Wenn du dich „neutral“ fühlst oder unsicher bist, versuche, mit deinem Körper in Kontakt zu treten und auf körperliche Empfindungen zu achten. Auf Grundlage dieser Empfindungen versuche, intellektuell zu erraten, was du vielleicht fühlst. Achte beim Raten darauf, ob sich das stimmig oder unstimmig anfühlt. Am Anfang ist es nicht wichtig, ob du die richtige Antwort findest. Es zählt, dass du regelmäßig bewusst versuchst, Zugang zu deinen Gefühlen zu bekommen.';

  @override
  String get emotionTrackerSectionJournal =>
      'Schreibe ein wenig darüber, was du fühlst.';

  @override
  String get emotionTrackerSectionJournalTooltip =>
      'Halte deine Gedanken schriftlich fest und versuche, deine Gefühle so gut wie möglich zu formulieren. Diese Einträge werden in der Reflexions-Ecke verwendet.';

  @override
  String get emotionTrackerJournalHint => 'Schreibe über deine Gefühle...';

  @override
  String get emotionTrackerSectionBodyMap => 'Zeichne eine Körperkarte.';

  @override
  String get emotionTrackerSectionBodyMapTooltip =>
      'Zeichne die Umrisse deines Körpers und schattiere mit verschiedenen Farben die Bereiche ein, in denen du Empfindungen spürst. Schattiere dunkler für intensive Empfindungen und heller für leichte Empfindungen.';

  @override
  String get emotionTrackerSaveEntry => 'Eintrag speichern';

  @override
  String get emotionTrackerEntrySaved => 'Eintrag gespeichert';

  @override
  String get emotionTrackerClearEntry => 'Eintrag löschen';

  @override
  String get reflectionCornerTitle => 'Reflexions-Ecke';

  @override
  String get reflectionCornerNoEntries =>
      'Noch keine Einträge. Beginne damit, deine Gefühle festzuhalten, um sie hier anzuzeigen.';

  @override
  String reflectionCornerEntryTitle(Object entryDate) {
    return 'Hier ist dein Journaleintrag vom $entryDate';
  }

  @override
  String get reflectionCornerEmotionEntry =>
      'Welches Gefühl glaubst du, hattest du zu diesem Zeitpunkt?';

  @override
  String get reflectionCornerEmotionNow =>
      'Wenn du diesen Eintrag jetzt ansiehst, wie fühlst du dich dabei?';

  @override
  String get reflectionCornerReflectionPrompt =>
      'Nimm dir einen Moment Zeit, um über deinen vorherigen Eintrag nachzudenken.\nWas hältst du von deinem damaligen Geisteszustand?';

  @override
  String get reflectionCornerReflectionHint => 'Schreibe deine Gedanken auf...';

  @override
  String get reflectionCornerSubmitReflection => 'Absenden';

  @override
  String get reflectionCornerReflectionSaved => 'Reflexion gespeichert';

  @override
  String get commsCheckStepWho =>
      'Mit wem möchtest du kommunizieren? Wie ist deine Beziehung zu dieser Person?';

  @override
  String get commsCheckHintWho => 'Name, Beziehung, Kontext...';

  @override
  String get commsCheckStepWhatToTell => 'Was möchtest du dieser Person sagen?';

  @override
  String get commsCheckHintMessage => 'Deine Nachricht';

  @override
  String get commsCheckStepFeeling => 'Wie fühlst du dich dabei, das zu sagen?';

  @override
  String get commsCheckStepExpectedReaction =>
      'Wie erwartest du, dass diese Person reagiert?';

  @override
  String get commsCheckHintExpectedReaction => 'Erwartete Reaktion';

  @override
  String get commsCheckStepWantedReaction =>
      'Wie möchtest du eigentlich, dass diese Person reagiert?';

  @override
  String get commsCheckHintWantedReaction => 'Gewünschte Reaktion';

  @override
  String get commsCheckStepResponseAfterReaction =>
      'Was würdest du sagen, nachdem sie so reagiert hat?';

  @override
  String get commsCheckHintResponseAfterReaction => 'Deine Antwort';

  @override
  String get commsCheckStepReflection =>
      'Reflektiere über das Geschriebene. Wie fühlst du dich in Bezug auf die Gesamtsituation?';

  @override
  String get commsCheckHintReflection => 'Reflexion';

  @override
  String get commsCheckSubmit => 'Absenden';

  @override
  String get commsCheckSaved => 'Kommunikations-Check gespeichert!';

  @override
  String get back => 'Zurück';

  @override
  String get emotion_happy => 'Glücklich';

  @override
  String get emotion_happy_optimistic => 'Optimistisch';

  @override
  String get emotion_happy_optimistic_inspired => 'Inspiriert';

  @override
  String get emotion_happy_optimistic_hopeful => 'Hoffnungsvoll';

  @override
  String get emotion_happy_trusting => 'Vertrauensvoll';

  @override
  String get emotion_happy_trusting_intimate => 'Intim';

  @override
  String get emotion_happy_trusting_sensitive => 'Sensibel';

  @override
  String get emotion_happy_peaceful => 'Friedlich';

  @override
  String get emotion_happy_peaceful_thankful => 'Dankbar';

  @override
  String get emotion_happy_peaceful_loving => 'Liebevoll';

  @override
  String get emotion_happy_powerful => 'Kraftvoll';

  @override
  String get emotion_happy_powerful_creative => 'Kreativ';

  @override
  String get emotion_happy_powerful_courageous => 'Mutig';

  @override
  String get emotion_happy_accepted => 'Akzeptiert';

  @override
  String get emotion_happy_accepted_valued => 'Geschätzt';

  @override
  String get emotion_happy_accepted_respected => 'Respektiert';

  @override
  String get emotion_happy_proud => 'Stolz';

  @override
  String get emotion_happy_proud_confident => 'Selbstbewusst';

  @override
  String get emotion_happy_proud_successful => 'Erfolgreich';

  @override
  String get emotion_happy_interested => 'Interessiert';

  @override
  String get emotion_happy_interested_inquisitive => 'Wissbegierig';

  @override
  String get emotion_happy_interested_curious => 'Neugierig';

  @override
  String get emotion_happy_content => 'Zufrieden';

  @override
  String get emotion_happy_content_joyful => 'Freudig';

  @override
  String get emotion_happy_content_free => 'Frei';

  @override
  String get emotion_happy_playful => 'Verspielt';

  @override
  String get emotion_happy_playful_cheeky => 'Frech';

  @override
  String get emotion_happy_playful_aroused => 'Erregt';

  @override
  String get emotion_angry => 'Wütend';

  @override
  String get emotion_angry_critical => 'Kritisch';

  @override
  String get emotion_angry_critical_dismissive => 'Herablassend';

  @override
  String get emotion_angry_critical_skeptical => 'Skeptisch';

  @override
  String get emotion_angry_distant => 'Distanziert';

  @override
  String get emotion_angry_distant_numb => 'Gefühllos';

  @override
  String get emotion_angry_distant_withdrawn => 'Zurückgezogen';

  @override
  String get emotion_angry_frustrated => 'Frustriert';

  @override
  String get emotion_angry_frustrated_annoyed => 'Genervt';

  @override
  String get emotion_angry_frustrated_infuriated => 'Aufgebracht';

  @override
  String get emotion_angry_aggressive => 'Aggressiv';

  @override
  String get emotion_angry_aggressive_hostile => 'Feindselig';

  @override
  String get emotion_angry_aggressive_provoked => 'Provoziert';

  @override
  String get emotion_angry_mad => 'Zornig';

  @override
  String get emotion_angry_mad_jealous => 'Eifersüchtig';

  @override
  String get emotion_angry_mad_furious => 'Wütend';

  @override
  String get emotion_angry_bitter => 'Verbittert';

  @override
  String get emotion_angry_bitter_violated => 'Verletzt';

  @override
  String get emotion_angry_bitter_indignant => 'Empört';

  @override
  String get emotion_angry_humiliated => 'Gedemütigt';

  @override
  String get emotion_angry_humiliated_disrespected => 'Missachtet';

  @override
  String get emotion_angry_humiliated_ridiculed => 'Verspottet';

  @override
  String get emotion_angry_let_down => 'Enttäuscht';

  @override
  String get emotion_angry_let_down_resentful => 'Grollend';

  @override
  String get emotion_angry_let_down_betrayed => 'Verraten';

  @override
  String get emotion_sad => 'Traurig';

  @override
  String get emotion_sad_hurt => 'Verletzt';

  @override
  String get emotion_sad_hurt_embarrassed => 'Blamiert';

  @override
  String get emotion_sad_hurt_disappointed => 'Enttäuscht';

  @override
  String get emotion_sad_depressed => 'Depressiv';

  @override
  String get emotion_sad_depressed_inferior => 'Unterlegen';

  @override
  String get emotion_sad_depressed_empty => 'Leer';

  @override
  String get emotion_sad_guilty => 'Schuldig';

  @override
  String get emotion_sad_guilty_remorseful => 'Reumütig';

  @override
  String get emotion_sad_guilty_ashamed => 'Beschämt';

  @override
  String get emotion_sad_despair => 'Verzweifelt';

  @override
  String get emotion_sad_despair_powerless => 'Machtlos';

  @override
  String get emotion_sad_despair_grief => 'Trauer';

  @override
  String get emotion_sad_vulnerable => 'Verletzlich';

  @override
  String get emotion_sad_vulnerable_fragile => 'Fragil';

  @override
  String get emotion_sad_vulnerable_victimized => 'Victimisiert';

  @override
  String get emotion_sad_lonely => 'Einsam';

  @override
  String get emotion_sad_lonely_abandoned => 'Verlassen';

  @override
  String get emotion_sad_lonely_isolated => 'Isoliert';

  @override
  String get emotion_fearful => 'Ängstlich';

  @override
  String get emotion_fearful_scared => 'Verängstigt';

  @override
  String get emotion_fearful_scared_helpless => 'Hilflos';

  @override
  String get emotion_fearful_scared_frightened => 'Furchtsam';

  @override
  String get emotion_fearful_anxious => 'Ängstlich';

  @override
  String get emotion_fearful_anxious_overwhelmed => 'Überfordert';

  @override
  String get emotion_fearful_anxious_worried => 'Besorgt';

  @override
  String get emotion_fearful_insecure => 'Unsicher';

  @override
  String get emotion_fearful_insecure_inadequate => 'Unzureichend';

  @override
  String get emotion_fearful_insecure_inferior => 'Unterlegen';

  @override
  String get emotion_fearful_weak => 'Schwach';

  @override
  String get emotion_fearful_weak_worthless => 'Wertlos';

  @override
  String get emotion_fearful_weak_insignificant => 'Unbedeutend';

  @override
  String get emotion_fearful_rejected => 'Abgelehnt';

  @override
  String get emotion_fearful_rejected_excluded => 'Ausgeschlossen';

  @override
  String get emotion_fearful_rejected_persecuted => 'Verfolgt';

  @override
  String get emotion_fearful_threatened => 'Bedroht';

  @override
  String get emotion_fearful_threatened_nervous => 'Nervös';

  @override
  String get emotion_fearful_threatened_exposed => 'Bloßgestellt';

  @override
  String get emotion_surprised => 'Überrascht';

  @override
  String get emotion_surprised_startled => 'Erschrocken';

  @override
  String get emotion_surprised_startled_shocked => 'Schockiert';

  @override
  String get emotion_surprised_startled_dismayed => 'Bestürzt';

  @override
  String get emotion_surprised_confused => 'Verwirrt';

  @override
  String get emotion_surprised_confused_disillusioned => 'Ernüchtert';

  @override
  String get emotion_surprised_confused_perplexed => 'Ratlos';

  @override
  String get emotion_surprised_amazed => 'Erstaunt';

  @override
  String get emotion_surprised_amazed_astonished => 'Verblüfft';

  @override
  String get emotion_surprised_amazed_awe => 'Ehrfurcht';

  @override
  String get emotion_surprised_excited => 'Aufgeregt';

  @override
  String get emotion_surprised_excited_eager => 'Eifrig';

  @override
  String get emotion_surprised_excited_energetic => 'Energiegeladen';

  @override
  String get emotion_disgusted => 'Angewidert';

  @override
  String get emotion_disgusted_disapproving => 'Missbilligend';

  @override
  String get emotion_disgusted_disapproving_judgmental => 'Urteilend';

  @override
  String get emotion_disgusted_disapproving_embarrassed => 'Beschämt';

  @override
  String get emotion_disgusted_disappointed => 'Enttäuscht';

  @override
  String get emotion_disgusted_disappointed_appalled => 'Entsetzt';

  @override
  String get emotion_disgusted_disappointed_revolted => 'Abgestoßen';

  @override
  String get emotion_disgusted_awful => 'Schrecklich';

  @override
  String get emotion_disgusted_awful_nauseated => 'Übel';

  @override
  String get emotion_disgusted_awful_detestable => 'Verabscheuungswürdig';

  @override
  String get emotion_disgusted_repelled => 'Abgestoßen';

  @override
  String get emotion_disgusted_repelled_horrified => 'Entsetzt';

  @override
  String get emotion_disgusted_repelled_hesitant => 'Zögerlich';

  @override
  String get emotion_bad => 'Schlecht';

  @override
  String get emotion_bad_tired => 'Müde';

  @override
  String get emotion_bad_tired_sleepy => 'Schläfrig';

  @override
  String get emotion_bad_tired_unfocused => 'Unkonzentriert';

  @override
  String get emotion_bad_stressed => 'Gestresst';

  @override
  String get emotion_bad_stressed_out_of_control => 'Außer Kontrolle';

  @override
  String get emotion_bad_stressed_overwhelmed => 'Überfordert';

  @override
  String get emotion_bad_busy => 'Beschäftigt';

  @override
  String get emotion_bad_busy_pressured => 'Unter Druck';

  @override
  String get emotion_bad_busy_rushed => 'Gehetzt';

  @override
  String get emotion_bad_bored => 'Gelangweilt';

  @override
  String get emotion_bad_bored_indifferent => 'Gleichgültig';

  @override
  String get emotion_bad_bored_apathetic => 'Apathisch';

  @override
  String get emotionExplorerTitle => 'Gefühls-Explorer';

  @override
  String get emotionExplorerNoEmotions => 'Keine Gefühle verfügbar';

  @override
  String get emotionExplorerTooltip =>
      'Schreibe für jedes Gefühl auf dieser Seite darüber, wann du dieses Gefühl am häufigsten empfindest.\nZum Beispiel könntest du zu „Wütend“ schreiben: „Ich werde oft wütend, wenn ich eigene Deadlines nicht einhalten kann.“';

  @override
  String get emotionExplorerQuestion => 'Wann fühlst du dieses Gefühl?';

  @override
  String get emotionExplorerJournalHint => 'Wann empfindest du dieses Gefühl?';
}
