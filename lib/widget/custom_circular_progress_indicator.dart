import 'package:flutter/material.dart';
import '../themes/extensions/theme_extension.dart';

class CustomCircularProgressIndicator extends StatelessWidget {
  final double? width;
  final Color? color;
  final double? height;
  final bool isHourlyGlass;
  final double? strokeWidth;
  const CustomCircularProgressIndicator(
      {Key? key,
      this.width,
      this.height,
      this.color,
      this.strokeWidth,
      this.isHourlyGlass = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 20,
      height: height ?? 20,
      child: isHourlyGlass
          ? SizedBox()
          : CircularProgressIndicator(
              strokeWidth: strokeWidth ?? 2.5,
              color: color ?? context.color.secondarySurfacesInputs,
            ),
    );
  }
}
