import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:voute/constants/mk_style.dart';
import 'package:voute/utils/mk_screen_util.dart';
import 'package:voute/utils/ui/fixed_persistent_header_delegate.dart';
import 'package:voute/widgets/_partials/mk_icon_button.dart';

class MkSearchBarRow extends StatelessWidget {
  const MkSearchBarRow({Key key, this.trailing}) : super(key: key);

  final Widget trailing;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: TextField(
            decoration: InputDecoration(
              prefixIcon: Icon(FeatherIcons.search),
              suffixIcon: MkIconButton(icon: FeatherIcons.xCircle, color: Colors.black12, onPressed: () {}),
            ),
          ),
        ),
        if (trailing != null) ...[
          SizedBox(width: sw(8)),
          trailing,
        ]
      ],
    );
  }
}

class MkSliverAppBarAlt extends StatelessWidget {
  const MkSliverAppBarAlt({Key key, @required this.child})
      : assert(child != null),
        super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: FixedPersistentHeaderDelegate(
        height: sh(kBaseAppBarHeight) + MkScreenUtil().safeArea.top,
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

class _AppBar extends StatelessWidget implements PreferredSizeWidget {
  const _AppBar({Key key, @required this.child})
      : assert(child != null),
        super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: sh(4), bottom: sh(4), left: sw(16), right: sw(16)),
      child: child,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(sh(kBaseAppBarHeight));
}
