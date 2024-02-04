import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:music_app/configs/themes/app_theme.dart';
import 'package:music_app/core/commons_widgets/custom_song_image_show.dart';
import 'package:music_app/core/utils/app_constants.dart';
import 'package:music_app/core/utils/app_utils.dart';
import 'package:music_app/core/utils/helper_function.dart';
import 'package:music_app/features/home/presentation/cubits/home_cubit/home_cubit.dart';
import 'package:music_app/features/home/presentation/cubits/home_cubit/home_state.dart';
import 'package:music_app/features/home/presentation/widgets/home_top_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: context.theme.appColors.background,
      body: SafeArea(
        child: Column(
          children: [
            const Gap(10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Row(
                children: [
                  // menu

                  GestureDetector(
                    onTap: () {},
                    child: FaIcon(
                      FontAwesomeIcons.sliders,
                      color: context.theme.appColors.white,
                    ),
                  ),

                  // search

                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: TextFormField(
                        onTapOutside: (event) {
                          TDeviceUtils.hideKeyboard(context);
                        },
                        style: context.theme.appTextTheme.f14w5,
                        decoration: InputDecoration(
                          isDense: true,
                          contentPadding: EdgeInsets.symmetric(vertical: 10.0.h, horizontal: 10.0.w),
                          filled: true,
                          fillColor: context.theme.appColors.secondayColor,
                          enabled: true,
                          hintText: "Search",
                          hintStyle: context.theme.appTextTheme.f12w5,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.r),
                            borderSide: BorderSide(
                              color: context.theme.appColors.secondayColor,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.r),
                            borderSide: BorderSide(
                              color: context.theme.appColors.secondayColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  // notification

                  GestureDetector(
                    onTap: () {},
                    child: FaIcon(
                      FontAwesomeIcons.bell,
                      color: context.theme.appColors.white,
                    ),
                  ),
                ],
              ),
            ),
            Gap(20.h),

            //

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: SizedBox(
                height: 60.h,
                width: TDeviceUtils.getScreenWidth(context),
                child: Row(
                  children: [
                    Expanded(
                      child: HomeTopWidget(
                        label: "Favourites",
                        icon: Icons.star_purple500_outlined,
                        onTap: () {},
                      ),
                    ),
                    const Gap(10),
                    Expanded(
                      child: HomeTopWidget(
                        label: "Playlists",
                        icon: Icons.music_note_sharp,
                        onTap: () {},
                      ),
                    ),
                    const Gap(10),
                    Expanded(
                      child: HomeTopWidget(
                        label: "Recent",
                        icon: Icons.access_time_rounded,
                        onTap: () {},
                      ),
                    ),
                  ],
                ),
              ),
            ),
            BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                return SizedBox(
                  height: 30.h,
                  // color: Colors.amber,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: paddingHorizontal),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Songs (${state.deviceListMusic?.length})",
                          style: context.theme.appTextTheme.f14w7,
                        ),
                        GestureDetector(
                          onTap: () {
                            showCupertinoModalPopup(
                              context: context,
                              builder: (context) {
                                return BottomSheet(
                                  enableDrag: false,
                                  onClosing: () {},
                                  builder: (context) {
                                    return Container(
                                      height: 300.h,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
                                        color: const Color.fromARGB(255, 43, 58, 94),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(horizontal: paddingHorizontal, vertical: 20.h),
                                        child: BlocBuilder<HomeCubit, HomeState>(
                                          builder: (context, state) {
                                            return Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Sort By",
                                                  style: context.theme.appTextTheme.f16w7,
                                                ),
                                                RadioListTile(
                                                  controlAffinity: ListTileControlAffinity.trailing,
                                                  activeColor: Colors.green,
                                                  fillColor: const MaterialStatePropertyAll(Colors.green),
                                                  value: 1,
                                                  groupValue: state.sortSelectValue,
                                                  onChanged: (value) {
                                                    BlocProvider.of<HomeCubit>(context).sortBy(selectValue: value!);
                                                    BlocProvider.of<HomeCubit>(context).sortByName(sortBy: "name");
                                                    Get.back();
                                                  },
                                                  title: Text(
                                                    "Name",
                                                    style: context.theme.appTextTheme.f14w5,
                                                  ),
                                                ),
                                                RadioListTile(
                                                  controlAffinity: ListTileControlAffinity.trailing,
                                                  activeColor: Colors.green,
                                                  dense: true,
                                                  fillColor: const MaterialStatePropertyAll(Colors.green),
                                                  value: 2,
                                                  groupValue: state.sortSelectValue,
                                                  onChanged: (value) {
                                                    BlocProvider.of<HomeCubit>(context).sortBy(selectValue: value!);
                                                    BlocProvider.of<HomeCubit>(context).sortByName(sortBy: "artist");
                                                    Get.back();
                                                  },
                                                  title: Text(
                                                    "Artist",
                                                    style: context.theme.appTextTheme.f14w5,
                                                  ),
                                                ),
                                                RadioListTile(
                                                  controlAffinity: ListTileControlAffinity.trailing,
                                                  activeColor: Colors.green,
                                                  fillColor: const MaterialStatePropertyAll(Colors.green),
                                                  value: 3,
                                                  groupValue: state.sortSelectValue,
                                                  onChanged: (value) {
                                                    BlocProvider.of<HomeCubit>(context).sortBy(selectValue: value!);
                                                  },
                                                  title: Text(
                                                    "Date",
                                                    style: context.theme.appTextTheme.f14w5,
                                                  ),
                                                ),
                                              ],
                                            );
                                          },
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                            );
                          },
                          child: Icon(
                            CupertinoIcons.sort_down,
                            color: context.theme.appColors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
            Gap(8.h),

            //songs list

            BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                return Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: paddingHorizontal, right: paddingHorizontal, bottom: 53.h),
                    child: ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: state.deviceListMusic!.length,
                      itemBuilder: (context, index) {
                        final songData = state.deviceListMusic?[index];
                        return SizedBox(
                          height: 40.h,
                          child: Row(
                            children: [
                              Expanded(
                                child: InkWell(
                                  onTap: () {
                                    //onTap

                                    BlocProvider.of<HomeCubit>(context).onTapSong(music: songData);
                                  },
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: 45.w,
                                        child: customSongImageWidget(
                                          currentSongID: songData!.id!,
                                          isCircular: true,
                                        ),
                                      ),
                                      const Gap(5),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              state.deviceListMusic![index].displayNameWoExt.toString(),
                                              style: songData.id == state.singleMusic?.id ? context.theme.appTextTheme.f14w5?.copyWith(color: Colors.red) : context.theme.appTextTheme.f14w5,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            Text(
                                              state.deviceListMusic![index].artist.toString(),
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
                        return const Gap(10);
                      },
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
