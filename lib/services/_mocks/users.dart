import 'package:http/http.dart';
import 'package:voute/models/mock.dart';
import 'package:voute/models/user/creation.dart';
import 'package:voute/models/user/login.dart';
import 'package:voute/models/user/user.dart';
import 'package:voute/services/users.dart';
import 'package:voute/utils/mk_response_wrapper.dart';

class UsersMockImpl extends Users {
  @override
  Future<UserModel> fetch(int id) async => MockModel.user;

  @override
  MkResponseWrapper<UserModel> fromResponse(Response response) => MkResponseWrapper<UserModel>.mock(fromJson(null));

  @override
  Future<UserModel> login(LoginModel data) async => MockModel.user;

  @override
  Future<MkResponseWrapper<UserModel>> signup(CreateModel data) async =>
      MkResponseWrapper<UserModel>.mock(fromJson(null));

  @override
  UserModel fromJson(dynamic result) => MockModel.user;
}
