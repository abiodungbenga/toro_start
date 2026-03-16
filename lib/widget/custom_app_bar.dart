import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:toro_start/themes/extensions/theme_extension.dart';
import 'package:toro_start/widget/app_text.dart';
import 'package:toro_start/widget/top_space.dart';

class CustomAppBar extends StatelessWidget {
  final String? title;
  final VoidCallback? onPressed;
  final bool hasLeading;

  const CustomAppBar({Key? key, this.title, this.onPressed,  this.hasLeading = true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TopSpace(),
        Row(
          children: [
            hasLeading?IconButton(
              onPressed: onPressed??() => Get.back(),
              icon: Icon(
                CupertinoIcons.back,
                color: context.color.white,
                size: 16.sp,
              ),
            ):SizedBox(width: 5.w),
            SizedBox(width: 3.w),
            AppText(text: title??"Sign in", style: context.textTheme.titleMedium),

          ],
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
