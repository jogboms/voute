import 'dart:async';

import 'package:http/http.dart' show Response;
import 'package:voute/models/user/creation.dart';
import 'package:voute/models/user/login.dart';
import 'package:voute/models/user/user.dart';
import 'package:voute/services/users/users.dart';
import 'package:voute/utils/wrappers/mk_response.dart';

class UsersImpl extends Users {
  @override
  Future<UserModel> fetch(int id) async {
    final response = await http.get('/auth/profile');
    return MkResponse<UserModel>(response, onTransform: fromJson).data;
  }

  @override
  Future<MkResponse<UserModel>> signup(CreateModel data) async {
    final response = await http.post('/auth/sign-up', data.toMap());
    return fromResponse(response);
  }

  @override
  Future<UserModel> login(LoginModel data) async {
    final response = await http.post('/auth/sign-in', data.toMap());

    return MkResponse<UserModel>(response, onTransform: fromJson).data;
  }

  @override
  MkResponse<UserModel> fromResponse(Response response) {
    return MkResponse<UserModel>(response, onTransform: fromJson);
  }

  @override
  UserModel fromJson(dynamic result) => UserModel.fromJson(result);
}
