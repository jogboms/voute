import 'dart:async';

import 'package:http/http.dart' as http;
import 'package:injector/injector.dart';
import 'package:voute/models/user/creation.dart';
import 'package:voute/models/user/login.dart';
import 'package:voute/models/user/user.dart';
import 'package:voute/services/_common/bool_response.dart';
import 'package:voute/services/_common/string_response.dart';
import 'package:voute/utils/mk_response_wrapper.dart';
import 'package:voute/utils/mk_settings.dart';

abstract class Users with BoolResponse, StringResponse {
  static Users di() {
    return Injector.appInstance.getDependency<Users>();
  }

  Future<UserModel> fetch(int id);

  Future<MkResponseWrapper<UserModel>> signup(CreateModel data);

  Future<bool> logout() async {
    MkSettings.tokenKey = null;
    return true;
  }

  Future<UserModel> login(LoginModel data);

  Future<bool> fcmRegister();

  MkResponseWrapper<UserModel> fromResponse(http.Response response);

  UserModel fromJson(dynamic result);
}
