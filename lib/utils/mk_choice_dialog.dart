import 'dart:async';

import 'package:flutter/material.dart';
import 'package:voute/constants/mk_colors.dart';
import 'package:voute/constants/mk_style.dart';
import 'package:voute/utils/mk_screen_util.dart';
import 'package:voute/utils/mk_theme.dart';
import 'package:voute/widgets/_partials/mk_clear_button.dart';

Future<bool> mkChoiceDialog({
  String title,
  @required String message,
  @required BuildContext context,
}) =>
    showDialog<bool>(
      context: context,
      builder: (_) => _MkChoiceDialog(
            title: title,
            message: message,
          ),
    );

class _MkChoiceDialog extends StatelessWidget {
  const _MkChoiceDialog({
    Key key,
    @required this.title,
    @required this.message,
  }) : super(key: key);

  final String title;
  final String message;

  @override
  Widget build(BuildContext context) {
    final _theme = MkTheme.of(context);
    return AlertDialog(
      title: title != null ? Text(title) : null,
      content: Text(message),
      titleTextStyle: _theme.title.copyWith(color: MkColors.primary),
      contentTextStyle: _theme.subhead1Semi.copyWith(height: 1.5),
      contentPadding: EdgeInsets.fromLTRB(
        sw(24),
        sh(20),
        sw(24),
        sh(8),
      ),
      elevation: 2,
      actions: <Widget>[
        MkClearButton(
          color: kHintColor,
          child: const Text("Close"),
          onPressed: () => Navigator.pop(context, false),
        ),
        SizedBox(width: sw(4)),
        MkClearButton(
          child: Text("Continue"),
          onPressed: () => Navigator.pop(context, true),
        ),
        SizedBox(width: sw(8)),
      ],
    );
  }
}
