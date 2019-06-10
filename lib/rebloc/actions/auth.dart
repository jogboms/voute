import 'package:rebloc/rebloc.dart';

class OnLoginLoadingAction extends Action {
  const OnLoginLoadingAction();
}

class OnLoginSuccessAction extends Action {
  const OnLoginSuccessAction(this.account);

  final dynamic account;
}

class OnLoginErrorAction extends Action {
  const OnLoginErrorAction(this.error);

  final Exception error;
}
