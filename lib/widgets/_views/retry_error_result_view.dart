import 'package:flutter/widgets.dart';
import 'package:voute/widgets/_partials/mk_clear_button.dart';
import 'package:voute/widgets/_views/error_result_view.dart';

class RetryErrorResultView extends StatelessWidget {
  const RetryErrorResultView({Key key, this.error, @required this.onRetry}) : super(key: key);

  /// An Exception or Error Object
  final dynamic error;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        ErrorResultView(error: error),
        const SizedBox(height: 16.0),
        MkClearButton(child: const Text("TRY AGAIN"), onPressed: onRetry),
      ],
    );
  }
}
