// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';
import 'package:music_app/features/home/domain/entity/music_entity.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:music_app/features/home/domain/usercaes/get_songs_from_device_usercase.dart';
import 'package:music_app/features/home/presentation/cubits/home_cubit/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final GetSongsFromDeviceUsecase getSongsFromDeviceUsecase;
  final AudioPlayer audioPlayer;
  HomeCubit({
    required this.getSongsFromDeviceUsecase,
    required this.audioPlayer,
  }) : super(HomeState.initial()) {
    getSongsFromDevice();
  }

//get songs form device

  getSongsFromDevice() async {
    emit(state.copyWith(isLoading: true, isSuccess: false, deviceListMusic: null));
    var status = await Permission.storage.request();
    if (status.isGranted) {
      try {
        final data = await getSongsFromDeviceUsecase.call(null);
        data.fold(
          (l) {
            emit(state.copyWith(isLoading: false, isSuccess: false, deviceListMusic: null));
          },
          (r) {
            emit(state.copyWith(isLoading: false, isSuccess: true, deviceListMusic: r));
          },
        );
      } catch (e) {
        emit(state.copyWith(isLoading: false, isSuccess: false));
      }
    } else {
      await Permission.storage.request();
    }
  }

//
//  onTap song
//
  void onTapSong({
    required MusicEntity music,
  }) {
    if (state.singleMusic?.id == music.id) {
      if (state.isPlaying) {
        audioPlayer.pause();
        emit(state.copyWith(isPlaying: false));
      } else {
        audioPlayer.play();
        emit(state.copyWith(isPlaying: true));
      }
    } else {
      audioPlayer.stop();
      playSong(uri: music.uri!);
      emit(state.copyWith(singleMusic: music));
    }
  }

  //
  //play pause
  //
  void playPause({required int songID}) {
    if (state.singleMusic?.id == songID) {
      if (state.isPlaying) {
        audioPlayer.pause();
        emit(state.copyWith(isPlaying: false));
      } else {
        audioPlayer.play();
        emit(state.copyWith(isPlaying: true));
      }
    }
  }

  //
  // PLAY SONGS
  //
  void playSong({required String uri}) async {
    try {
      audioPlayer.setAudioSource(AudioSource.uri(Uri.parse(uri))).then((value) {
        emit(state.copyWith(isPlaying: true));
        audioPlayer.play().then((value) {
          audioPlayer.durationStream.listen((event) {
            int songMilisecond = event!.inMilliseconds;
            if (songMilisecond == state.singleMusic?.duration) {
              log("duration same");
            } else {
              log("duration not same");
            }
          });
        });
      });
    } on Exception catch (e) {
      log("myException ::$e");
    }
  }

  //
  //  SORT BY
  //
  void sortBy({required int selectValue}) {
    emit(state.copyWith(sortSelectValue: selectValue));
  }

  void sortByName({required String sortBy}) {
    List<MusicEntity> songList = [];
    songList = state.deviceListMusic!;
    if (sortBy == "name") {
      songList.sort(
        (a, b) => a.displayNameWoExt!.compareTo(b.displayNameWoExt!),
      );
      emit(state.copyWith(sortByHere: songList));
    } else if (sortBy == "artist") {
      songList.sort(
        (a, b) => a.artist!.compareTo(b.artist!),
      );
      emit(state.copyWith(sortByHere: songList));
    }
  }
}
