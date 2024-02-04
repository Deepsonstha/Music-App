import 'package:flutter/foundation.dart';
import 'package:music_app/features/home/data/models/music_model.dart';
import 'package:music_app/features/music/domain/entity/album_entity.dart';

class AlbumModel extends AlbumEntity {
  AlbumModel({
    String? songId,
    String? album,
    String? artist,
    String? artistId,
    int? numOfSongs,
    List<MusicModel>? songs,
  }) : super(
          songId: songId,
          album: album,
          artist: artist,
          artistId: artistId,
          numOfSongs: numOfSongs,
          songs: songs,
        );

  factory AlbumModel.fromMap(Map<String, dynamic> json) => AlbumModel(
        songId: json["songID"],
        album: json["album"],
        artist: json["artist"],
        artistId: json["artistID"],
        numOfSongs: json["numOfSongs"],
        songs: json["songs"] == null ? [] : List<MusicModel>.from(json["songs"]!.map((x) => MusicModel.fromMap(x))),
      );

  @override
  Map<String, dynamic> toMap() => {
        "songID": songId,
        "album": album,
        "artist": artist,
        "artistID": artistId,
        "numOfSongs": numOfSongs,
        "songs": songs == null ? [] : List<dynamic>.from(songs!.map((x) => x.toMap())),
      };

  @override
  String toString() {
    return 'AlbumModel(songId: $songId, album: $album, artist: $artist, artistId: $artistId, numOfSongs: $numOfSongs, songs: $songs)';
  }

  @override
  bool operator ==(covariant AlbumModel other) {
    if (identical(this, other)) return true;

    return other.songId == songId && other.album == album && other.artist == artist && other.artistId == artistId && other.numOfSongs == numOfSongs && listEquals(other.songs, songs);
  }

  @override
  int get hashCode {
    return songId.hashCode ^ album.hashCode ^ artist.hashCode ^ artistId.hashCode ^ numOfSongs.hashCode ^ songs.hashCode;
  }
}
