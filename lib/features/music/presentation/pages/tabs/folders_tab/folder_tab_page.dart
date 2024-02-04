import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:music_app/configs/routes/route.dart';
import 'package:music_app/configs/themes/app_theme.dart';
import 'package:music_app/core/utils/app_constants.dart';
import 'package:music_app/features/music/presentation/cubits/music_cubit/music_cubit.dart';
import 'package:music_app/features/music/presentation/cubits/music_cubit/music_state.dart';

class FoldersTabPage extends StatelessWidget {
  const FoldersTabPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<MusicCubit, MusicState>(
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: paddingHorizontal),
            child: Column(
              children: [
                Expanded(
                  child: ListView.separated(
                    itemCount: state.listOfMusicFolders!.length,
                    itemBuilder: (context, index) {
                      final folderMusicData = state.listOfMusicFolders?[index];
                      return GestureDetector(
                        onTap: () {
                          Get.toNamed(
                            RouteName.folderWithSongs,
                            arguments: {"folderMusic": folderMusicData},
                          );
                        },
                        child: Container(
                          color: context.theme.appColors.background,
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            children: [
                              const Icon(
                                Icons.folder_rounded,
                                color: Colors.grey,
                                size: 50,
                              ),
                              Gap(10.h),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    folderMusicData!.folderName.toString(),
                                    style: context.theme.appTextTheme.f14w7,
                                  ),
                                  Text(
                                    '${folderMusicData.songs!.length.toString()} songs',
                                    style: context.theme.appTextTheme.f12w5,
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return Gap(20.h);
                    },
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
