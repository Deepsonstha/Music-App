import 'package:dartz/dartz.dart';
import 'package:music_app/core/errors/app_error_handler.dart';
import 'package:music_app/features/music/domain/entity/folder_entity.dart';

abstract class MusicRepository {
  Future<Either<AppErrorHandler, List<FolderEntity>>> getListOfMusicFolders();
}
