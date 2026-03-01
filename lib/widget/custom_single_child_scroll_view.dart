import 'package:flutter/material.dart';
import 'package:toro_start/widget/pull_to_refresh_widget.dart';

class CustomSingleChildScrollView extends StatelessWidget {
  final ScrollPhysics? physics;
  final EdgeInsets? padding;
  final ScrollController? controller;
  final Future<void> Function()? onRefresh;
  final bool hasRefreshIndicator;
  final bool? primary;

  final Color? indicatorColor;
  final Widget? child;
  final Axis? scrollDirection;

  const CustomSingleChildScrollView(
      {Key? key,
      this.physics,
      this.padding,
      this.controller,
      this.child,
      this.scrollDirection,
      this.onRefresh,
      this.hasRefreshIndicator = false,
      this.indicatorColor,
      this.primary})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return hasRefreshIndicator
        ? PullToRefreshWidget(
            onRefresh: onRefresh ?? () async {},
            indicatorColor: indicatorColor,
            child: SingleChildScrollView(
              primary: primary,
              physics: physics ?? AlwaysScrollableScrollPhysics(),
              padding: padding ?? EdgeInsets.zero,
              controller: controller,
              scrollDirection: scrollDirection ?? Axis.vertical,
              child: child,
            ),
          )
        : SingleChildScrollView(
            primary: primary,
            physics: physics ?? AlwaysScrollableScrollPhysics(),
            padding: padding ?? EdgeInsets.zero,
            controller: controller,
            scrollDirection: scrollDirection ?? Axis.vertical,
            child: child,
          );
  }
}
