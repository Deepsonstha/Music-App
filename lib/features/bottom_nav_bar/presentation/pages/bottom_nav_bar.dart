import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:music_app/configs/routes/route.dart';
import 'package:music_app/configs/themes/app_palette.dart';
import 'package:music_app/configs/themes/app_theme.dart';
import 'package:music_app/core/commons_widgets/custom_song_image_show.dart';
import 'package:music_app/core/utils/app_utils.dart';
import 'package:music_app/features/bottom_nav_bar/presentation/cubits/bottom_nav_bar_cubit/bottom_nav_bar_cubit.dart';
import 'package:music_app/features/bottom_nav_bar/presentation/cubits/bottom_nav_bar_cubit/bottom_nav_bar_state.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:music_app/features/home/presentation/cubits/home_cubit/home_cubit.dart';
import 'package:music_app/features/home/presentation/cubits/home_cubit/home_state.dart';
import 'package:music_app/features/music/presentation/pages/music_page.dart';
import '../../../home/presentation/pages/home_screen.dart';

class BottomNavBar extends StatelessWidget {
  BottomNavBar({super.key});
  final List pages = [
    const HomeScreen(),
    const MusicPage(),
    const HomeScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).appColors.background,
      body: Stack(
        children: [
          BlocBuilder<BottomNavBarCubit, BottomNavBarState>(
            builder: (context, state) {
              return PageView.builder(
                physics: const NeverScrollableScrollPhysics(),
                allowImplicitScrolling: false,
                itemCount: pages.length,
                itemBuilder: (context, index) {
                  return pages[state.selectedIndex!];
                },
              );
            },
          ),
          BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              return Positioned(
                  bottom: 0,
                  left: 10.w,
                  right: 10.w,
                  child: Container(
                    height: 50.h,
                    width: 1.sw,
                    decoration: BoxDecoration(
                      color: const Color(0xff858ba1),
                      borderRadius: BorderRadius.circular(4.r),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              //navigate

                              Get.toNamed(RouteName.fullScreenSongPlay);
                            },
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 5.h),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 45.w,
                                    child: customSongImageWidget(
                                      currentSongID: state.singleMusic?.id ?? -1,
                                      isCircular: true,
                                    ),
                                  ),
                                  Gap(7.w),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          state.singleMusic?.displayNameWoExt ?? "",
                                          maxLines: 1,
                                        ),
                                        Text(state.singleMusic?.artist ?? ""),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),

                        //
                        // bottom play

                        GestureDetector(
                          onTap: () {
                            BlocProvider.of<HomeCubit>(context).playPause(songID: state.singleMusic!.id!);
                          },
                          child: Container(
                            width: 40.w,
                            height: TDeviceUtils.getScreenHeight(),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4.r),
                            ),
                            child: Icon(
                              state.isPlaying ? CupertinoIcons.pause_fill : CupertinoIcons.play_arrow_solid,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ));
            },
          )
        ],
      ),
      bottomNavigationBar: BlocBuilder<BottomNavBarCubit, BottomNavBarState>(
        builder: (context, state) {
          return FlashyTabBar(
            showElevation: false,
            selectedIndex: state.selectedIndex!,
            backgroundColor: AppPalette.secondayColor,
            onItemSelected: (value) {
              BlocProvider.of<BottomNavBarCubit>(context).changeIndex(index: value);
            },
            items: [
              FlashyTabBarItem(
                icon: const FaIcon(FontAwesomeIcons.house),
                title: Text('Home', style: context.theme.appTextTheme.f14w5),
              ),
              FlashyTabBarItem(
                icon: const FaIcon(FontAwesomeIcons.music),
                title: Text('Music', style: context.theme.appTextTheme.f14w5),
              ),
              FlashyTabBarItem(
                icon: const FaIcon(FontAwesomeIcons.user),
                title: Text('Profile', style: context.theme.appTextTheme.f14w5),
              ),
            ],
          );
        },
      ),
    );
  }
}
