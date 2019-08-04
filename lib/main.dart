import 'package:flutter/widgets.dart';
import 'package:voute/environments/environment.dart';
import 'package:voute/widgets/app.dart';
import 'package:voute/widgets/bootstrap.dart';

void main({
  Environment environment = Environment.MOCK,
  int delay = 0,
}) async {
  await Future<dynamic>.delayed(Duration(seconds: delay));

  runApp(
    App(bootstrap: await bootstrap(environment)),
  );
}
