import 'package:personal_hub_app/domain/entities/meditation/meditation_entry.dart';
import 'package:personal_hub_app/domain/entities/audio_file.dart';

abstract class MeditationRepository {
  Future<void> createEntry({
    required String title,
    required String description,
    required MeditationType type,
    ChakraType? chakraType,
    required List<CognitiveType> cognitiveTypes,
    required MeditationLevel level,
    required List<RepeatingAudio> audioSections,
    String? tutorialVideoPath,
  });

  Stream<List<MeditationEntry>> watchAllEntries();

  Future<List<MeditationEntry>> getAllEntries();

  Future<void> deleteEntry(String id);

  Future<void> updateEntry(MeditationEntry entry);

  Future<void> deleteAllEntries();
}
