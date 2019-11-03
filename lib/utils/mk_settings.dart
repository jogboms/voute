import 'package:voute/environments/environment.dart';
import 'package:voute/models/config.dart';

class MkSettings {
  MkSettings._();

  static int userId;

  // TODO: replace with real values
  static String get domain => Environment.di().isDev ? "https://google.com" : "https://google.com";

  static String get api => domain + "/api";

  static String get knownHost => '9TYF86\$G(^_-!@#)&DW@\$&^YHE*RTY';

  static bool get isDev => Environment.di().isDev;

  static bool get isProduction => Environment.di().isProduction;

  static bool get isMock => Environment.di().isMock;

  static ConfigModel _config;
  static void setConfig(ConfigModel config) => _config = config;

  static ConfigModel get getConfig => _config;
}

const String _isFirstTime = "IS_FIRST_TIME";
const String _isFirstTimeLogin = "IS_FIRST_TIME_LOGIN";
