// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:music_app/configs/themes/app_theme.dart';
import 'package:music_app/core/utils/app_utils.dart';

class CustomLableTextformfield extends StatelessWidget {
  final String labelText;
  final String hintText;
  final int? maxLines;
  final int? maxLength;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final FocusNode? focusNode;
  final bool autofocus;
  final bool? astrik;
  final Function(String)? onFieldSubmitted;
  final List<TextInputFormatter>? inputFormatters;
  final Iterable<String>? autofillHints;
  const CustomLableTextformfield({
    Key? key,
    required this.labelText,
    required this.hintText,
    this.maxLines,
    this.maxLength,
    this.controller,
    this.keyboardType,
    this.validator,
    this.focusNode,
    this.autofocus = false,
    this.astrik = false,
    this.onFieldSubmitted,
    this.inputFormatters,
    this.autofillHints,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        astrik == true
            ? RichText(
                text: TextSpan(
                  text: labelText,
                  style: context.theme.appTextTheme.f12w7,
                  children: [
                    TextSpan(
                      text: " *",
                      style: context.theme.appTextTheme.f10w4,
                    ),
                  ],
                ),
              )
            : Text(
                labelText,
                style: context.theme.appTextTheme.f12w7,
              ),
        SizedBox(height: 6.h),
        TextFormField(
          onTapOutside: (event) {
            TDeviceUtils.hideKeyboard(context);
          },
          autofillHints: autofillHints,
          maxLines: maxLines,
          maxLength: maxLength,
          onFieldSubmitted: onFieldSubmitted,
          autofocus: autofocus,
          focusNode: focusNode,
          validator: validator,
          controller: controller,
          keyboardType: keyboardType,
          inputFormatters: inputFormatters,
          cursorColor: context.theme.appColors.primary,
          decoration: InputDecoration(
            counterText: '',
            contentPadding: EdgeInsets.symmetric(vertical: 10.0.h, horizontal: 10.0.w),
            filled: true,
            fillColor: context.theme.appColors.secondayColor,
            enabled: false,
            hintText: hintText,
            hintStyle: context.theme.appTextTheme.f12w7,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4.r),
              borderSide: BorderSide(
                color: Colors.grey.shade400,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: const BorderSide(
                color: Colors.red,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: const BorderSide(
                color: Colors.red,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4.r),
              borderSide: BorderSide(
                color: Colors.grey.shade400,
              ),
            ),
          ),
        ),
        SizedBox(height: 19.h)
      ],
    );
  }
}
