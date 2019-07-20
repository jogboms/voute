import 'package:flutter/material.dart';
import 'package:voute/constants/mk_colors.dart';
import 'package:voute/utils/mk_screen_util.dart';

class MkIconButton extends StatelessWidget {
  const MkIconButton({
    Key key,
    this.icon,
    this.color,
    this.fillColor,
    this.onPressed,
  }) : super(key: key);

  final IconData icon;
  final Color color;
  final Color fillColor;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      constraints: BoxConstraints.tight(Size.square(ss(40))),
      elevation: 0,
      highlightElevation: 0,
      fillColor: fillColor,
      shape: CircleBorder(),
      child: Icon(icon, color: color ?? MkColors.dark),
      onPressed: onPressed,
    );
  }
}
