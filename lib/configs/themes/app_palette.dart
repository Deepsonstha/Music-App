import 'package:flutter/material.dart';

abstract class AppPalette {
  // -- Light
  static const background = Color(0xff2e2444);
  static const onBackgroud = Color(0xff25257f);
  static const textColor = Colors.white;
  static const secondayColor = Color(0xff3c3d52);
  static const grey = Color(0xffc4c4c4);
  static const white = Colors.white;

//-- Dark
  static const darkBackground = Color(0xff2e2444);
  static const darkOnBackgroud = Color(0xff25257f);
  static const darkTextColor = Color(0xfffcfcff);
  static const darkSecondayColor = Color(0xff3c3d52);
  static const darkGrey = Color(0xffc4c4c4);

  // Grey
  // static const grey = _GreyColors();
}

/// Alternative way to group colors in the palette.
///
/// The downside is that you won't be able
/// to use them as constructor default values,
/// because they are not constants.
///
/// Usage example: `AppPalette.grey.grey50`.
// class _GreyColors {
//   const _GreyColors();

//   final grey50 = const Color(0xFFFAFAFA);
//   final grey100 = const Color(0xFFF5F5F5);
// }
