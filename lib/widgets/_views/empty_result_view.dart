import 'package:flutter/material.dart';
import 'package:voute/constants/mk_style.dart';
import 'package:voute/utils/mk_theme.dart';

class EmptyResultView extends StatelessWidget {
  const EmptyResultView({
    Key key,
    this.message = "No data available",
  }) : super(key: key);

  final String message;

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
          const Icon(
            Icons.equalizer,
            color: kPrimaryColor,
            size: 36.0,
          ),
          const SizedBox(height: 8.0),
          Text(
            message,
            style: theme.small.copyWith(fontWeight: FontWeight.w600),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
