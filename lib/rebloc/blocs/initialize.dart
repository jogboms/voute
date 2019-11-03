import 'dart:async';

import 'package:rebloc/rebloc.dart';
import 'package:voute/rebloc/actions/bootstrap.dart';
import 'package:voute/rebloc/actions/common.dart';
import 'package:voute/rebloc/states/app.dart';

class InitializeBloc extends SimpleBloc<AppState> {
  @override
  Future<Action> middleware(DispatchFunction dispatcher, AppState state, Action action) async {
    if (action is OnInitAction) {
      dispatcher(const BootstrapAsyncInitAction());
    }

    return action;
  }
}
