import 'package:voute/models/config.dart';
import 'package:voute/models/user/user.dart';

class MockModel {
  static ConfigModel get config => ConfigModel();

  static UserModel get user => UserModel((b) => b
    ..id = 1
    ..email = "jeremiahogbomo@gmail.com"
    ..name = "Jon"
    ..phone = "123456789"
    ..createdAt = DateTime.now()
    ..updatedAt = DateTime.now());
}
