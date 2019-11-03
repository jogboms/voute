import 'package:voute/environments/environment.dart';
import 'package:voute/models/config.dart';

class MkSettings {
  static bool get isDev => Environment.di().isDev;

  static bool get isProduction => Environment.di().isProduction;

  static bool get isMock => Environment.di().isMock;

  static ConfigModel _config;
  static void setConfig(ConfigModel config) => _config = config;

  static ConfigModel get getConfig => _config;
}
