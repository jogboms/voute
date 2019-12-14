import 'dart:async' show Future, TimeoutException;
import 'dart:convert' show json;
import 'dart:io' show HttpHeaders, SocketException;

import 'package:flutter/foundation.dart' show required;
import 'package:http/http.dart' show Response;
import 'package:http_logger/http_logger.dart';
import 'package:http_middleware/http_middleware.dart';
import 'package:voute/utils/wrappers/mk_exceptions.dart';

class MkHttp {
  MkHttp({@required this.baseUrl, bool isDevelopment = true})
      : _http = HttpWithMiddleware.build(
          requestTimeout: Duration(seconds: isDevelopment ? 30 : 45),
          middlewares: [_Interceptor(), HttpLogger(logLevel: isDevelopment ? LogLevel.BODY : LogLevel.NONE)],
        );

  final HttpWithMiddleware _http;

  final String baseUrl;

  Future<Response> _request(_Method type, String url, [Map<String, dynamic> data]) {
    try {
      final _url = "$baseUrl$url";
      switch (type) {
        case _Method.Delete:
          return _http.delete(_url);
        case _Method.Post:
          return _http.post(_url, body: data);
        case _Method.Put:
          return _http.put(_url, body: data);
        case _Method.Patch:
          return _http.patch(_url, body: data);
        case _Method.Get:
        default:
          return _http.get(_url);
      }
    } on SocketException {
      throw NoInternetException();
    } on TimeoutException {
      throw TimeOutException();
    }
  }

  Future<Response> get(String url) => _request(_Method.Get, url);

  Future<Response> post(String url, Map<String, dynamic> data) => _request(_Method.Post, url, data);

  Future<Response> patch(String url, Map<String, dynamic> data) => _request(_Method.Patch, url, data);

  Future<Response> delete(String url) => _request(_Method.Delete, url);

  Future<Response> put(String url, Map<String, dynamic> data) => _request(_Method.Put, url, data);
}

enum _Method {
  Get,
  Post,
  Patch,
  Delete,
  Put,
}

class _Interceptor implements MiddlewareContract {
  @override
  void interceptRequest({RequestData data}) {
    data.body = data.body != null ? json.encode(data.body) : null;
    data.headers = {
      ...data.headers,
      HttpHeaders.contentTypeHeader: "application/json",
    };
  }

  @override
  void interceptResponse({ResponseData data}) {}
}
