import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class TopSpace extends StatelessWidget {
  final double? height;
  const TopSpace({Key? key, this.height= 50}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height?? 10.h,
    );
  }
}
