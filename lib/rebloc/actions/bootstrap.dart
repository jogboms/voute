import 'package:voute/models/config.dart';
import 'package:meta/meta.dart';
import 'package:rebloc/rebloc.dart';

class BootstrapAsyncLoadingAction extends Action {
  const BootstrapAsyncLoadingAction();
}

class BootstrapAsyncSuccessAction extends Action {
  const BootstrapAsyncSuccessAction({
    @required this.config,
  });

  final ConfigModel config;
}

class BootstrapAsyncFailureAction extends Action {
  const BootstrapAsyncFailureAction(this.error);

  final String error;
}

class BootstrapAsyncInitAction extends Action {
  const BootstrapAsyncInitAction();
}
