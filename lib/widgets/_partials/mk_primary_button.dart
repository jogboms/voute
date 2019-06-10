import 'package:flutter/material.dart';
import 'package:voute/constants/mk_colors.dart';
import 'package:voute/constants/mk_style.dart';
import 'package:voute/utils/mk_screen_util.dart';
import 'package:voute/utils/mk_theme.dart';

class MkPrimaryButton extends StatelessWidget {
  const MkPrimaryButton({
    Key key,
    @required this.child,
    @required this.onPressed,
    this.color = Colors.white,
    this.backgroundColor,
    this.enabled = true,
    this.padding,
    this.shape,
    this.useSafeArea = false,
  }) : super(key: key);

  final Widget child;
  final VoidCallback onPressed;
  final EdgeInsets padding;
  final Color color;
  final Color backgroundColor;
  final ShapeBorder shape;
  final bool enabled;
  final bool useSafeArea;

  @override
  Widget build(BuildContext context) {
    final num _safeAreaBottom = MediaQuery.of(context).padding.bottom;
    final _padding = EdgeInsets.only(
      top: padding?.top ?? sh(8),
      bottom:
          (padding?.bottom ?? sh(8)) + (useSafeArea ? _safeAreaBottom : 0.0),
      left: padding?.left ?? 0.0,
      right: padding?.right ?? 0.0,
    );
    final _height =
        useSafeArea ? kButtonHeight + _safeAreaBottom : kButtonHeight;

    return Container(
      height: _height ?? kButtonHeight,
      constraints: BoxConstraints(
        minWidth: kButtonMinWidth,
      ),
      child: FlatButton(
        color: backgroundColor ?? MkColors.base_primary.shade400,
        padding: _padding,
        shape: shape ??
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
        child: DefaultTextStyle(
          style: MkTheme.of(context).button.copyWith(color: color),
          child: child,
        ),
        onPressed: enabled ? onPressed : null,
      ),
    );
  }
}
