import 'package:flutter/material.dart';
import 'package:toro_start/themes/colors.dart';

extension ThemeExtension on BuildContext {
  MainColors get color => Theme.of(this).extension<MainColors>() ?? MainColors();
}
