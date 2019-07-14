import 'package:colorize_lumberdash/colorize_lumberdash.dart';
import 'package:lumberdash/lumberdash.dart';
import 'package:voute/utils/mk_exception.dart';

class MkLogger {
  static void init(bool isDebug) =>
      putLumberdashToWork(withClient: ColorizeLumberdash());

  static void w(String reason) => logWarning(reason);

  static void f(String reason) => logFatal(reason);

  static void d(String reason) => logMessage(reason);

  static void e(dynamic reason) => logError(MkException(reason));
}
