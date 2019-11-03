import 'dart:async';

import 'package:voute/models/config.dart';
import 'package:voute/services/config.dart';
import 'package:voute/utils/mk_http.dart';
import 'package:voute/utils/mk_response_wrapper.dart';

class ConfigImpl extends Config {
  @override
  Future<ConfigModel> fetch() async {
    final response = await MkHttp.get('/settings');
    return MkResponseWrapper<ConfigModel>(response, onTransform: ConfigModel.fromJson).data;
  }
}
