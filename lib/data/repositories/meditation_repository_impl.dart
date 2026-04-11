import 'package:personal_hub_app/data/database/daos/meditation_dao.dart';
import 'package:personal_hub_app/data/mappers/mediation_mapper.dart';
import 'package:personal_hub_app/domain/entities/meditation_entry.dart';
import 'package:personal_hub_app/domain/entities/audio_file.dart';
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
    required String type,
    String? chakraType,
    String? cognitiveType,
    required String level,
    AudioFile? audioComplete,
    AudioFile? audioBeginning,
    AudioFile? audioRepeating,
    AudioFile? audioEnd,
    String? tutorialVideoPath,
  }) {
    final entry = MeditationEntry.create(
      id: _uuid.v4(),
      title: title,
      description: description,
      type: type,
      chakraType: chakraType,
      cognitiveType: cognitiveType,
      level: level,
      audioComplete: audioComplete,
      audioBeginning: audioBeginning,
      audioRepeating: audioRepeating,
      audioEnd: audioEnd,
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
}

