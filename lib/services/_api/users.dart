import 'dart:async';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:voute/constants/mk_constants.dart';
import 'package:voute/models/user/creation.dart';
import 'package:voute/models/user/login.dart';
import 'package:voute/models/user/user.dart';
import 'package:voute/services/users.dart';
import 'package:voute/utils/mk_http.dart';
import 'package:voute/utils/mk_prefs.dart';
import 'package:voute/utils/mk_response_wrapper.dart';
import 'package:voute/utils/mk_settings.dart';

class UsersImpl extends Users {
  @override
  Future<UserModel> fetch(int id) async {
    final response = await MkHttp.get('/auth/profile');
    final res = MkResponseWrapper<dynamic>(response);
    return fromJson(res.rawData);
  }

  @override
  Future<MkResponseWrapper<UserModel>> signup(
    CreateModel data,
  ) async {
    final response = await MkHttp.post('/auth/sign-up', data.toMap());
    return fromResponse(response);
  }

  @override
  Future<UserModel> login(LoginModel data) async {
    final response = await MkHttp.post('/auth/sign-in', data.toMap());

    final res = MkResponseWrapper<UserModel>(response);

    MkSettings.tokenKey = res.token;

    return fromJson(res.rawData);
  }

  @override
  Future<bool> fcmRegister() async {
    final _token = await MkPrefs.getString(FCM_DEVICE_TOKEN);
    final response = await MkHttp.post(
      '/registerDevice',
      <String, String>{
        "deviceId": _token,
        "type": Platform.isAndroid ? "android" : "ios"
      },
    );

    return fromBoolResponse(response);
  }

  @override
  MkResponseWrapper<UserModel> fromResponse(http.Response response) {
    return MkResponseWrapper<UserModel>(response, onTransform: (
      dynamic result,
      String message,
    ) {
      if (result == null) {
        return result;
      }

      return fromJson(result);
    });
  }

  @override
  UserModel fromJson(dynamic result) => UserModel.fromJson(result);
}
