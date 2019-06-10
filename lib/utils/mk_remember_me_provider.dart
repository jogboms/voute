import 'dart:async';

import 'package:voute/constants/mk_constants.dart';
import 'package:voute/models/user/remember_me.dart';
import 'package:voute/utils/mk_prefs.dart';
import 'package:voute/utils/mk_settings.dart';

class MkRememberMeProvider {
  static Future<RememberMeModel> fetch() async {
    RememberMeModel model;
    try {
      final json = await MkPrefs.getMap(PERSISTED_ID_TOKEN);
      if (json != null) {
        model = RememberMeModel.fromJson(json);
        MkSettings.tokenKey = model.token;
      }
      print(['RememberMeModel', json, model]);
    } on FormatException {
      model = null;
    }

    return model;
  }
}
