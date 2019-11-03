import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:voute/utils/mk_logger.dart';
import 'package:voute/utils/mk_prefs.dart';

class MkRememberMeProvider {
  static Future<_RememberMeModel> get() async {
    try {
      final json = await MkPrefs.getMap(_persistedIdToken);
      if (json == null) {
        return null;
      }

      final model = _RememberMeModel.fromJson(json);
      MkLogger.d('RememberMeModel: ${json.toString()} - ${model.toString()}');
      return model;
    } on FormatException {
      return null;
    }
  }

  static Future<void> set(int id) => MkPrefs.setMap(
        _persistedIdToken,
        _RememberMeModel(id: id, token: "").toMap(),
      );

  static Future<void> clear() => MkPrefs.remove(_persistedIdToken);
}

const String _persistedIdToken = "PERSISTED_ID_TOKEN";

class _RememberMeModel {
  const _RememberMeModel({@required this.id, @required this.token});

  _RememberMeModel.fromJson(Map<String, dynamic> json)
      : assert(json != null),
        id = json["id"],
        token = json["token"];

  final int id;
  final String token;

  Map<String, dynamic> toMap() => <String, dynamic>{"id": id, "token": token};
}
