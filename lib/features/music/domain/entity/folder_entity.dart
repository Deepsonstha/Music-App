// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:music_app/features/home/domain/entity/music_entity.dart';

FolderEntity folderEntityFromMap(String str) => FolderEntity.fromMap(json.decode(str));

String folderEntityToMap(FolderEntity data) => json.encode(data.toMap());

class FolderEntity {
  final String? path;
  final String? folderName;
  final int? numOfSongs;
  final List<MusicEntity>? songs;

  FolderEntity({
    this.path,
    this.folderName,
    this.numOfSongs,
    this.songs,
  });

  factory FolderEntity.fromMap(Map<String, dynamic> json) => FolderEntity(
        path: json["path"],
        folderName: json["folderName"],
        numOfSongs: json["numOfSongs"],
        songs: json["songs"] == null ? [] : List<MusicEntity>.from(json["songs"]!.map((x) => MusicEntity.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "path": path,
        "folderName": folderName,
        "numOfSongs": numOfSongs,
        "songs": songs == null ? [] : List<dynamic>.from(songs!.map((x) => x.toMap())),
      };

  FolderEntity copyWith({
    String? path,
    String? folderName,
    int? numOfSongs,
    List<MusicEntity>? songs,
  }) {
    return FolderEntity(
      path: path ?? this.path,
      folderName: folderName ?? this.folderName,
      numOfSongs: numOfSongs ?? this.numOfSongs,
      songs: songs ?? this.songs,
    );
  }

  @override
  String toString() {
    return 'FolderEntity(path: $path, folderName: $folderName, numOfSongs: $numOfSongs, songs: $songs)';
  }

  @override
  bool operator ==(covariant FolderEntity other) {
    if (identical(this, other)) return true;

    return other.path == path && other.folderName == folderName && other.numOfSongs == numOfSongs && listEquals(other.songs, songs);
  }

  @override
  int get hashCode {
    return path.hashCode ^ folderName.hashCode ^ numOfSongs.hashCode ^ songs.hashCode;
  }
}
