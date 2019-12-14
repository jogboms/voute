import 'dart:async';

import 'package:injector/injector.dart';
import 'package:voute/models/config.dart';
import 'package:voute/services/base_service.dart';

abstract class Config extends BaseService {
  static Config di() => Injector.appInstance.getDependency<Config>();

  Future<ConfigModel> fetch();
}
