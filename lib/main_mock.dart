import 'package:flutter/material.dart';
import 'package:voute/environments/environment.dart';
import 'package:voute/widgets/app.dart';
import 'package:voute/widgets/bootstrap.dart';

void main() async {
  // NOTE: so flutter has enough time to calculate sizes
  await Future<dynamic>.delayed(const Duration(seconds: 2));

  final BootstrapModel bs = await bootstrap(Environment.MOCK);

  return runApp(
    App(bootstrap: bs),
  );
}
