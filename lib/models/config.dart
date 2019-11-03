import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:voute/models/main.dart';
import 'package:voute/models/serializers.dart';

part 'config.g.dart';

abstract class ConfigModel with ModelInterface implements Built<ConfigModel, ConfigModelBuilder> {
  factory ConfigModel([
    void updates(ConfigModelBuilder b),
  ]) = _$ConfigModel;

  ConfigModel._();

  @override
  Map<String, dynamic> toMap() => serializers.serializeWith(ConfigModel.serializer, this);

  static ConfigModel fromJson(Map<String, dynamic> map) => serializers.deserializeWith(ConfigModel.serializer, map);

  static Serializer<ConfigModel> get serializer => _$configModelSerializer;
}
