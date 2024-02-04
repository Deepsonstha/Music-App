// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:music_app/core/errors/app_error_handler.dart';
import 'package:music_app/features/home/data/datasource/local_datasource/local_data_source.dart';
import 'package:music_app/features/home/data/models/music_model.dart';
import 'package:music_app/features/home/domain/repository/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  final AudioQueryDatasource datasource;
  HomeRepositoryImpl({
    required this.datasource,
  });
  @override
  Future<Either<AppErrorHandler, List<MusicModel>>> getAllSongsFromDevice() async {
    return await datasource.getAllSongsFromDevice();
  }
}
