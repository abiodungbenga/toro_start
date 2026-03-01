import 'package:flutter/material.dart';

import 'pull_to_refresh_widget.dart';

class CustomListViewScrollable extends StatelessWidget {
  final ScrollController? controller;
  final List<Widget> children;
  final bool shrinkWrap;
  final Future<void> Function()? onRefresh;
  final bool hasRefreshIndicator;
  final ScrollViewKeyboardDismissBehavior? keyboardDismissBehavior;

  final
  ScrollPhysics? physics;

  final Color? indicatorColor;

  final Axis scrollDirection;
  final EdgeInsets? padding;
  const CustomListViewScrollable(
      {Key? key,
      this.controller,
      this.padding = EdgeInsets.zero,
      required this.children,
      this.scrollDirection = Axis.vertical,
      this.shrinkWrap = false, this.physics, this.onRefresh,  this.hasRefreshIndicator =false, this.indicatorColor, this.keyboardDismissBehavior})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return hasRefreshIndicator? PullToRefreshWidget(
      onRefresh: onRefresh ?? () async {},
      indicatorColor: indicatorColor,
      child: ListView(
        padding: padding,
        shrinkWrap: shrinkWrap,
        keyboardDismissBehavior: keyboardDismissBehavior??ScrollViewKeyboardDismissBehavior.onDrag,
        physics: physics?? BouncingScrollPhysics(),
        controller: controller,
        scrollDirection: scrollDirection,
        children: children,
      ),
    ):ListView(
      padding: padding,
      shrinkWrap: shrinkWrap,
      keyboardDismissBehavior: keyboardDismissBehavior??ScrollViewKeyboardDismissBehavior.onDrag,
      physics: physics?? BouncingScrollPhysics(),
      controller: controller,
      scrollDirection: scrollDirection,
      children: children,
    );
  }
}
