import 'package:voute/models/main.dart';

class CreateModel extends Model {
  CreateModel({
    this.name,
    this.email,
    this.password,
    this.phone,
  });

  String name;
  String email;
  String password;
  String phone;

  @override
  Map<String, String> toMap() {
    return <String, String>{
      "name": name,
      "email": email,
      "password": password,
      "phone": phone,
    };
  }
}
