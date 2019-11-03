import 'dart:async' show Future, TimeoutException;
import 'dart:convert' show json;
import 'dart:io' show HttpHeaders, SocketException;

import 'package:http/http.dart' show Response;
import 'package:http_logger/http_logger.dart';
import 'package:http_middleware/http_middleware.dart';
import 'package:voute/utils/mk_exceptions.dart';
import 'package:voute/utils/mk_settings.dart';

class MkHttp {
  static String get _url => MkSettings.api;

  static Map<String, String> get mkHttpHeaders => <String, String>{
        HttpHeaders.contentTypeHeader: _CONTENT_TYPE,
      };

  static Future<Response> get(String url) {
    try {
      return _http.get("$_url$url", headers: mkHttpHeaders);
    } on SocketException {
      throw NoInternetException();
    } on TimeoutException {
      throw TimeOutException();
    }
  }

  static Future<Response> post(String url, Map<String, dynamic> data) {
    try {
      return _http.post("$_url$url", headers: mkHttpHeaders, body: json.encode(data));
    } on SocketException {
      throw NoInternetException();
    } on TimeoutException {
      throw TimeOutException();
    }
  }

  static Future<Response> patch(String url, Map<String, dynamic> data) {
    try {
      return _http.patch("$_url$url", headers: mkHttpHeaders, body: json.encode(data));
    } on SocketException {
      throw NoInternetException();
    } on TimeoutException {
      throw TimeOutException();
    }
  }

  static Future<Response> delete(String url) {
    try {
      return _http.delete("$_url$url", headers: mkHttpHeaders);
    } on SocketException {
      throw NoInternetException();
    } on TimeoutException {
      throw TimeOutException();
    }
  }

  static Future<Response> put(String url, Map<String, dynamic> data) {
    try {
      return _http.put("$_url$url", headers: mkHttpHeaders, body: json.encode(data));
    } on SocketException {
      throw NoInternetException();
    } on TimeoutException {
      throw TimeOutException();
    }
  }
}

HttpWithMiddleware _http = HttpWithMiddleware.build(
  requestTimeout: Duration(seconds: MkSettings.isDev ? 30 : 45),
  middlewares: [HttpLogger(logLevel: LogLevel.BODY)],
);

const String _CONTENT_TYPE = "application/json";
