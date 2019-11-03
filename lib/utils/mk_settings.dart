import 'package:get_version/get_version.dart';
import 'package:voute/constants/mk_constants.dart';
import 'package:voute/environments/environment.dart';
import 'package:voute/models/config.dart';
import 'package:voute/utils/mk_prefs.dart';

class MkSettings {
  MkSettings._();

  static int userId;
  static Environment environment;
  static bool isTestMode;
  static String tokenKey;

  // TODO: replace with real values
  static String get domain => isDev ? "https://google.com" : "https://google.com";

  static String get api => domain + "/api";

  static String get knownHost => '9TYF86\$G(^_-!@#)&DW@\$&^YHE*RTY';

  static bool get isDev => environment == Environment.DEVELOPMENT;

  static bool get isMock => environment == Environment.MOCK;

  static bool get isTesting => isTestMode;

  static String _versionName = "";
  static Future<void> initVersion() async {
    if (isMock) {
      _versionName = 'v1.0';
      return null;
    }
    return _versionName = await GetVersion.projectVersion.catchError(
      (dynamic e) => null,
    );
  }

  static void setVersion(String version) => _versionName = version;

  static String getVersion() => _versionName;

  static ConfigModel _config;
  static void setConfig(ConfigModel config) => _config = config;

  static ConfigModel get getConfig => _config;

  static Future<bool> checkIsFirstTime() async {
    if (isMock) {
      return true;
    }
    final state = await MkPrefs.getBool(IS_FIRST_TIME);
    if (state != false) {
      await MkPrefs.setBool(IS_FIRST_TIME, false);
      return true;
    }
    return false;
  }

  static Future<bool> checkIsFirstTimeLogin() async {
    if (isMock) {
      return true;
    }
    final state = await MkPrefs.getBool(IS_FIRST_TIME_LOGIN);
    if (state != false) {
      return true;
    }
    return false;
  }

  static Future<void> updateIsFirstTimeLogin() {
    if (isMock) {
      return Future.value();
    }
    return MkPrefs.setBool(IS_FIRST_TIME_LOGIN, false);
  }
}
