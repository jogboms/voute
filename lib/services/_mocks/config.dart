import 'dart:async';
import 'dart:math';

import 'package:voute/models/config.dart';
import 'package:voute/models/mock.dart';
import 'package:voute/services/config.dart';

class ConfigMockImpl extends Config {
  @override
  Future<ConfigModel> fetch() async {
    await Future<dynamic>.delayed(const Duration(seconds: 5));
    final _int = Random().nextInt(1);
    if (_int > .9) {
      throw Exception("Please try again. $_int");
    }
    return MockModel.config;
  }
}
