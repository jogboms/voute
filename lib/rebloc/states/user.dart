import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:voute/models/user/user.dart';

part 'user.g.dart';

abstract class UserState implements Built<UserState, UserStateBuilder> {
  factory UserState([
    UserState updates(UserStateBuilder b),
  ]) = _$UserState;

  factory UserState.initialState() => _$UserState(
        (UserStateBuilder b) => b
          ..user = null
          ..status = UserStatus.loading
          ..message = ""
          ..error = null,
      );

  factory UserState.withUser(UserModel user) => _$UserState(
        (UserStateBuilder b) => b
          ..user = user?.toBuilder()
          ..status = UserStatus.success
          ..message = ""
          ..error = null,
      );

  UserState._();

  @nullable
  UserModel get user;
  UserStatus get status;
  String get message;
  @nullable
  String get error;

  static Serializer<UserState> get serializer => _$userStateSerializer;
}

class UserStatus extends EnumClass {
  const UserStatus._(String name) : super(name);

  static const UserStatus loading = _$loading;
  static const UserStatus success = _$success;
  static const UserStatus failure = _$failure;

  static BuiltSet<UserStatus> get values => _$values;
  static UserStatus valueOf(String name) => _$valueOf(name);
}
