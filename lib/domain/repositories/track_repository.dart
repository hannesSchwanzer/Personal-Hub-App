import 'package:personal_hub_app/domain/entities/meditation/track_entity.dart';

abstract class TrackRepository {
  Future<void> createTrack(Track track);

  Stream<List<Track>> watchAllTracks();

  Future<List<Track>> getAllTracks();

  Future<void> deleteTrack(String id);

  Future<void> updateTrack(Track track);

  Future<void> deleteAllTracks();
}

