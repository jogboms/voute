import 'dart:async' show Future;

import 'package:voute/rebloc/states/main.dart';
import 'package:voute/utils/mk_settings.dart';
import 'package:rebloc/rebloc.dart';

/// Logs each incoming action.
class LoggerBloc extends SimpleBloc<AppState> {
  @override
  Future<Action> afterware(
    DispatchFunction dispatcher,
    AppState state,
    Action action,
  ) async {
    if (!MkSettings.isTesting) {
      print("{\n$state\n}");
    }
    return action;
  }

  @override
  Future<Action> middleware(dispatcher, state, action) async {
    print("[ReBLoC]: ${action.runtimeType}");
    // return await Future.delayed(Duration.zero, () => action);
    return action;
  }
}
