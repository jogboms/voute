import 'package:flutter/material.dart';
import 'package:voute/constants/mk_colors.dart';
import 'package:voute/constants/mk_style.dart';
import 'package:voute/utils/mk_theme.dart';
import 'package:voute/widgets/_partials/mk_back_button.dart';
import 'package:voute/widgets/_partials/mk_close_button.dart';

class MkAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MkAppBar({
    Key key,
    @required this.title,
    this.actions,
    this.leading,
    this.useLeading = true,
    this.elevation = 1.0,
    this.bottom,
    this.brightness,
    this.backgroundColor = MkColors.primary,
    this.centerTitle,
    this.color,
  }) : super(key: key);

  final Widget title;
  final Widget leading;
  final List<Widget> actions;
  final double elevation;
  final bool useLeading;
  final bool centerTitle;
  final PreferredSizeWidget bottom;
  final Brightness brightness;
  final Color backgroundColor;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final _style = MkTheme.of(context).appBarTitle.copyWith(color: color);
    final ModalRoute<dynamic> parentRoute = ModalRoute.of(context);
    final bool useCloseButton =
        parentRoute is PageRoute<dynamic> && parentRoute.fullscreenDialog;
    final Widget leadingButton = useCloseButton
        ? MkCloseButton(color: _style.color)
        : MkBackButton(color: _style.color);

    return AppBar(
      brightness: brightness ?? Brightness.dark,
      backgroundColor: backgroundColor,
      automaticallyImplyLeading: useCloseButton ? false : useLeading,
      leading:
          useCloseButton ? null : useLeading ? leading ?? leadingButton : null,
      title: DefaultTextStyle(child: title, style: _style),
      elevation: elevation,
      actions: [
        ...actions ?? [],
        if (useCloseButton)
          Column(
            children: <Widget>[
              MkCloseButton(color: _style.color),
            ],
          ),
      ],
      bottom: bottom,
      centerTitle: centerTitle,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(
        kBaseAppBarHeight + (bottom != null ? bottom.preferredSize.height : 0),
      );
}
