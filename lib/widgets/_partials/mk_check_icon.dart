import 'package:flutter/material.dart';
import 'package:voute/constants/mk_colors.dart';

class MkCheckIcon extends StatelessWidget {
  const MkCheckIcon({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Icon(
      Icons.check,
      color: MkColors.primary,
      size: 18,
    );
  }
}
