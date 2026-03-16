import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:toro_start/widget/app_text.dart';
import 'package:toro_start/widget/custom_circular_progress_indicator.dart';

import '../constants/app_constants.dart';
import '../themes/extensions/theme_extension.dart';

class CustomAppButton extends StatelessWidget {
  final bool isElevated;
  final String text;
  final Widget? child;
  final Widget? loadingWidget;
  final double? height;
  final OutlinedBorder? shape;
  final
  FontWeight? fontWeight;
  final double? width;
  final double? radius;
  final Color? foregroundColor;
  final Color? backgroundColor;
  final BorderSide? side;
  final Color? disabledForegroundColor;
  final bool isDisabled;
  final bool isLoading;
  final Color? disabledBackgroundColor;
  final void Function()? onPressed;
  const CustomAppButton(
      {Key? key,
      this.isElevated = true,
      this.onPressed,
      this.text = "No text for this button yet",
      this.height,
      this.radius,
      this.child,
      this.foregroundColor,
      this.backgroundColor,
      this.disabledForegroundColor,
      this.disabledBackgroundColor,
      this.side,
      this.isDisabled = true,
      this.isLoading = false, this.fontWeight, this.shape, this.width, this.loadingWidget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isElevated
        ? ElevatedButton(
            onPressed: isDisabled
                ? null
                : isLoading
                    ? null
                    : onPressed,
            style: ElevatedButton.styleFrom(
              foregroundColor: foregroundColor ?? context.color.white,
              backgroundColor: backgroundColor ?? context.color.primary,
              disabledForegroundColor:
                  disabledForegroundColor ?? context.color.cardSufaces,
              disabledBackgroundColor:
                  disabledBackgroundColor ?? context.color.mutedText,
              shape: shape??RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  radius ?? 15,
                ),
                side: side ?? BorderSide.none,
              ),
              fixedSize: Size(
                width??double.infinity,
                height ?? 44,
              ),
            ),
            child: isLoading? loadingWidget??CustomCircularProgressIndicator(
              color: context.color.white,
            ):child ??
                AppText(
                  text: text,
                  style: TextStyle(
                    color: context.color.secondarySurfacesInputs,
                    fontSize: 16,
                    fontFamily: AppConstants.latoFont,
                    fontWeight: fontWeight??FontWeight.w600,
                  ),
                ),
          )
        : Container();
  }
}
