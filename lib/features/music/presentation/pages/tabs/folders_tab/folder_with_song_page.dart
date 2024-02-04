import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:music_app/configs/routes/route.dart';
import 'package:music_app/configs/themes/app_theme.dart';
import 'package:music_app/core/commons_widgets/custom_song_image_show.dart';
import 'package:music_app/core/utils/app_constants.dart';
import 'package:music_app/core/utils/app_utils.dart';
import 'package:music_app/features/home/presentation/cubits/home_cubit/home_cubit.dart';
import 'package:music_app/features/home/presentation/cubits/home_cubit/home_state.dart';
import 'package:music_app/features/music/domain/entity/folder_entity.dart';
import 'package:recase/recase.dart';

class FolderWithSongsPage extends StatefulWidget {
  const FolderWithSongsPage({super.key});

  @override
  State<FolderWithSongsPage> createState() => _FolderWithSongsPageState();
}

class _FolderWithSongsPageState extends State<FolderWithSongsPage> {
  FolderEntity? folderMusicData;
  @override
  void initState() {
    super.initState();
    folderMusicData = Get.arguments['folderMusic'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: 140.h,
                color: context.theme.appColors.secondayColor,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: paddingHorizontal),
                  child: Column(
                    children: [
                      AppBar(
                        leadingWidth: 50,
                        leading: GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: const Icon(Icons.arrow_back),
                        ),
                        backgroundColor: context.theme.appColors.secondayColor,
                        foregroundColor: Colors.white,
                      ),
                      Gap(10.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.folder_rounded,
                                size: 60,
                                color: context.theme.appColors.greyColor,
                              ),
                              Gap(10.w),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    folderMusicData!.folderName.toString().titleCase,
                                    style: context.theme.appTextTheme.f16w7,
                                  ),
                                  Text(
                                    '${folderMusicData!.songs!.length.toString()} songs',
                                    style: context.theme.appTextTheme.f12w7,
                                  )
                                ],
                              ),
                            ],
                          ),
                          folderMusicData!.songs!.isEmpty
                              ? const SizedBox.shrink()
                              : Container(
                                  decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(20.r),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.play_circle_rounded,
                                          color: context.theme.appColors.background,
                                        ),
                                        Gap(4.w),
                                        Text(
                                          "Play All",
                                          style: context.theme.appTextTheme.f12w7,
                                        )
                                      ],
                                    ),
                                  ),
                                )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: paddingHorizontal),
                  child: ListView.separated(
                    itemCount: folderMusicData!.songs!.length,
                    itemBuilder: (context, index) {
                      final songsData = folderMusicData?.songs?[index];
                      return SizedBox(
                        height: 40.h,
                        child: Row(
                          children: [
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  //onTap
                                  BlocProvider.of<HomeCubit>(context).onTapSong(music: songsData);
                                },
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 45.w,
                                      child: customSongImageWidget(
                                        currentSongID: songsData!.id!,
                                        isCircular: true,
                                      ),
                                    ),
                                    const Gap(5),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            songsData.displayNameWoExt.toString(),
                                            style: context.theme.appTextTheme.f14w5,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          Text(
                                            songsData.artist.toString(),
                                            style: context.theme.appTextTheme.f12w7,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 40.w,
                              child: Icon(
                                Icons.more_vert_outlined,
                                color: context.theme.appColors.white,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return Gap(10.h);
                    },
                  ),
                ),
              )
            ],
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
    );
  }
}
