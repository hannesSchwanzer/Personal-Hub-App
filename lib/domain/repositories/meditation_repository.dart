import 'package:personal_hub_app/domain/entities/meditation_entry.dart';
import 'package:personal_hub_app/domain/entities/audio_file.dart';

abstract class MeditationRepository {
  Future<void> createEntry({
    required String title,
    required String description,
    required MeditationType type,
    ChakraType? chakraType,
    required List<CognitiveType> cognitiveTypes,
    required MeditationLevel level,
    AudioFile? audioComplete,
    AudioFile? audioBeginning,
    AudioFile? audioRepeating,
    AudioFile? audioEnd,
    String? tutorialVideoPath,
  });

  Stream<List<MeditationEntry>> watchAllEntries();

  Future<List<MeditationEntry>> getAllEntries();

  Future<void> deleteEntry(String id);

  Future<void> updateEntry(MeditationEntry entry);

  Future<void> deleteAllEntries();
}
