import 'package:flutter/material.dart';
import 'package:music_app/configs/themes/app_colors_extension.dart';
import 'package:music_app/configs/themes/app_palette.dart';
import 'package:music_app/configs/themes/app_text_style.dart';
import 'package:music_app/configs/themes/app_text_style_extenstion.dart';

class AppTheme {
  // Light Theme
  static final light = () {
    final defaultTheme = ThemeData.light();

    return defaultTheme.copyWith(
      scaffoldBackgroundColor: _lightAppColors.background,
      extensions: [
        _lightAppColors,
        _lightTextTheme,
      ],
    );
  }();

  static final _lightAppColors = AppColorsExtension(
    background: AppPalette.background,
    onBackground: Colors.white,
    primary: Colors.red,
    onPrimary: Colors.purpleAccent,
    textColor: AppPalette.textColor,
    secondayColor: AppPalette.secondayColor,
    greyColor: AppPalette.grey,
    white: AppPalette.white,
  );

  static final _lightTextTheme = AppTextStyleExtension(
    f10w4: AppTypography.f10W4.copyWith(color: _lightAppColors.textColor),
    f12w5: AppTypography.f12W5.copyWith(color: _lightAppColors.greyColor),
    f12w7: AppTypography.f12W7.copyWith(color: _lightAppColors.textColor),
    f14w5: AppTypography.f14W5.copyWith(color: _lightAppColors.textColor),
    f14w7: AppTypography.f14W7.copyWith(color: _lightAppColors.textColor),
    f16w5: AppTypography.f16W5.copyWith(color: _lightAppColors.textColor),
    f16w7: AppTypography.f16W7.copyWith(color: _lightAppColors.textColor),
    f22w7: AppTypography.f22W7.copyWith(color: _lightAppColors.textColor),
  );

  //! Dark Theme ===================================
  static final dark = () {
    final defaultTheme = ThemeData.dark();

    return defaultTheme.copyWith(
      scaffoldBackgroundColor: _darkAppColors.background,
      extensions: [
        _darkAppColors,
        _darkTextTheme,
      ],
    );
  }();

  static final _darkAppColors = AppColorsExtension(
      background: AppPalette.background,
      onBackground: Colors.white,
      primary: Colors.blue,
      onPrimary: Colors.yellow,
      textColor: Colors.white,
      secondayColor: AppPalette.secondayColor,
      greyColor: AppPalette.darkGrey,
      white: AppPalette.white);

  static final _darkTextTheme = AppTextStyleExtension(
    f10w4: AppTypography.f10W4.copyWith(color: _darkAppColors.textColor),
    f12w5: AppTypography.f12W5.copyWith(color: _darkAppColors.greyColor),
    f12w7: AppTypography.f12W7.copyWith(color: _darkAppColors.textColor),
    f14w5: AppTypography.f14W5.copyWith(color: _darkAppColors.textColor),
    f14w7: AppTypography.f14W7.copyWith(color: _darkAppColors.textColor),
    f16w5: AppTypography.f16W6.copyWith(color: _darkAppColors.textColor),
    f16w7: AppTypography.f16W7.copyWith(color: _darkAppColors.textColor),
    f22w7: AppTypography.f22W7.copyWith(color: _darkAppColors.textColor),
  );
}

//!   =========
extension AppThemeExtension on ThemeData {
  AppColorsExtension get appColors => extension<AppColorsExtension>() ?? AppTheme._lightAppColors;

  AppTextStyleExtension get appTextTheme => extension<AppTextStyleExtension>() ?? AppTheme._lightTextTheme;
}

extension ThemeGetter on BuildContext {
  ThemeData get themeContext => Theme.of(this);
}
