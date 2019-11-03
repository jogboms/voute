import 'dart:async';

import 'package:http/http.dart' as http;
import 'package:voute/models/user/creation.dart';
import 'package:voute/models/user/login.dart';
import 'package:voute/models/user/user.dart';
import 'package:voute/services/users.dart';
import 'package:voute/utils/mk_http.dart';
import 'package:voute/utils/mk_response_wrapper.dart';

class UsersImpl extends Users {
  @override
  Future<UserModel> fetch(int id) async {
    final response = await MkHttp.get('/auth/profile');
    return MkResponseWrapper<UserModel>(response, onTransform: fromJson).data;
  }

  @override
  Future<MkResponseWrapper<UserModel>> signup(CreateModel data) async {
    final response = await MkHttp.post('/auth/sign-up', data.toMap());
    return fromResponse(response);
  }

  @override
  Future<UserModel> login(LoginModel data) async {
    final response = await MkHttp.post('/auth/sign-in', data.toMap());

    return MkResponseWrapper<UserModel>(response, onTransform: fromJson).data;
  }

  @override
  MkResponseWrapper<UserModel> fromResponse(http.Response response) {
    return MkResponseWrapper<UserModel>(response, onTransform: fromJson);
  }

  @override
  UserModel fromJson(dynamic result) => UserModel.fromJson(result);
}
