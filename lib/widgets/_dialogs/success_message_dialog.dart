import 'package:flutter/material.dart';
import 'package:voute/utils/mk_screen_util.dart';
import 'package:voute/widgets/app_theme.dart';

class SuccessMessageDialog extends StatelessWidget {
  const SuccessMessageDialog({Key key, @required this.message}) : super(key: key);

  final String message;

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = AppTheme.of(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: sw(64)),
      child: Center(
        child: Material(
          borderRadius: BorderRadius.circular(4),
          color: Colors.white,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: sw(32), vertical: sh(36)),
            child: Opacity(
              opacity: .75,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  SizedBox.fromSize(size: Size.square(sf(100.0)), child: Icon(Icons.check)),
                  if (message != null) ...[
                    SizedBox(height: sh(16.0)),
                    Text(
                      message,
                      style: theme.small.copyWith(fontWeight: FontWeight.w600),
                      textAlign: TextAlign.center,
                    )
                  ]
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
