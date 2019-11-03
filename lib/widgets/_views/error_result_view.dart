import 'package:flutter/material.dart';
import 'package:voute/constants/mk_colors.dart';
import 'package:voute/constants/mk_strings.dart';
import 'package:voute/utils/mk_screen_util.dart';
import 'package:voute/utils/mk_theme.dart';

class ErrorResultView extends StatelessWidget {
  const ErrorResultView({Key key, this.error}) : super(key: key);

  /// An Exception or Error Object
  final dynamic error;

  @override
  Widget build(BuildContext context) {
    final MkTheme theme = MkTheme.of(context);
    return Opacity(
      opacity: .5,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Icon(Icons.error_outline, color: MkColors.danger, size: sf(50.0)),
          SizedBox(height: sh(16.0)),
          Text(
            error != null
                ? MkStrings.genericError(error)
                : "Don’t panic. Just ensure you’re connected to the internet to continue using ${MkStrings.appName}.",
            style: theme.small.copyWith(fontWeight: FontWeight.w600),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
