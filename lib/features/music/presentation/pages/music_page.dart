import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:music_app/configs/themes/app_theme.dart';
import 'package:music_app/features/music/presentation/pages/tabs/albums_tab/albums_tab_page.dart';
import 'package:music_app/features/music/presentation/pages/tabs/artists_tab/artists_tab_page.dart';
import 'package:music_app/features/music/presentation/pages/tabs/folders_tab/folder_tab_page.dart';
import 'package:music_app/features/music/presentation/pages/tabs/genres_tab/genres_tab_page.dart';

class MusicPage extends StatefulWidget {
  const MusicPage({super.key});

  @override
  State<MusicPage> createState() => _MusicPageState();
}

class _MusicPageState extends State<MusicPage> {
  TabController? _tabController;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              TabBar(
                splashBorderRadius: BorderRadius.circular(40),
                splashFactory: NoSplash.splashFactory,
                dividerHeight: 0,
                tabAlignment: TabAlignment.center,
                indicatorColor: Colors.blue,
                indicatorWeight: 3,
                controller: _tabController,
                unselectedLabelColor: context.theme.appColors.greyColor,
                unselectedLabelStyle: context.theme.appTextTheme.f16w5,
                labelStyle: context.theme.appTextTheme.f16w7,
                labelColor: Colors.white,
                indicatorPadding: const EdgeInsets.symmetric(vertical: 5),
                isScrollable: true,
                tabs: const [
                  Tab(text: "Folders"),
                  Tab(text: "Artists"),
                  Tab(text: "Albums"),
                  Tab(text: "Genres"),
                ],
              ),
              Gap(20.h),
              const Expanded(
                  child: TabBarView(children: [
                FoldersTabPage(),
                ArtistsTabPage(),
                AlbumsTabPage(),
                GenresTabPage(),
              ]))
            ],
          ),
        ),
      ),
    );
  }
}
