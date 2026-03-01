import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:flutter/material.dart';

class PullToRefreshWidget extends StatelessWidget {
  final Color? indicatorColor;
  final Widget child;
  final Future<void> Function() onRefresh;

  const PullToRefreshWidget(
      {Key? key, required this.child, required this.onRefresh, this.indicatorColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomMaterialIndicator(
      indicatorBuilder: (context, controller) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: 30,
            height: 30,
            // child: SpinKitHourGlass(color: indicatorColor??context.color.kpurple,),
          ),
        );
      },

      onRefresh: onRefresh,
      child: child,
    );
  }
}
