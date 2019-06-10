import 'dart:async';

import 'package:voute/models/config.dart';
import 'package:voute/services/config.dart';
import 'package:voute/utils/mk_http.dart';
import 'package:voute/utils/mk_response_wrapper.dart';

class ConfigImpl extends Config {
  @override
  Future<ConfigModel> fetch() async {
    final response = await MkHttp.get('/settings');
    final res = MkResponseWrapper<dynamic>(response);
    return ConfigModel.fromJson(res.rawData);
  }
}
