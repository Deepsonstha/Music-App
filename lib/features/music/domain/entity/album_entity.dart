// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:music_app/features/home/domain/entity/music_entity.dart';

AlbumEntity albumEntityFromMap(String str) => AlbumEntity.fromMap(json.decode(str));

String albumEntityToMap(AlbumEntity data) => json.encode(data.toMap());

class AlbumEntity {
  final String? songId;
  final String? album;
  final String? artist;
  final String? artistId;
  final int? numOfSongs;
  final List<MusicEntity>? songs;

  AlbumEntity({
    this.songId,
    this.album,
    this.artist,
    this.artistId,
    this.numOfSongs,
    this.songs,
  });

  factory AlbumEntity.fromMap(Map<String, dynamic> json) => AlbumEntity(
        songId: json["songID"],
        album: json["album"],
        artist: json["artist"],
        artistId: json["artistID"],
        numOfSongs: json["numOfSongs"],
        songs: json["songs"] == null ? [] : List<MusicEntity>.from(json["songs"]!.map((x) => MusicEntity.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "songID": songId,
        "album": album,
        "artist": artist,
        "artistID": artistId,
        "numOfSongs": numOfSongs,
        "songs": songs == null ? [] : List<dynamic>.from(songs!.map((x) => x.toMap())),
      };

  AlbumEntity copyWith({
    String? songId,
    String? album,
    String? artist,
    String? artistId,
    int? numOfSongs,
    List<MusicEntity>? songs,
  }) {
    return AlbumEntity(
      songId: songId ?? this.songId,
      album: album ?? this.album,
      artist: artist ?? this.artist,
      artistId: artistId ?? this.artistId,
      numOfSongs: numOfSongs ?? this.numOfSongs,
      songs: songs ?? this.songs,
    );
  }

  @override
  String toString() {
    return 'AlbumEntity(songId: $songId, album: $album, artist: $artist, artistId: $artistId, numOfSongs: $numOfSongs, songs: $songs)';
  }

  @override
  bool operator ==(covariant AlbumEntity other) {
    if (identical(this, other)) return true;

    return other.songId == songId && other.album == album && other.artist == artist && other.artistId == artistId && other.numOfSongs == numOfSongs && listEquals(other.songs, songs);
  }

  @override
  int get hashCode {
    return songId.hashCode ^ album.hashCode ^ artist.hashCode ^ artistId.hashCode ^ numOfSongs.hashCode ^ songs.hashCode;
  }
}
