import 'package:personal_hub_app/domain/entities/journal_reflection.dart';

abstract class JournalReflectionRepository {
    Future<void> createReflection({
        required String entry,
        String? guessedEmotionLevel1,
        String? guessedEmotionLevel2,
        String? guessedEmotionLevel3,
        String? currentEmotionLevel1,
        String? currentEmotionLevel2,
        String? currentEmotionLevel3,
        required String reflection,
        required String journalEntryId,
    });
    Stream<List<JournalReflectionEntity>> watchAllReflections();
    Stream<List<JournalReflectionEntity>> watchReflectionsByJournalEntryId(String journalEntryId);
}
