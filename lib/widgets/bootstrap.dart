import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:injector/injector.dart';
import 'package:voute/environments/environment.dart';
import 'package:voute/models/user/user.dart';
import 'package:voute/services/config/main.dart';
import 'package:voute/services/users/main.dart';
import 'package:voute/utils/mk_first_time_check.dart';
import 'package:voute/utils/mk_version_check.dart';
import 'package:voute/utils/providers/remember_me_provider.dart';
import 'package:voute/utils/wrappers/mk_http.dart';
import 'package:voute/utils/wrappers/mk_logger.dart';

Future<BootstrapModel> bootstrap(Env env, [bool isTestMode = false]) async {
  final _env = Environment(env);

  MkLogger.init(_env.isDev);

  Injector.appInstance
    ..registerSingleton<Environment>((_) => _env)
    ..registerSingleton<MkHttp>((_) {
      final domain = _env.isDev ? "https://google.com" : "https://google.com";
      return MkHttp(baseUrl: domain + "/api", isDevelopment: _env.isDev);
    })
    ..registerSingleton<Users>((_) => _env.isMock ? UsersMockImpl() : UsersImpl())
    ..registerSingleton<Config>((_) => _env.isMock ? ConfigMockImpl() : ConfigImpl());

  final isFirstTime = await MkFirstTimeCheck.init(_env);

  try {
    await MkVersionCheck.init(_env);

    if (_env.isMock) {
      return BootstrapModel(isFirstTime: true, isTestMode: isTestMode, user: null);
    }

    UserModel user;
    final model = await RememberMeProvider.get();
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
