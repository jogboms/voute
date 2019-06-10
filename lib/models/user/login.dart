import 'package:voute/models/main.dart';

class LoginModel extends Model {
  LoginModel({this.username, this.password});

  ///
  /// Email or Phone number
  String username = '';
  String password = '';

  @override
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      "username": username,
      "password": password,
    };
  }
}
