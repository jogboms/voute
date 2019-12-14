import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:voute/utils/mk_screen_util.dart';
import 'package:voute/widgets/_partials/mk_clear_button.dart';
import 'package:voute/widgets/app_theme.dart';

class MkCloseButton extends StatelessWidget {
  const MkCloseButton({Key key, this.color, this.onPop}) : super(key: key);

  final Color color;
  final VoidCallback onPop;

  @override
  Widget build(BuildContext context) {
    return MkClearButton(
      child: Icon(FeatherIcons.x, color: color ?? AppTheme.of(context).appBarTitle.color, size: sf(32)),
      onPressed: onPop ?? () => Navigator.maybePop(context),
    );
  }
}
