// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:music_app/core/errors/app_error_handler.dart';
import 'package:music_app/core/usecase/usecase.dart';
import 'package:music_app/features/home/domain/entity/music_entity.dart';
import 'package:music_app/features/home/domain/repository/home_repository.dart';

class GetSongsFromDeviceUsecase extends UseCase<dynamic, void> {
  final HomeRepository repository;
  GetSongsFromDeviceUsecase({
    required this.repository,
  });
  @override
  Future<Either<AppErrorHandler, List<MusicEntity>>> call(void parms) async {
    final data = await repository.getAllSongsFromDevice();
    return data.fold((l) => left(l), (r) => Right(r));
  }
}
