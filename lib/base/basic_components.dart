import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_icon_snackbar/flutter_icon_snackbar.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class BasicComponents {
  static void showSnackBar({
    SnackBarType? snackBarType,
    String? data,
    bool? isError = false,
    Color? backgroundColor,
  }) {
    final context = Get.context!;
    IconSnackBar.show(
      context,
      maxLines: 1,
      behavior: SnackBarBehavior.floating,
      direction: DismissDirection.horizontal,
      labelTextStyle: context.textTheme.titleMedium!.copyWith(
        color: Colors.white,
        fontSize: 14.sp,
      ),
      snackBarType: snackBarType ?? SnackBarType.success,
      label: data ?? 'Data required',
      backgroundColor:
      backgroundColor ?? (isError == true ? Colors.red : Color(0xFF18920D)),
      iconColor: Colors.white,
    );
  }
}