import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:voute/constants/mk_strings.dart';
import 'package:voute/models/main.dart';
import 'package:voute/utils/mk_exceptions.dart';
import 'package:voute/utils/mk_settings.dart';

typedef TransformFunction<T> = T Function(Map<String, dynamic> data);

class MkResponseWrapper<T extends ModelInterface> with ModelInterface {
  factory MkResponseWrapper(http.Response _response, {TransformFunction<T> onTransform, bool shouldThrow = true}) {
    final status = _Status(_response.statusCode);
    try {
      final Map<String, dynamic> responseJson = Model.stringToMap(_response.body);

      if (responseJson == null || status.isNotOk) {
        throw MkResponseException(status.code, MkSettings.isDev ? _response.reasonPhrase : MkStrings.errorMessage);
      }

      return MkResponseWrapper._(
        status: status,
        message: _response.reasonPhrase,
        data: onTransform != null ? onTransform(responseJson["data"]) : null,
      );
    } catch (e) {
      final message = status.code == HttpStatus.badGateway && !MkSettings.isDev ? MkStrings.errorMessage : e.toString();

      if (shouldThrow) {
        if (status.isForbidden) {
          throw ForbiddenException(message);
        }

        if (status.isNotAuthorized) {
          throw UnAuthorisedException(message);
        }

        if (status.isBadRequest) {
          throw BadRequestException(message);
        }

        if (status.isTooLarge) {
          throw FileTooLargeException();
        }

        throw MkResponseException(status.code, message);
      }

      return MkResponseWrapper._(status: status, message: message);
    }
  }

  factory MkResponseWrapper.mock(T data, [int statusCode = 200]) {
    return MkResponseWrapper<T>(
      http.Response(
        Model.mapToString(<String, dynamic>{"message": "Awesome", "data": data.toString()}),
        statusCode,
      ),
      onTransform: (_) => data,
    );
  }

  MkResponseWrapper._({@required this.status, @required this.message, this.data});

  final _Status status;
  final String message;
  final T data;

  @override
  Map<String, dynamic> toMap() => <String, dynamic>{"status": status.code, "message": message, "data": data?.toMap()};
}

class _Status {
  _Status(this.code);

  final int code;

  bool get isOk => code >= HttpStatus.ok && code < HttpStatus.multipleChoices;

  bool get isNotOk => !isOk;

  bool get isBadRequest => code == HttpStatus.badRequest;

  bool get isNotFound => code == HttpStatus.notFound;

  bool get isNotAuthorized => code == HttpStatus.unauthorized;

  bool get isForbidden => code == HttpStatus.forbidden;

  bool get isTooLarge => code == HttpStatus.requestEntityTooLarge;
}
