import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:voute/utils/mk_screen_util.dart';
import 'package:voute/widgets/_partials/mk_clear_button.dart';
import 'package:voute/widgets/app_theme.dart';

class MkBackButton extends StatelessWidget {
  const MkBackButton({Key key, this.color, this.onPop}) : super(key: key);

  final Color color;
  final VoidCallback onPop;

  @override
  Widget build(BuildContext context) {
    return MkClearButton(
      child: Icon(
        FeatherIcons.arrowLeft,
        color: color ?? AppTheme.of(context).appBarTitle.color,
        size: sf(24),
      ),
      onPressed: onPop ?? () => Navigator.maybePop(context),
    );
  }
}
