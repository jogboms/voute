import 'dart:async';

import 'package:rebloc/rebloc.dart';
import 'package:voute/rebloc/actions/bootstrap.dart';
import 'package:voute/rebloc/actions/common.dart';
import 'package:voute/rebloc/actions/user.dart';
import 'package:voute/rebloc/states/app.dart';
import 'package:voute/services/users.dart';
import 'package:voute/utils/mk_remember_me_provider.dart';
import 'package:voute/utils/mk_settings.dart';

class AuthBloc extends SimpleBloc<AppState> {
  @override
  Future<Action> middleware(DispatchFunction dispatcher, AppState state, Action action) async {
    if (action is OnLoginAction) {
      final _user = action.user;

      MkSettings.userId = _user.id;

      await MkRememberMeProvider.set(_user.id);

      dispatcher(UserUpdateAction(_user));
    }
    return action;
  }

  @override
  AppState reducer(AppState state, Action action) {
    if (action is OnLogoutAction) {
      return AppState.initialState();
    }

    return state;
  }

  @override
  Future<Action> afterware(DispatchFunction dispatcher, AppState state, Action action) async {
    if (action is OnLogoutAction) {
      await Users.di().logout();
      await MkRememberMeProvider.clear();
      MkSettings.userId = null;
      dispatcher(const BootstrapAsyncInitAction());
    }
    return action;
  }
}
