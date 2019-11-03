import 'dart:async' show Future;

import 'package:rebloc/rebloc.dart';
import 'package:voute/rebloc/states/app.dart';
import 'package:voute/utils/mk_logger.dart';

/// Logs each incoming action.
class LoggerBloc extends SimpleBloc<AppState> {
  @override
  Future<Action> afterware(DispatchFunction dispatcher, AppState state, Action action) async {
    return action;
  }

  @override
  Future<Action> middleware(dispatcher, state, action) async {
    MkLogger.d("[ReBLoC]: ${action.runtimeType}");
    // return await Future.delayed(Duration.zero, () => action);
    return action;
  }
}
