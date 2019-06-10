import 'dart:math' show max;

import 'package:flutter/material.dart';

class MkPersistentHeaderDelegate extends SliverPersistentHeaderDelegate {
  const MkPersistentHeaderDelegate({
    @required this.builder,
    double height,
    double minExtent,
    double maxExtent,
  })  : minExtent = height ?? minExtent ?? kTextTabBarHeight,
        maxExtent = height ?? maxExtent ?? kTextTabBarHeight;

  factory MkPersistentHeaderDelegate.isAtTop({
    @required Widget Function(BuildContext context, bool isAtTop) builder,
    double height,
    double minExtent,
    double maxExtent,
  }) {
    final _minExtent = height ?? minExtent ?? kTextTabBarHeight;
    final _maxExtent = height ?? maxExtent ?? kTextTabBarHeight;
    return MkPersistentHeaderDelegate(
      height: height,
      minExtent: _minExtent,
      maxExtent: _maxExtent,
      builder:
          (BuildContext context, double shrinkOffset, bool overlapsContent) {
        return builder(context, shrinkOffset > (_maxExtent - _minExtent));
      },
    );
  }

  final Widget Function(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) builder;
  @override
  final double maxExtent;
  @override
  final double minExtent;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return FlexibleSpaceBar.createSettings(
      minExtent: minExtent,
      maxExtent: maxExtent,
      currentExtent: max(minExtent, maxExtent - shrinkOffset),
      child: builder(context, shrinkOffset, overlapsContent),
    );
  }

  @override
  bool shouldRebuild(MkPersistentHeaderDelegate oldDelegate) => true;
}
