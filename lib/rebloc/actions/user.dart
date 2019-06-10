import 'package:voute/models/user/user.dart';
import 'package:rebloc/rebloc.dart';

class UserAsyncLoadingAction extends Action {
  const UserAsyncLoadingAction();
}

class UserAsyncSuccessAction extends UserUpdateAction {
  const UserAsyncSuccessAction(UserModel user) : super(user);
}

class UserAsyncFailureAction extends Action {
  const UserAsyncFailureAction(this.error);

  final String error;
}

class UserAsyncInitAction extends Action {
  const UserAsyncInitAction();
}

class UserUpdateAction extends Action {
  const UserUpdateAction(this.user);

  final UserModel user;
}
