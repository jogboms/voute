import 'dart:async';

import 'package:http/http.dart' show Response;
import 'package:voute/utils/mk_response_wrapper.dart';

abstract class StringResponse {
  Future<String> fromStringResponse(Response response) async {
    final res = MkResponseWrapper<dynamic>(response);
    return res?.message;
  }
}
