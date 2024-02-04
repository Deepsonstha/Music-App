// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:music_app/core/errors/app_error_handler.dart';
import 'package:music_app/core/usecase/usecase.dart';
import 'package:music_app/features/music/domain/entity/folder_entity.dart';
import 'package:music_app/features/music/domain/repository/music_repository.dart';

class GetDeviceMusicFoldersUsecase extends UseCase<List<FolderEntity>, void> {
  final MusicRepository repository;
  GetDeviceMusicFoldersUsecase({
    required this.repository,
  });
  @override
  Future<Either<AppErrorHandler, List<FolderEntity>>> call(void parms) async {
    final data = await repository.getListOfMusicFolders();
    return data.fold((l) => Left(l), (r) => Right(r));
  }
}
