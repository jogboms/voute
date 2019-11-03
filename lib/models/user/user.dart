import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:voute/models/main.dart';
import 'package:voute/models/serializers.dart';

part 'user.g.dart';

abstract class UserModel with ModelInterface implements Built<UserModel, UserModelBuilder> {
  factory UserModel([
    void updates(UserModelBuilder b),
  ]) = _$UserModel;

  UserModel._();

  int get id;

  String get email;

  String get phone;

  String get name;

  @BuiltValueField(wireName: 'created_at')
  DateTime get createdAt;

  @nullable
  @BuiltValueField(wireName: 'updated_at')
  DateTime get updatedAt;

  @override
  Map<String, dynamic> toMap() => serializers.serializeWith(UserModel.serializer, this);

  static UserModel fromJson(Map<String, dynamic> map) => serializers.deserializeWith(UserModel.serializer, map);

  static Serializer<UserModel> get serializer => _$userModelSerializer;
}
