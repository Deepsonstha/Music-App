// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:music_app/configs/themes/app_theme.dart';

class HomeTopWidget extends StatelessWidget {
  final String label;
  final IconData icon;
  final Function() onTap;
  const HomeTopWidget({
    Key? key,
    required this.label,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: context.theme.appColors.white,
              ),
              SizedBox(height: 4.h),
              Text(
                label,
                style: context.theme.appTextTheme.f14w5,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
