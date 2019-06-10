import 'dart:async';

import 'package:injector/injector.dart';
import 'package:voute/models/config.dart';

abstract class Config {
  static Config di() {
    return Injector.appInstance.getDependency<Config>();
  }

  Future<ConfigModel> fetch();
}
