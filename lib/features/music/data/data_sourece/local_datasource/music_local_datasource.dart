// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:music_app/core/errors/app_error_handler.dart';
import 'package:music_app/features/music/data/model/folder_model.dart';
import 'package:on_audio_query/on_audio_query.dart';

class MusicLocalDataSource {
  final OnAudioQuery onAudioQuery;
  MusicLocalDataSource({
    required this.onAudioQuery,
  });

  Future<Either<AppErrorHandler, List<FolderModel>>> getSongsFolder() async {
    try {
      final List<String> allQueryFolders = await onAudioQuery.queryAllPath();

      List<FolderModel> listOfFolders(List<String> paths) {
        return paths
            .map(
              (e) => FolderModel(
                path: e,
                folderName: e.split('/').last,
              ),
            )
            .toList();
      }

      return Right(listOfFolders(allQueryFolders));
    } catch (e) {
      return Left(
        AppErrorHandler(
          message: e.toString(),
          status: false,
        ),
      );
    }
  }
}
