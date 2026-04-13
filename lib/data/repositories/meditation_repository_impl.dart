import 'package:personal_hub_app/data/database/daos/meditation/meditation_dao.dart';
import 'package:personal_hub_app/data/mappers/mediation_mapper.dart';
import 'package:personal_hub_app/domain/entities/meditation/meditation_entry.dart';
import 'package:personal_hub_app/domain/repositories/meditation_repository.dart';
import 'package:uuid/uuid.dart';

class MeditationRepositoryImpl implements MeditationRepository {
  final MeditationDao _mediationDao;
  final _uuid = const Uuid();

  MeditationRepositoryImpl(this._mediationDao);

  @override
  Future<void> createEntry({
    required String title,
    required String description,
    required MeditationType type,
    ChakraType? chakraType,
    required List<CognitiveType> cognitiveTypes,
    required MeditationLevel level,
    required List<RepeatingAudio> audioSections,
    String? tutorialVideoPath,
  }) {
    final entry = MeditationEntry.create(
      id: _uuid.v4(),
      title: title,
      description: description,
      type: type,
      chakraType: chakraType,
      cognitiveTypes: cognitiveTypes,
      level: level,
      audioSections: audioSections,
      tutorialVideoPath: tutorialVideoPath,
    );
    return _mediationDao.insertEntry(entry.toCompanion());
  }

  @override
  Stream<List<MeditationEntry>> watchAllEntries() {
    return _mediationDao.watchAll().map(
      (entries) => entries.map((entry) => entry.toEntity()).toList(),
    );
  }

  @override
  Future<List<MeditationEntry>> getAllEntries() {
    return _mediationDao.getAllEntries().then(
      (entries) => entries.map((entry) => entry.toEntity()).toList(),
    );
  }

  @override
  Future<void> deleteEntry(String id) {
    return _mediationDao.deleteEntry(id);
  }

  @override
  Future<void> deleteAllEntries() {
    return _mediationDao.deleteAllEntries();
  }

  @override
  Future<void> updateEntry(MeditationEntry entry) {
    return _mediationDao.updateEntry(entry.toCompanion());
  }
}

