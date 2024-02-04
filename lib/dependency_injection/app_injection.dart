import 'dart:developer';

import 'package:get_it/get_it.dart';
import 'package:just_audio/just_audio.dart';
import 'package:music_app/features/home/home_injection/home_injection.dart';
import 'package:music_app/features/music/music_injection/music_injection.dart';
import 'package:on_audio_query/on_audio_query.dart';

GetIt locator = GetIt.I;
Future<void> setUpLocator() async {
  log('locator registers', name: "location register");
  locator.registerLazySingleton(() => AudioPlayer());
  locator.registerLazySingleton(() => OnAudioQuery());
  HomeInjection().register();
  MusicInjection().register();
}
