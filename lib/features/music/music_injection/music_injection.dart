import 'package:music_app/features/music/data/data_sourece/local_datasource/music_local_datasource.dart';
import 'package:music_app/features/music/data/repository_impl/music_repository_impl.dart';
import 'package:music_app/features/music/domain/repository/music_repository.dart';
import 'package:music_app/features/music/domain/usercase/get_device_music_folders_usercase.dart';
import 'package:music_app/features/music/presentation/cubits/music_cubit/music_cubit.dart';

import '../../../dependency_injection/app_injection.dart';

class MusicInjection {
  void register() {
    locator.registerLazySingleton(() => MusicLocalDataSource(onAudioQuery: locator()));

    locator.registerLazySingleton<MusicRepository>(() => MusicRepositoryImpl(dataSource: locator()));

    locator.registerLazySingleton(() => GetDeviceMusicFoldersUsecase(repository: locator()));

    locator.registerFactory(() => MusicCubit(
          getDeviceMusicFoldersUsecase: locator(),
        ));
  }
}
