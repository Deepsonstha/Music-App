import 'package:get/get.dart';
import 'package:music_app/features/home/presentation/pages/full_screen_song_play.dart';
import 'package:music_app/features/music/presentation/pages/tabs/folders_tab/folder_with_song_page.dart';

class RouteName {
  static const String fullScreenSongPlay = '/fullScreenSongPlay';
  static const String folderWithSongs = '/folderWithSongs';
}

List<GetPage> routes = [
  GetPage(name: RouteName.fullScreenSongPlay, page: () => const FullScreenSongPlay(), transition: Transition.downToUp),
  GetPage(name: RouteName.folderWithSongs, page: () => const FolderWithSongsPage(), transition: Transition.topLevel),
];
