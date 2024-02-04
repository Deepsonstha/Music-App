import 'package:music_app/features/home/data/datasource/local_datasource/local_data_source.dart';
import 'package:music_app/features/home/data/repository_impl/home_repository_impl.dart';
import 'package:music_app/features/home/domain/repository/home_repository.dart';
import 'package:music_app/features/home/domain/usercaes/get_songs_from_device_usercase.dart';
import 'package:music_app/features/home/presentation/cubits/home_cubit/home_cubit.dart';

import '../../../dependency_injection/app_injection.dart';

class HomeInjection {
  void register() {
    locator.registerLazySingleton(() => AudioQueryDatasource(onAudioQuery: locator()));

    locator.registerLazySingleton<HomeRepository>(() => HomeRepositoryImpl(datasource: locator()));

    locator.registerLazySingleton(() => GetSongsFromDeviceUsecase(repository: locator()));

    locator.registerFactory(() => HomeCubit(
          getSongsFromDeviceUsecase: locator(),
          audioPlayer: locator(),
        ));
  }
}
