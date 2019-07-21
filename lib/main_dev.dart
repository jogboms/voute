import 'package:flutter/widgets.dart';
import 'package:voute/environments/environment.dart';
import 'package:voute/widgets/app.dart';
import 'package:voute/widgets/bootstrap.dart';

void main() async {
  // NOTE: only for demo purposes
  await Future<dynamic>.delayed(const Duration(seconds: 2));

  final BootstrapModel bs = await bootstrap(Environment.DEVELOPMENT);

  return runApp(
    App(bootstrap: bs),
  );
}
