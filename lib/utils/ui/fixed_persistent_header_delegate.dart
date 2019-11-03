import 'dart:math' show max;

import 'package:flutter/material.dart';

class FixedPersistentHeaderDelegate extends SliverPersistentHeaderDelegate {
  const FixedPersistentHeaderDelegate({@required this.builder, double height, double minExtent, double maxExtent})
      : minExtent = height ?? minExtent ?? kTextTabBarHeight,
        maxExtent = height ?? maxExtent ?? kTextTabBarHeight;

  final Widget Function(BuildContext context, double shrinkOffset, bool overlapsContent) builder;

  @override
  final double maxExtent;

  @override
  final double minExtent;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return FlexibleSpaceBar.createSettings(
      minExtent: minExtent,
      maxExtent: maxExtent,
      currentExtent: max(minExtent, maxExtent - shrinkOffset),
      child: builder(context, shrinkOffset, overlapsContent),
    );
  }

  @override
  bool shouldRebuild(FixedPersistentHeaderDelegate oldDelegate) => true;
}
