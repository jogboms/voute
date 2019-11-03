import 'package:injector/injector.dart';
import 'package:voute/utils/wrappers/mk_http.dart';

abstract class BaseService {
  MkHttp get http => Injector.appInstance.getDependency<MkHttp>();
}
