import 'dart:developer';

import 'package:music_app/core/errors/app_error_handler.dart';
import 'package:music_app/core/utils/helper_function.dart';
import 'package:music_app/features/home/data/models/music_model.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:dartz/dartz.dart';

class AudioQueryDatasource {
  final OnAudioQuery onAudioQuery;
  AudioQueryDatasource({
    required this.onAudioQuery,
  });

  Future<Either<AppErrorHandler, List<MusicModel>>> getAllSongsFromDevice() async {
    final List<MusicModel> filterMp3Songs = [];
    final List<MusicModel> fetchedSongs = [];
    try {
      final allQuerySongs = await onAudioQuery.querySongs(
        sortType: SongSortType.ALBUM,
        orderType: OrderType.ASC_OR_SMALLER,
        uriType: UriType.EXTERNAL,
        ignoreCase: true,
      );
      for (var song in allQuerySongs) {
        final Map<String, dynamic> songMap = convertMap(
          song.getMap,
        );
        fetchedSongs.add(MusicModel.fromMap(songMap));
      }

      for (var e in fetchedSongs) {
        if (e.fileExtension!.contains('mp3') && e.isMusic == true) {
          filterMp3Songs.add(e);
        }
      }
      log("songss::$filterMp3Songs");

      return Right(filterMp3Songs);
    } catch (e) {
      return Left(AppErrorHandler(message: e.toString(), status: false));
    }
  }
}
