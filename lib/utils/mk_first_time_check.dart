import 'package:voute/environments/environment.dart';
import 'package:voute/utils/mk_prefs.dart';

const _isFirstTime = "IS_FIRST_TIME";

class MkFirstTimeCheck {
  static Future<bool> init(Environment env) async {
    if (env.isMock) {
      return true;
    }
    final state = await MkPrefs.getBool(_isFirstTime);
    if (state != false) {
      await MkPrefs.setBool(_isFirstTime, false);
      return true;
    }
    return false;
  }
}
