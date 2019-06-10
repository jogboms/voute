import 'package:flutter/widgets.dart';
import 'package:voute/widgets/_partials/mk_app_bar.dart';

class MkPlainAppBar extends MkAppBar {
  const MkPlainAppBar({
    Key key,
    @required Widget title,
    Widget leading,
    bool useLeading = true,
    List<Widget> actions,
    bool centerTitle,
    PreferredSizeWidget bottom,
  }) : super(
          key: key,
          title: title,
          elevation: 0,
          backgroundColor: const Color(0x00000000),
          leading: leading,
          useLeading: useLeading,
          actions: actions,
          bottom: bottom,
          centerTitle: centerTitle,
        );
}
