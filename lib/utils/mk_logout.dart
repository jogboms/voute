import 'package:flutter/widgets.dart';
import 'package:rebloc/rebloc.dart';
import 'package:voute/constants/mk_routes.dart';
import 'package:voute/rebloc/actions/common.dart';
import 'package:voute/rebloc/states/app.dart';
import 'package:voute/screens/splash/splash_page.dart';
import 'package:voute/utils/mk_navigate.dart';

Future<void> mkOnLogout(BuildContext context) async {
  StoreProvider.of<AppState>(context).dispatch(const OnLogoutAction());

  await Navigator.of(context).pushAndRemoveUntil<void>(
    MkNavigate.fadeIn<void>(const SplashPage(), name: MkRoutes.start),
    (_) => false,
  );
}
