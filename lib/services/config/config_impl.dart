import 'dart:async';

import 'package:voute/models/config.dart';
import 'package:voute/services/config/config.dart';
import 'package:voute/utils/wrappers/mk_response.dart';

class ConfigImpl extends Config {
  @override
  Future<ConfigModel> fetch() async {
    final response = await http.get('/settings');
    return MkResponse<ConfigModel>(response, onTransform: ConfigModel.fromJson).data;
  }
}
