import 'package:flutter/material.dart';

class AppColors extends ThemeExtension<AppColors> {
  final Color primary;
  final Color primaryDark;
  final Color primaryLight;
  final Color accent;
  final Color scaffoldBg;
  final Color cardSufaces;
  final Color secondarySurfacesInputs;
  final Color dividers;
  final Color primaryText;
  final Color white;
  final Color secondaryText;
  final Color mutedText;
  final Color primaryTitle;
  final Color primaryButtonText;

  AppColors({
    required this.primary,
    required this.primaryDark,
    required this.white,
    required this.primaryTitle,
    required this.primaryLight,
    required this.accent,
    required this.scaffoldBg,
    required this.cardSufaces,
    required this.secondarySurfacesInputs,
    required this.dividers,
    required this.primaryText,
    required this.secondaryText,
    required this.mutedText,
    required this.primaryButtonText,
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
    super.primary = const Color(0xFF3629B7),
    super.primaryTitle = const Color(0xFF3629B7),
    super.white =  Colors.white,
    super.primaryDark = const Color(0xFF1558B0),
    super.primaryLight = const Color(0xFF4DA3FF),
    super.accent = const Color(0xFF40CAEC),
    super.scaffoldBg = const Color(0xFFF8FAFC),
    super.cardSufaces = const Color(0xFFFFFFFF),
    super.secondarySurfacesInputs = const Color(0xFFEEF2F7),
    super.dividers = const Color(0xFFE2E8F0),
    super.primaryText = const Color(0xFF0F172A),
    super.secondaryText = const Color(0xFF475569),
    super.mutedText = const Color(0xFF94A3B8),
    super.primaryButtonText = const Color(0xFFFFFFFF),
  });
}

class DarkColor extends AppColors {
  DarkColor({
    super.primary = const Color(0xFF3629B7),
    super.primaryTitle =  Colors.white,
    super.white =  Colors.white,
    super.primaryDark = const Color(0xFF1558B0),
    super.primaryLight = const Color(0xFF4DA3FF),
    super.accent = const Color(0xFF40CAEC),
    super.scaffoldBg = const Color(0xFF121212),
    super.cardSufaces = const Color(0xFF1E1E1E),
    super.secondarySurfacesInputs = const Color(0xFF232323),
    super.dividers = const Color(0xFF353535),
    super.primaryText = const Color(0xFFF8FAFC),
    super.secondaryText = const Color(0xFFC7D2FE),
    super.mutedText = const Color(0xFF94A3B8),
    super.primaryButtonText = const Color(0xFFFFFFFF),
  });
}
