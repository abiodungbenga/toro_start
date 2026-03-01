import 'package:flutter/material.dart';

class AppColors extends ThemeExtension<AppColors> {
  final Color primary;
  final Color primary2;
  final Color textPrimary;
  final Color textSecondary;

  AppColors({
    required this.primary,
    required this.primary2,
    required this.textPrimary,
    required this.textSecondary,
  });
  @override
  ThemeExtension<AppColors> copyWith() => this;

  @override
  ThemeExtension<AppColors> lerp(
    covariant ThemeExtension<AppColors>? other,
    double t,
  ) => this;
}

class MainColors extends AppColors {
  MainColors({
    super.primary = Colors.white,
    super.primary2 = const Color(0xFF216dfe),
    super.textPrimary = const Color(0xFF111827),
    super.textSecondary = const Color(0xFFB3B3B3),
  });
}

class DarkColor extends AppColors {
  DarkColor({
    super.primary = const Color(0xFF121212),
    super.primary2 = const Color(0xFF216dfe),
    super.textPrimary = Colors.white,
    super.textSecondary = const Color(0xFFB3B3B3),
  });
}
