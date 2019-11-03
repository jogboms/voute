import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:injector/injector.dart';
import 'package:voute/environments/environment.dart';
import 'package:voute/models/user/user.dart';
import 'package:voute/services/_api/config.dart';
import 'package:voute/services/_api/users.dart';
import 'package:voute/services/_mocks/config.dart';
import 'package:voute/services/_mocks/users.dart';
import 'package:voute/services/config.dart';
import 'package:voute/services/users.dart';
import 'package:voute/utils/mk_first_time_check.dart';
import 'package:voute/utils/mk_logger.dart';
import 'package:voute/utils/mk_remember_me_provider.dart';
import 'package:voute/utils/mk_version_check.dart';

Future<BootstrapModel> bootstrap(Env env, [bool isTestMode = false]) async {
  final _env = Environment(env);

  MkLogger.init(_env.isDev);

  Injector.appInstance
    ..registerSingleton<Environment>((_) => Environment(env))
    ..registerSingleton<Users>((_) => _env.isMock ? UsersMockImpl() : UsersImpl())
    ..registerSingleton<Config>((_) => _env.isMock ? ConfigMockImpl() : ConfigImpl());

  final isFirstTime = await MkFirstTimeCheck.init(_env);

  try {
    await MkVersionCheck.init(_env);

    if (_env.isMock) {
      return BootstrapModel(isFirstTime: true, isTestMode: isTestMode, user: null);
    }

    UserModel user;
    final model = await MkRememberMeProvider.get();
    if (model != null) {
      user = await Users.di().fetch(model.id);
    }

    return BootstrapModel(user: user, isTestMode: isTestMode, isFirstTime: isFirstTime);
  } catch (e) {
    MkLogger.d('$e');
  }

  return BootstrapModel(user: null, isFirstTime: false);
}

class BootstrapModel {
  const BootstrapModel({@required this.user, @required this.isFirstTime, this.isTestMode = false})
      : isRemembered = user != null;

  final UserModel user;
  final bool isFirstTime;
  final bool isRemembered;
  final bool isTestMode;
}
