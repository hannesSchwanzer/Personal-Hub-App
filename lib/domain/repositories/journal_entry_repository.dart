import 'package:personal_hub_app/domain/entities/body_map_drawing.dart';
import 'package:personal_hub_app/domain/entities/journal_entry_entity.dart';

abstract class JournalEntryRepository {
    Future<void> createEntry({
        required String entry,
        String? emotionLevel1,
        String? emotionLevel2,
        String? emotionLevel3,
        BodyMapDrawing? bodyMapDrawing,
    });
    Stream<List<JournalEntryEntity>> watchAllEntries();
}
