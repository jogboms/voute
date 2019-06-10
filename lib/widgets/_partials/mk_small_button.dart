import 'package:flutter/material.dart';
import 'package:voute/constants/mk_colors.dart';
import 'package:voute/constants/mk_style.dart';
import 'package:voute/utils/mk_screen_util.dart';
import 'package:voute/utils/mk_theme.dart';

class MkSmallButton extends StatelessWidget {
  const MkSmallButton({
    Key key,
    @required this.child,
    @required this.onPressed,
    this.backgroundColor,
    this.color = Colors.white,
    this.elevation = 0,
    this.shape = const StadiumBorder(),
  })  : assert(child != null),
        super(key: key);

  final Color backgroundColor;
  final Color color;
  final double elevation;
  final ShapeBorder shape;
  final Text child;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      constraints: BoxConstraints.tightFor(height: sh(22)),
      fillColor: backgroundColor ?? MkColors.base_primary.shade400,
      padding: EdgeInsets.symmetric(horizontal: sw(16)),
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      shape: shape,
      elevation: elevation,
      child: DefaultTextStyle(
        style: MkTheme.of(context)
            .xxsmall
            .copyWith(color: color, fontWeight: MkStyle.semibold),
        child: child,
      ),
      onPressed: onPressed,
    );
  }
}
