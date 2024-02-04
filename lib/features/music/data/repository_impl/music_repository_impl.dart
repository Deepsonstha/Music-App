// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:music_app/core/errors/app_error_handler.dart';
import 'package:music_app/features/music/data/data_sourece/local_datasource/music_local_datasource.dart';
import 'package:music_app/features/music/domain/entity/folder_entity.dart';
import 'package:music_app/features/music/domain/repository/music_repository.dart';

class MusicRepositoryImpl implements MusicRepository {
  final MusicLocalDataSource dataSource;
  MusicRepositoryImpl({
    required this.dataSource,
  });
  @override
  Future<Either<AppErrorHandler, List<FolderEntity>>> getListOfMusicFolders() async {
    return await dataSource.getSongsFolder();
  }
}
