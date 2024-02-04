import 'package:flutter/foundation.dart';
import 'package:music_app/features/home/data/models/music_model.dart';
import 'package:music_app/features/music/domain/entity/folder_entity.dart';

class FolderModel extends FolderEntity {
  FolderModel({
    String? path,
    String? folderName,
    int? numOfSongs,
    List<MusicModel>? songs,
  }) : super(
          path: path,
          folderName: folderName,
          numOfSongs: numOfSongs,
          songs: songs,
        );

  factory FolderModel.fromMap(Map<String, dynamic> json) => FolderModel(
        path: json["path"],
        folderName: json["folderName"],
        numOfSongs: json["numOfSongs"],
        songs: json["songs"] == null ? [] : List<MusicModel>.from(json["songs"]!.map((x) => MusicModel.fromMap(x))),
      );

  @override
  Map<String, dynamic> toMap() => {
        "path": path,
        "folderName": folderName,
        "numOfSongs": numOfSongs,
        "songs": songs == null ? [] : List<dynamic>.from(songs!.map((x) => x.toMap())),
      };

  @override
  String toString() {
    return 'FolderModel(path: $path, folderName: $folderName, numOfSongs: $numOfSongs, songs: $songs)';
  }

  @override
  bool operator ==(covariant FolderModel other) {
    if (identical(this, other)) return true;

    return other.path == path && other.folderName == folderName && other.numOfSongs == numOfSongs && listEquals(other.songs, songs);
  }

  @override
  int get hashCode {
    return path.hashCode ^ folderName.hashCode ^ numOfSongs.hashCode ^ songs.hashCode;
  }
}
