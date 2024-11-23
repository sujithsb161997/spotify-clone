import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:spotify_clone/domain/entities/song/song.dart';

class SongModel {
  String? title;
  String? artist;
  String? duration;
  String? imageUrl;
  String? audioUrl;
  Timestamp? releaseDate;

  SongModel(
      {required this.title,
      required this.artist,
      required this.duration,
      required this.imageUrl,
      required this.audioUrl,
      required this.releaseDate});

  SongModel.fromJson(Map<String, dynamic> data) {
    title = data['title'];
    artist = data['artist'];
    duration = data['duration'];
    imageUrl = data['imageUrl'];
    audioUrl = data['audioUrl'];
    releaseDate = data['releaseDate'];
  }
}

extension SongModelX on SongModel {
  SongEntity toEntity() {
    return SongEntity(
        title: title!,
        artist: artist!,
        duration: duration!,
        imageUrl: imageUrl!,
        audioUrl: audioUrl!,
        releaseDate: releaseDate!);
  }
}
