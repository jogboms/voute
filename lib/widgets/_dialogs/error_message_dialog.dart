import 'package:flutter/material.dart';
import 'package:voute/utils/mk_screen_util.dart';
import 'package:voute/widgets/_views/error_result_view.dart';

class ErrorMessageDialog extends StatelessWidget {
  const ErrorMessageDialog({
    Key key,
    @required this.error,
  }) : super(key: key);

  /// An Exception or Error Object
  final dynamic error;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: sw(64),
      ),
      child: Center(
        child: Material(
          borderRadius: BorderRadius.circular(4),
          color: Colors.white,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: sw(32),
              vertical: sh(36),
            ),
            child: ErrorResultView(error: error),
          ),
        ),
      ),
    );
  }
}
