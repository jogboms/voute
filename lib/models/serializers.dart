// ignore: unused_import
import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:voute/models/config.dart';
import 'package:voute/models/user/user.dart';

part 'serializers.g.dart';

@SerializersFor(const [
  ConfigModel,
  UserModel,
])
final Serializers serializers = (_$serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
