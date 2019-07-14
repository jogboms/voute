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
import 'package:voute/utils/mk_logger.dart';
import 'package:voute/utils/mk_remember_me_provider.dart';
import 'package:voute/utils/mk_settings.dart';

Future<BootstrapModel> bootstrap(
  Environment env, [
  bool isTestMode = false,
]) async {
  MkSettings.environment = env;
  MkSettings.isTestMode = isTestMode;

  MkLogger.init(MkSettings.isDev);

  Injector.appInstance
    ..registerSingleton<Users>(
      (_) => MkSettings.isMock ? UsersMockImpl() : UsersImpl(),
    )
    ..registerSingleton<Config>(
      (_) => MkSettings.isMock ? ConfigMockImpl() : ConfigImpl(),
    );

  return _BootstrapService.init(isTestMode);
}

class BootstrapModel {
  const BootstrapModel({
    @required this.user,
    @required this.isFirstTime,
    this.isTestMode = false,
  }) : isRemembered = user != null;

  final UserModel user;
  final bool isFirstTime;
  final bool isRemembered;
  final bool isTestMode;
}

class _BootstrapService {
  static Future<BootstrapModel> init([bool isTestMode = false]) async {
    UserModel user;
    final isFirstTime = await MkSettings.checkIsFirstTimeLogin();

    try {
      await MkSettings.initVersion();
      final model = await MkRememberMeProvider.fetch();
      if (model != null) {
        user = await Users.di().fetch(model.id);
      }
    } catch (e) {
      MkLogger.d('$e');
    }

    if (MkSettings.isMock) {
      return BootstrapModel(
        isFirstTime: true,
        isTestMode: isTestMode,
        user: null,
      );
    }

    return BootstrapModel(
      user: user,
      isTestMode: isTestMode,
      isFirstTime: isFirstTime,
    );
  }
}
