import 'dart:async';

import 'package:http/http.dart' as http;
import 'package:injector/injector.dart';
import 'package:voute/models/user/creation.dart';
import 'package:voute/models/user/login.dart';
import 'package:voute/models/user/user.dart';
import 'package:voute/services/base_service.dart';
import 'package:voute/utils/wrappers/mk_response.dart';

abstract class Users extends BaseService {
  static Users di() => Injector.appInstance.getDependency<Users>();

  Future<UserModel> fetch(int id);

  Future<MkResponse<UserModel>> signup(CreateModel data);

  Future<bool> logout() async => true;

  Future<UserModel> login(LoginModel data);

  MkResponse<UserModel> fromResponse(http.Response response);

  UserModel fromJson(dynamic result);
}
