import 'package:injector/injector.dart';

enum Env { MOCK, DEVELOPMENT, PRODUCTION }

class Environment {
  const Environment(this.environment);

  static Environment di() => Injector.appInstance.getDependency<Environment>();

  final Env environment;

  bool get isDev => environment == Env.DEVELOPMENT;

  bool get isProduction => environment == Env.PRODUCTION;

  bool get isMock => environment == Env.MOCK;
}
