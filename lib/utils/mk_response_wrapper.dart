import 'dart:convert' show json;
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:voute/constants/mk_strings.dart';
import 'package:voute/models/main.dart';
import 'package:voute/utils/mk_exception.dart';
import 'package:voute/utils/mk_settings.dart';

typedef TransformFunction<T> = T Function(dynamic data, String message);

class NoInternetException extends MkResponseException {
  NoInternetException() : super(HttpStatus.serviceUnavailable, MkStrings.networkError);
}

class ForbiddenException extends MkResponseException {
  ForbiddenException([String message]) : super(HttpStatus.forbidden, message);
}

class TimeOutException extends MkResponseException {
  TimeOutException() : super(HttpStatus.requestTimeout, MkStrings.timeoutErrorMessage);
}

class BadRequestException extends MkResponseException {
  BadRequestException([String message]) : super(HttpStatus.badRequest, message);
}

class FileTooLargeException extends MkResponseException {
  FileTooLargeException() : super(HttpStatus.requestEntityTooLarge, MkStrings.isTooLargeMessage);
}

class NotAuthorisedException extends MkResponseException {
  NotAuthorisedException([String message]) : super(HttpStatus.unauthorized, message);
}

class MkResponseException implements MkException {
  MkResponseException(this.statusCode, [this.message]);

  final int statusCode;
  @override
  final String message;

  @override
  String toString() => '$runtimeType($statusCode, $message)';
}

class MkResponseWrapper<T> {
  MkResponseWrapper(
    this._response, {
    TransformFunction<T> onTransform,
    bool showThrow = true,
  }) {
    try {
      final dynamic responseJson = json.decode(_response.body);
      message = responseJson != null && responseJson["message"] != null
          ? responseJson["message"]
          : MkSettings.isDev ? _response.reasonPhrase : MkStrings.errorMessage;
      rawData = _response.statusCode < 300 ? responseJson["data"] : null;
      _authorizationToken = responseJson["authorization_token"];
    } catch (e) {
      message =
          _response.statusCode == HttpStatus.badGateway && !MkSettings.isDev ? MkStrings.errorMessage : e.toString();
      rawData = null;
      _authorizationToken = null;
      if (showThrow) {
        throw MkResponseException(_response.statusCode, message);
      }
    }

    if (showThrow) {
      if (isForbidden) {
        throw ForbiddenException(message);
      }

      if (isNotAuthorized) {
        throw NotAuthorisedException(message);
      }

      if (isBadRequest) {
        throw BadRequestException(message);
      }

      if (isTooLarge) {
        throw FileTooLargeException();
      }

      if (isNotOk) {
        throw MkResponseException(_response.statusCode, message);
      }
    }

    if (onTransform != null) {
      data = onTransform(rawData, message);
    }
  }

  factory MkResponseWrapper.mock(T data, [int statusCode = 200]) {
    return MkResponseWrapper<T>(
      http.Response(
        Model.mapToString(
          <String, dynamic>{
            "message": "Awesome",
            "data": data.toString(),
          },
        ),
        statusCode,
      ),
      onTransform: (dynamic _, __) => data,
    );
  }

  final http.Response _response;
  String message;
  dynamic rawData;
  dynamic _authorizationToken;
  T data;

  int get statusCode => _response.statusCode;

  String get reasonPhrase => _response.reasonPhrase;

  String get token => _authorizationToken != null ? _authorizationToken["token"] : null;

  bool get isOk {
    if (statusCode >= 200 && statusCode < 300) {
      return true;
    } else if (statusCode >= 400 && statusCode < 500) {
      return false;
    } else if (statusCode >= 500) {
      return false;
    }
    return false;
  }

  bool get isNotOk => !isOk;

  bool get isBadRequest => statusCode == HttpStatus.badRequest;

  bool get isNotFound => statusCode == HttpStatus.notFound;

  bool get isNotAcceptable => statusCode == HttpStatus.notAcceptable;

  bool get isNotAuthorized => statusCode == HttpStatus.unauthorized;

  bool get isForbidden => statusCode == HttpStatus.forbidden;

  bool get isTooLarge => statusCode == HttpStatus.requestEntityTooLarge;
}
