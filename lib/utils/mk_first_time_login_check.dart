import 'package:voute/environments/environment.dart';
import 'package:voute/utils/wrappers/mk_prefs.dart';

const _isFirstTimeLogin = "IS_FIRST_TIME_LOGIN";

class MkFirstTimeLoginCheck {
  static Future<bool> check(Environment env) async {
    if (env.isMock) {
      return true;
    }
    final state = await MkPrefs.getBool(_isFirstTimeLogin);
    if (state != false) {
      return true;
    }
    return false;
  }
}
