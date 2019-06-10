import 'package:rebloc/rebloc.dart';
import 'package:voute/models/user/user.dart';
import 'package:voute/rebloc/blocs/auth.dart';
import 'package:voute/rebloc/blocs/bootstrap.dart';
import 'package:voute/rebloc/blocs/initialize.dart';
import 'package:voute/rebloc/blocs/logger.dart';
import 'package:voute/rebloc/blocs/user.dart';
import 'package:voute/rebloc/states/main.dart';
import 'package:voute/rebloc/states/user.dart';

Store<AppState> reblocStore({UserModel user}) {
  return Store<AppState>(
    initialState: AppState.initialState().rebuild(
      (b) => b..user = UserState.withUser(user).toBuilder(),
    ),
    blocs: [
      LoggerBloc(),
      InitializeBloc(),
      AuthBloc(),
      BootstrapBloc(),
      UserBloc(),
    ],
  );
}
