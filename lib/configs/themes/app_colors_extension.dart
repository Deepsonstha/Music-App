// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class AppColorsExtension extends ThemeExtension<AppColorsExtension> {
  final Color primary;
  final Color onPrimary;
  final Color background;
  final Color onBackground;
  final Color textColor;
  final Color secondayColor;
  final Color greyColor;
  final Color white;
  AppColorsExtension({
    required this.primary,
    required this.onPrimary,
    required this.background,
    required this.onBackground,
    required this.textColor,
    required this.secondayColor,
    required this.greyColor,
    required this.white,
  });

  @override
  ThemeExtension<AppColorsExtension> copyWith({
    Color? primary,
    Color? onPrimary,
    Color? background,
    Color? onBackground,
    Color? textColor,
    Color? secondayColor,
    Color? greyColor,
    Color? white,
  }) {
    return AppColorsExtension(
      primary: primary ?? this.primary,
      onPrimary: onPrimary ?? this.onPrimary,
      background: background ?? this.background,
      onBackground: onBackground ?? this.onBackground,
      textColor: textColor ?? this.textColor,
      secondayColor: secondayColor ?? this.secondayColor,
      greyColor: greyColor ?? this.greyColor,
      white: white ?? this.white,
    );
  }

  @override
  ThemeExtension<AppColorsExtension> lerp(
    covariant ThemeExtension<AppColorsExtension>? other,
    double t,
  ) {
    if (other is! AppColorsExtension) {
      return this;
    }

    return AppColorsExtension(
      primary: Color.lerp(primary, other.primary, t)!,
      onPrimary: Color.lerp(onPrimary, other.onPrimary, t)!,
      background: Color.lerp(background, other.background, t)!,
      onBackground: Color.lerp(onBackground, other.onBackground, t)!,
      textColor: Color.lerp(textColor, other.textColor, t)!,
      secondayColor: Color.lerp(textColor, other.secondayColor, t)!,
      greyColor: Color.lerp(textColor, other.greyColor, t)!,
      white: Color.lerp(textColor, other.white, t)!,
    );
  }
}

/// Optional. If you also want to assign colors in the `ColorScheme`.
// extension ColorSchemeBuilder on AppColorsExtension {
//   ColorScheme toColorScheme(Brightness brightness) {
//     return ColorScheme(
//       brightness: brightness,
//       primary: primary,
//       onPrimary: onPrimary,
//       secondary: secondary,
//       onSecondary: onSecondary,
//       error: error,
//       onError: onError,
//       background: background,
//       onBackground: onBackground,
//       surface: surface,
//       onSurface: onSurface,
//     );
//   }
// }
