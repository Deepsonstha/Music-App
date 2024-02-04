import 'package:flutter/foundation.dart';
import 'package:music_app/features/home/data/models/music_model.dart';
import 'package:music_app/features/music/domain/entity/artist_entity.dart';

class ArtistModel extends ArtistEntity {
  ArtistModel({
    String? id,
    String? artist,
    int? numberOfAlbums,
    int? numberOfTracks,
    List<MusicModel>? songs,
  }) : super(
          id: id,
          artist: artist,
          numberOfAlbums: numberOfAlbums,
          numberOfTracks: numberOfTracks,
          songs: songs,
        );
  factory ArtistModel.fromMap(Map<String, dynamic> json) => ArtistModel(
        id: json["id"],
        artist: json["artist"],
        numberOfAlbums: json["numberOfAlbums"],
        numberOfTracks: json["numberOfTracks"],
        songs: json["songs"] == null ? [] : List<MusicModel>.from(json["songs"]!.map((x) => MusicModel.fromMap(x))),
      );

  @override
  Map<String, dynamic> toMap() => {
        "id": id,
        "artist": artist,
        "numberOfAlbums": numberOfAlbums,
        "numberOfTracks": numberOfTracks,
        "songs": songs == null ? [] : List<dynamic>.from(songs!.map((x) => x.toMap())),
      };

  @override
  String toString() {
    return 'ArtistModel(id: $id, artist: $artist, numberOfAlbums: $numberOfAlbums, numberOfTracks: $numberOfTracks, songs: $songs)';
  }

  @override
  bool operator ==(covariant ArtistModel other) {
    if (identical(this, other)) return true;

    return other.id == id && other.artist == artist && other.numberOfAlbums == numberOfAlbums && other.numberOfTracks == numberOfTracks && listEquals(other.songs, songs);
  }

  @override
  int get hashCode {
    return id.hashCode ^ artist.hashCode ^ numberOfAlbums.hashCode ^ numberOfTracks.hashCode ^ songs.hashCode;
  }
}
