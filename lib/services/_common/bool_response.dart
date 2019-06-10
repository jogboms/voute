import 'dart:async';

import 'package:http/http.dart' show Response;
import 'package:voute/utils/mk_response_wrapper.dart';

abstract class BoolResponse {
  Future<bool> fromBoolResponse(Response response) async {
    final res = MkResponseWrapper<dynamic>(response);
    return res?.isOk ?? false;
  }
}
