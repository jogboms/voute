import 'dart:async' show TimeoutException;
import 'dart:io';

import 'package:voute/utils/mk_settings.dart';
import 'package:voute/utils/wrappers/mk_exceptions.dart';

class MkStrings {
  static const String appName = "Voute";
  static const String networkError =
      "Please check your network connection or contact your service provider if the problem persists.";
  static const String errorMessage = "An error occurred. Please try again.";
  static const String fixErrors = "Please fix the errors in red before submitting";
  static const String timeoutErrorMessage = "This action took too long. Please Retry.";
  static const String isTooLargeMessage = "The file you chose to upload is too large.";

  static String genericError(dynamic error) {
    if (error is String) {
      return error;
    }
    if (error is SocketException) {
      return networkError;
    }
    if (error is TimeoutException || error is TimeOutException) {
      return timeoutErrorMessage;
    }
    if (error is MkException) {
      return (error?.message ?? error).toString();
    }
    if (!MkSettings.isDev) {
      return errorMessage;
    }
    return error != null ? error.toString() : errorMessage;
  }
}
