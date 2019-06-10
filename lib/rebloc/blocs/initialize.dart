import 'dart:async';

import 'package:rebloc/rebloc.dart';
import 'package:voute/rebloc/actions/bootstrap.dart';
import 'package:voute/rebloc/actions/common.dart';
import 'package:voute/rebloc/states/main.dart';
import 'package:voute/utils/mk_settings.dart';

class InitializeBloc extends SimpleBloc<AppState> {
  @override
  Future<Action> middleware(
    DispatchFunction dispatcher,
    AppState state,
    Action action,
  ) async {
    if (action is OnInitAction) {
      dispatcher(const BootstrapAsyncInitAction());
      if (state.user.user != null) {
        MkSettings.userId = state.user.user.id;
      }
    }

    if (action is OnDisposeAction) {
      MkSettings.userId = null;
    }

    return action;
  }
}
