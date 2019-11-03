import 'dart:async' show TimeoutException;
import 'dart:io';

import 'package:voute/utils/mk_exception.dart';
import 'package:voute/utils/mk_response_wrapper.dart';
import 'package:voute/utils/mk_settings.dart';

class MkStrings {
  MkStrings._();

  static const String appName = "Voute";
  static const String networkError =
      "Please check your network connection or contact your service provider if the problem persists.";
  static const String successMessage = "Hurray!";
  static const String errorMessage = "An error occurred. Please try again.";
  static const String fixErrors = "Please fix the errors in red before submitting";
  static const String timeoutErrorMessage = "This action took too long. Please Retry.";
  static const String isTooLargeMessage = "The file you chose to upload is too large.";
  static const String verifyErrorMessage = "We had issues processing your request, Please Retry.";
  static const List<String> monthsShort = <String>[
    "Jan",
    "Feb",
    "Mar",
    "Apr",
    "May",
    "Jun",
    "Jul",
    "Aug",
    "Sept",
    "Oct",
    "Nov",
    "Dec",
  ];
  static const List<String> monthsFull = <String>[
    "January",
    "Febuary",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December",
  ];
  static final List<int> monthsDays = List<int>.generate(12, (int index) {
    switch (index) {
      case 3:
      case 5:
      case 8:
      case 10:
        return 30;
      case 1:
        return DateTime.now().year % 4 == 0 ? 29 : 28;
      default:
        return 31;
    }
  });

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
