import 'package:meta/meta.dart';

class RememberMeModel {
  const RememberMeModel({
    @required this.id,
    @required this.token,
  });

  RememberMeModel.fromJson(Map<String, dynamic> json)
      : assert(json != null),
        id = json["id"],
        token = json["token"];

  final int id;
  final String token;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      "id": id,
      "token": token,
    };
  }
}
