import 'dart:io';

import 'package:voute/constants/mk_strings.dart';

class ForbiddenException extends MkResponseException {
  ForbiddenException([String message]) : super(HttpStatus.forbidden, message);
}

class NoInternetException extends MkResponseException {
  NoInternetException() : super(HttpStatus.serviceUnavailable, MkStrings.networkError);
}

class FileTooLargeException extends MkResponseException {
  FileTooLargeException() : super(HttpStatus.requestEntityTooLarge, MkStrings.isTooLargeMessage);
}

class TimeOutException extends MkResponseException {
  TimeOutException() : super(HttpStatus.requestTimeout, MkStrings.timeoutErrorMessage);
}

class BadRequestException extends MkResponseException {
  BadRequestException([String message]) : super(HttpStatus.badRequest, message);
}

class UnAuthorisedException extends MkResponseException {
  UnAuthorisedException([String message]) : super(HttpStatus.unauthorized, message);
}

class MkResponseException implements MkException {
  MkResponseException(this.statusCode, [this.message]);

  final int statusCode;

  @override
  final String message;

  @override
  String toString() => '$runtimeType($statusCode, $message)';
}

class MkException implements Exception {
  MkException([this.message]);

  final String message;

  @override
  String toString() => message == null ? "$runtimeType" : "$runtimeType($message)";
}
