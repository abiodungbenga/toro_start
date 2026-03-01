import 'package:flutter/material.dart';
import 'package:toro_start/widget/pull_to_refresh_widget.dart';

class CustomListViewBuilder extends StatelessWidget {
  final ScrollPhysics? physics;
  final ScrollController? controller;

  final int? itemCount;

  final Axis scrollDirection;

  final bool reverse;

  final NullableIndexedWidgetBuilder itemBuilder;
  final Future<void> Function()? onRefresh;

  final Color? indicatorColor;
  final bool shrinkWrap;
  final bool hasRefreshIndicator;

  final EdgeInsets? padding;
  final ScrollViewKeyboardDismissBehavior keyboardDismissBehavior;
  const CustomListViewBuilder({
    Key? key,
    this.physics = const BouncingScrollPhysics(),
    this.itemCount,
    this.keyboardDismissBehavior = ScrollViewKeyboardDismissBehavior.onDrag,
    this.controller,
    this.padding = EdgeInsets.zero,
    this.reverse = false,
    required this.itemBuilder,
    this.scrollDirection = Axis.vertical,
    this.onRefresh,
    this.hasRefreshIndicator = false,
    this.shrinkWrap = false,
    this.indicatorColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return hasRefreshIndicator
        ? PullToRefreshWidget(
            indicatorColor: indicatorColor,
            onRefresh: onRefresh ?? () async {},
            child: ListView.builder(
              physics: physics,
              itemCount: itemCount,
              controller: controller,
              reverse: reverse,
              shrinkWrap: shrinkWrap,
              padding: padding,
              keyboardDismissBehavior: keyboardDismissBehavior,
              scrollDirection: scrollDirection,
              itemBuilder: itemBuilder,
            ),
          )
        : ListView.builder(
            physics: physics,
            itemCount: itemCount,
            controller: controller,
            shrinkWrap: shrinkWrap,
            reverse: reverse,
            padding: padding,
            keyboardDismissBehavior: keyboardDismissBehavior,
            scrollDirection: scrollDirection,
            itemBuilder: itemBuilder,
          );
  }
}
