import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:toro_start/themes/colors.dart';
import '../constants/app_constants.dart';

class AppTheme {
  ThemeData get dark => _base(DarkColor(), brightness: Brightness.dark);
  ThemeData get light => _base(MainColors(), brightness: Brightness.light);

  static TextTheme create(AppColors color) {
    return TextTheme(
      // displayLarge: ,
      // titleMedium: TextStyle(
      //   fontSize: 62,
      //   fontFamily: AppConstants.fontFamily1,
      //   color: color.planeWhite,
      //   height: 1.4,
      //   fontWeight: FontWeight.w400,
      // ),
      // labelSmall: TextStyle(
      //   fontSize: 14,
      //   fontFamily: AppConstants.fontFamily1,
      //   color: color.planeWhite,
      //   height: 1.4,
      //   fontWeight: FontWeight.w400,
      // ),
      // displayMedium: TextStyle(
      //   color: color.planeWhite,
      //   fontFamily: AppConstants.fontFamily6,
      //   fontWeight: FontWeight.w800,
      //   fontSize: 24,
      // ),
      //
      // displaySmall: TextStyle(
      //   color: color.planeWhite,
      //   fontFamily: AppConstants.fontFamily1,
      //   fontWeight: FontWeight.w500,
      //   fontSize: 14,
      // )
      // bodySmall: TextStyle(fontSize: 12, color: color.primaryText),
      // bodyMedium: TextStyle(fontSize: 18, color: color.primaryText),
      // titleLarge: TextStyle(fontSize: 40, color: color.primaryText),
      titleMedium: TextStyle(
        fontSize: 20.sp,
        color: color.white,
        fontFamily: AppConstants.latoFont,

        fontWeight: FontWeight.w700,
      ),
      titleSmall: TextStyle(
        fontSize: 12.sp,
        color: color.secondaryText,
        fontFamily: AppConstants.latoFont,

        fontWeight: FontWeight.w700,
      ),
    );
  }

  ThemeData _base(AppColors color, {Brightness? brightness}) {
    /// you can set theme of different components provided by flutter here
    return ThemeData(
      extensions: [color],
      scaffoldBackgroundColor: color.primary,
      useMaterial3: false,
      brightness: brightness,
      // typography: ,
      colorScheme: ColorScheme(
        brightness: brightness ?? Brightness.light,
        primary: color.primary,
        onPrimary: color.white,
        secondary: color.secondaryText,
        onSecondary: Colors.white,
        error: Colors.red,
        onError: Colors.red,

        surface: color.secondarySurfacesInputs,
        onSurface: color.primaryDark,
      ),
      fontFamily: AppConstants.latoFont,
      // primaryTextTheme: TextTheme(
      //
      // ),
      // progressIndicatorTheme: ProgressIndicatorThemeData(
      //   color: color.kpurple, // or any color you prefer
      //   circularTrackColor: color.planeWhite,
      //
      // ),
      textTheme: create(color),
      visualDensity: VisualDensity.adaptivePlatformDensity,
    );
  }
}
