// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';

import 'package:music_app/features/music/domain/entity/folder_entity.dart';

class MusicState {
  final bool isloading;
  final bool isSuccess;
  final List<FolderEntity>? listOfMusicFolders;
  final String? folderPath;

  MusicState({
    required this.isloading,
    required this.isSuccess,
    this.listOfMusicFolders,
    this.folderPath,
  });

  factory MusicState.initial() {
    return MusicState(
      isloading: false,
      isSuccess: false,
      listOfMusicFolders: [],
      folderPath: null,
    );
  }

  MusicState copyWith({
    bool? isloading,
    bool? isSuccess,
    List<FolderEntity>? listOfMusicFolders,
    String? folderPath,
  }) {
    return MusicState(
      isloading: isloading ?? this.isloading,
      isSuccess: isSuccess ?? this.isSuccess,
      listOfMusicFolders: listOfMusicFolders ?? this.listOfMusicFolders,
      folderPath: folderPath ?? this.folderPath,
    );
  }

  @override
  String toString() {
    return 'MusicState(isloading: $isloading, isSuccess: $isSuccess, listOfMusicFolders: $listOfMusicFolders, folderPath: $folderPath)';
  }

  @override
  bool operator ==(covariant MusicState other) {
    if (identical(this, other)) return true;

    return other.isloading == isloading && other.isSuccess == isSuccess && listEquals(other.listOfMusicFolders, listOfMusicFolders) && other.folderPath == folderPath;
  }

  @override
  int get hashCode {
    return isloading.hashCode ^ isSuccess.hashCode ^ listOfMusicFolders.hashCode ^ folderPath.hashCode;
  }
}
