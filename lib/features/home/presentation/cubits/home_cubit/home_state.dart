// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';

import 'package:music_app/features/home/domain/entity/music_entity.dart';

class HomeState {
  final bool isLoading;
  final bool isSuccess;
  final List<MusicEntity>? deviceListMusic;

  //hold ontap song detail
  final MusicEntity? singleMusic;

  //
  final bool isPlaying;

  //
  final int? sortSelectValue;
  //sort by
  final List<MusicEntity>? sortByHere;

  HomeState({
    required this.isLoading,
    required this.isSuccess,
    this.deviceListMusic,
    this.singleMusic,
    required this.isPlaying,
    this.sortSelectValue,
    this.sortByHere,
  });

  factory HomeState.initial() {
    return HomeState(
      isLoading: false,
      isSuccess: false,
      deviceListMusic: [],
      singleMusic: null,
      isPlaying: false,
      sortSelectValue: null,
      sortByHere: [],
    );
  }

  HomeState copyWith({
    bool? isLoading,
    bool? isSuccess,
    List<MusicEntity>? deviceListMusic,
    MusicEntity? singleMusic,
    bool? isPlaying,
    int? sortSelectValue,
    List<MusicEntity>? sortByHere,
  }) {
    return HomeState(
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      deviceListMusic: deviceListMusic ?? this.deviceListMusic,
      singleMusic: singleMusic ?? this.singleMusic,
      isPlaying: isPlaying ?? this.isPlaying,
      sortSelectValue: sortSelectValue ?? this.sortSelectValue,
      sortByHere: sortByHere ?? this.sortByHere,
    );
  }

  @override
  String toString() {
    return 'HomeState(isLoading: $isLoading, isSuccess: $isSuccess, deviceListMusic: $deviceListMusic, singleMusic: $singleMusic, isPlaying: $isPlaying, sortSelectValue: $sortSelectValue, sortByHere: $sortByHere)';
  }

  @override
  bool operator ==(covariant HomeState other) {
    if (identical(this, other)) return true;

    return other.isLoading == isLoading &&
        other.isSuccess == isSuccess &&
        listEquals(other.deviceListMusic, deviceListMusic) &&
        other.singleMusic == singleMusic &&
        other.isPlaying == isPlaying &&
        other.sortSelectValue == sortSelectValue &&
        listEquals(other.sortByHere, sortByHere);
  }

  @override
  int get hashCode {
    return isLoading.hashCode ^ isSuccess.hashCode ^ deviceListMusic.hashCode ^ singleMusic.hashCode ^ isPlaying.hashCode ^ sortSelectValue.hashCode ^ sortByHere.hashCode;
  }
}
