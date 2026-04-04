import 'package:personal_hub_app/data/database/daos/journal_reflection_dao.dart';
import 'package:personal_hub_app/data/mappers/journal_reflection_mapper.dart';
import 'package:personal_hub_app/domain/entities/journal_reflection.dart';
import 'package:personal_hub_app/domain/repositories/journal_reflection_repository.dart';
import 'package:uuid/uuid.dart';

class JournalReflectionRepositoryImpl implements JournalReflectionRepository {
  final JournalReflectionDao journalReflectionDao;
  final _uuid = const Uuid();

  JournalReflectionRepositoryImpl(this.journalReflectionDao);

  @override
  Stream<List<JournalReflectionEntity>> watchAllReflections() {
    return journalReflectionDao.watchAll().map(
      (reflections) =>
          reflections.map((reflection) => reflection.toEntity()).toList(),
    );
  }

  @override
  Stream<List<JournalReflectionEntity>> watchReflectionsByJournalEntryId(
    String journalEntryId,
  ) {
    return journalReflectionDao
        .watchByJournalEntryId(journalEntryId)
        .map(
          (reflections) =>
              reflections.map((reflection) => reflection.toEntity()).toList(),
        );
  }

  @override
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
  }) {
    final now = DateTime.now();
    final newReflection = JournalReflectionEntity.create(
      id: _uuid.v4(),
      guessedEmotionLevel1: guessedEmotionLevel1,
      guessedEmotionLevel2: guessedEmotionLevel2,
      guessedEmotionLevel3: guessedEmotionLevel3,
      currentEmotionLevel1: currentEmotionLevel1,
      currentEmotionLevel2: currentEmotionLevel2,
      currentEmotionLevel3: currentEmotionLevel3,
      reflection: reflection,
      journalEntryId: journalEntryId,
      now: now,
    );
    return journalReflectionDao.insertReflection(newReflection.toCompanion());
  }
}
