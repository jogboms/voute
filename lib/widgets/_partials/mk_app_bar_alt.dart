import 'package:flutter/material.dart';
import 'package:voute/constants/mk_style.dart';
import 'package:voute/utils/mk_persistent_header_delegate.dart';
import 'package:voute/utils/mk_screen_util.dart';

class _AppBar extends StatelessWidget implements PreferredSizeWidget {
  const _AppBar({
    Key key,
    @required this.child,
  })  : assert(child != null),
        super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: sh(4),
        bottom: sh(4),
        left: sw(16),
        right: sw(16),
      ),
      child: child,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kBaseAppBarHeight);
}

class MkSliverAppBarAlt extends StatelessWidget {
  const MkSliverAppBarAlt({
    Key key,
    @required this.child,
  })  : assert(child != null),
        super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: MkPersistentHeaderDelegate(
        height: kBaseAppBarHeight + MkScreenUtil().safeArea.top,
        builder: (context, __, ___) {
          return Material(
            elevation: 4,
            shadowColor: Colors.black54,
            child: SafeArea(
              bottom: false,
              child: _AppBar(child: child),
            ),
          );
        },
      ),
    );
  }
}
