import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:voute/rebloc/states/bootstrap.dart';
import 'package:voute/rebloc/states/user.dart';

part 'main.g.dart';

abstract class AppState implements Built<AppState, AppStateBuilder> {
  factory AppState([
    void updates(AppStateBuilder b),
  ]) = _$AppState;

  factory AppState.initialState() => _$AppState(
        (AppStateBuilder b) => b
          ..user = UserState.initialState().toBuilder()
          ..bootstrap = BootstrapState.initialState().toBuilder(),
      );

  AppState._();

  UserState get user;
  BootstrapState get bootstrap;

  static Serializer<AppState> get serializer => _$appStateSerializer;
}
