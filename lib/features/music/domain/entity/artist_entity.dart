import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:music_app/features/home/domain/entity/music_entity.dart';

ArtistEntity artistEntityFromMap(String str) => ArtistEntity.fromMap(json.decode(str));

String artistEntityToMap(ArtistEntity data) => json.encode(data.toMap());

class ArtistEntity {
  final String? id;
  final String? artist;
  final int? numberOfAlbums;
  final int? numberOfTracks;
  final List<MusicEntity>? songs;

  ArtistEntity({
    this.id,
    this.artist,
    this.numberOfAlbums,
    this.numberOfTracks,
    this.songs,
  });

  factory ArtistEntity.fromMap(Map<String, dynamic> json) => ArtistEntity(
        id: json["id"],
        artist: json["artist"],
        numberOfAlbums: json["numberOfAlbums"],
        numberOfTracks: json["numberOfTracks"],
        songs: json["songs"] == null ? [] : List<MusicEntity>.from(json["songs"]!.map((x) => MusicEntity.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "artist": artist,
        "numberOfAlbums": numberOfAlbums,
        "numberOfTracks": numberOfTracks,
        "songs": songs == null ? [] : List<dynamic>.from(songs!.map((x) => x.toMap())),
      };

  ArtistEntity copyWith({
    String? id,
    String? artist,
    int? numberOfAlbums,
    int? numberOfTracks,
    List<MusicEntity>? songs,
  }) {
    return ArtistEntity(
      id: id ?? this.id,
      artist: artist ?? this.artist,
      numberOfAlbums: numberOfAlbums ?? this.numberOfAlbums,
      numberOfTracks: numberOfTracks ?? this.numberOfTracks,
      songs: songs ?? this.songs,
    );
  }

  @override
  String toString() {
    return 'ArtistEntity(id: $id, artist: $artist, numberOfAlbums: $numberOfAlbums, numberOfTracks: $numberOfTracks, songs: $songs)';
  }

  @override
  bool operator ==(covariant ArtistEntity other) {
    if (identical(this, other)) return true;

    return other.id == id && other.artist == artist && other.numberOfAlbums == numberOfAlbums && other.numberOfTracks == numberOfTracks && listEquals(other.songs, songs);
  }

  @override
  int get hashCode {
    return id.hashCode ^ artist.hashCode ^ numberOfAlbums.hashCode ^ numberOfTracks.hashCode ^ songs.hashCode;
  }
}
