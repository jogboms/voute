import 'package:http/http.dart';
import 'package:voute/models/mock.dart';
import 'package:voute/models/user/creation.dart';
import 'package:voute/models/user/login.dart';
import 'package:voute/models/user/user.dart';
import 'package:voute/services/users/users.dart';
import 'package:voute/utils/wrappers/mk_response.dart';

class UsersMockImpl extends Users {
  @override
  Future<UserModel> fetch(int id) async => MockModel.user;

  @override
  MkResponse<UserModel> fromResponse(Response response) => MkResponse<UserModel>.mock(fromJson(null));

  @override
  Future<UserModel> login(LoginModel data) async => MockModel.user;

  @override
  Future<MkResponse<UserModel>> signup(CreateModel data) async => MkResponse<UserModel>.mock(fromJson(null));

  @override
  UserModel fromJson(dynamic result) => MockModel.user;
}
