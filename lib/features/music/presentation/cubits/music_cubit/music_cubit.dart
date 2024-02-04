// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:music_app/features/home/presentation/cubits/home_cubit/home_cubit.dart';

import 'package:music_app/features/music/domain/usercase/get_device_music_folders_usercase.dart';
import 'package:music_app/features/music/presentation/cubits/music_cubit/music_state.dart';

class MusicCubit extends Cubit<MusicState> {
  final GetDeviceMusicFoldersUsecase getDeviceMusicFoldersUsecase;
  MusicCubit({
    required this.getDeviceMusicFoldersUsecase,
  }) : super(MusicState.initial()) {
    getDeviceMusicFolders();
  }

  void getDeviceMusicFolders() async {
    emit(state.copyWith(
      isloading: true,
      isSuccess: false,
      folderPath: null,
      listOfMusicFolders: null,
    ));
    final data = await getDeviceMusicFoldersUsecase.call(null);
    data.fold(
      (l) => emit(state.copyWith(
        isloading: false,
        isSuccess: false,
        folderPath: null,
        listOfMusicFolders: null,
      )),
      (r) {
        final deviceSongs = BlocProvider.of<HomeCubit>(Get.context!).state.deviceListMusic;
        final folderSongs = r.map((e) {
          final songsInFolder = deviceSongs?.where((songs) => songs.data!.contains(e.path.toString())).toList();
          log("musifo :${songsInFolder?.map((e) => e.displayNameWoExt)}");
          return e.copyWith(songs: songsInFolder);
        }).toList();
        emit(state.copyWith(
          isloading: false,
          isSuccess: true,
          listOfMusicFolders: folderSongs,
        ));
      },
    );
  }
}
