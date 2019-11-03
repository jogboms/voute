import 'package:get_version/get_version.dart';
import 'package:voute/environments/environment.dart';

class MkVersionCheck {
  static String _versionName = "";
  static Future<void> init(Environment env) async {
    if (env.isMock) {
      _versionName = 'v1.0';
      return null;
    }
    return _versionName = await GetVersion.projectVersion.catchError(
      (dynamic e) => null,
    );
  }

  static void set(String version) => _versionName = version;

  static String get() => _versionName;
}
