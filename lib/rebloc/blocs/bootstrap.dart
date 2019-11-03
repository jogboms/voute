import 'dart:async';

import 'package:rebloc/rebloc.dart';
import 'package:voute/constants/mk_strings.dart';
import 'package:voute/rebloc/actions/bootstrap.dart';
import 'package:voute/rebloc/states/app.dart';
import 'package:voute/rebloc/states/bootstrap.dart';
import 'package:voute/services/config/main.dart';
import 'package:voute/utils/mk_retry.dart';
import 'package:voute/utils/mk_settings.dart';
import 'package:voute/utils/wrappers/mk_logger.dart';

class BootstrapBloc extends SimpleBloc<AppState> {
  @override
  Future<Action> middleware(DispatchFunction dispatcher, AppState state, Action action) async {
    if (action is BootstrapAsyncInitAction) {
      return const BootstrapAsyncLoadingAction();
    }
    return action;
  }

  @override
  AppState reducer(AppState state, Action action) {
    if (action is BootstrapAsyncLoadingAction) {
      return state.rebuild(
        (s) => s..bootstrap.update((b) => b..status = BootstrapStatus.loading),
      );
    }

    if (action is BootstrapAsyncFailureAction) {
      return state.rebuild(
        (s) => s
          ..bootstrap.update((b) => b
            ..status = BootstrapStatus.failure
            ..error = action.error),
      );
    }

    if (action is BootstrapAsyncSuccessAction) {
      return state.rebuild(
        (s) => s
          ..bootstrap.update((b) => b
            ..config = action.config.toBuilder()
            ..status = BootstrapStatus.success),
      );
    }

    return state;
  }

  @override
  Future<Action> afterware(DispatchFunction dispatcher, AppState state, Action action) async {
    if (action is BootstrapAsyncLoadingAction) {
      try {
        final _config = await mkRetry(() => Config.di().fetch(), tryLimit: 1);
        MkSettings.setConfig(_config);
        dispatcher(BootstrapAsyncSuccessAction(config: _config));
      } catch (error) {
        MkLogger.d("$error");
        dispatcher(BootstrapAsyncFailureAction(MkStrings.genericError(error)));
      }
    }
    return action;
  }
}
