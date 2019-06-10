import 'dart:async';

import 'package:rebloc/rebloc.dart';
import 'package:voute/constants/mk_strings.dart';
import 'package:voute/rebloc/actions/user.dart';
import 'package:voute/rebloc/states/main.dart';
import 'package:voute/rebloc/states/user.dart';
import 'package:voute/services/users.dart';

class UserBloc extends SimpleBloc<AppState> {
  @override
  Future<Action> middleware(
    DispatchFunction dispatcher,
    AppState state,
    Action action,
  ) async {
    if (action is UserAsyncInitAction) {
      return const UserAsyncLoadingAction();
    }
    return action;
  }

  @override
  AppState reducer(AppState state, Action action) {
    if (action is UserAsyncLoadingAction) {
      return state.rebuild(
        (s) => s..user.update((b) => b..status = UserStatus.loading),
      );
    }

    if (action is UserAsyncFailureAction) {
      return state.rebuild(
        (s) => s
          ..user.update((b) => b
            ..status = UserStatus.failure
            ..error = action.error),
      );
    }

    if (action is UserUpdateAction) {
      return state.rebuild(
        (s) => s
          ..user.update((b) => b
            ..user = action.user.toBuilder()
            ..status = UserStatus.success),
      );
    }

    return state;
  }

  @override
  Future<Action> afterware(
    DispatchFunction dispatcher,
    AppState state,
    Action action,
  ) async {
    if (action is UserAsyncLoadingAction) {
      try {
        final res = await Users.di().fetch(state.user.user.id);
        dispatcher(UserAsyncSuccessAction(res));
      } catch (error) {
        dispatcher(
          UserAsyncFailureAction(MkStrings.genericError(error)),
        );
      }
    }
    return action;
  }
}
