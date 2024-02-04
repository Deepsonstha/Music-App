import 'package:dartz/dartz.dart';
import 'package:music_app/core/errors/app_error_handler.dart';
import 'package:music_app/features/home/domain/entity/music_entity.dart';

abstract class HomeRepository {
  Future<Either<AppErrorHandler, List<MusicEntity>>> getAllSongsFromDevice();
}
