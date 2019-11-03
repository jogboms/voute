import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:voute/models/config.dart';

part 'bootstrap.g.dart';

abstract class BootstrapState implements Built<BootstrapState, BootstrapStateBuilder> {
  factory BootstrapState([
    void updates(BootstrapStateBuilder b),
  ]) = _$BootstrapState;

  factory BootstrapState.initialState() => _$BootstrapState(
        (BootstrapStateBuilder b) => b
          ..config = null
          ..status = BootstrapStatus.loading
          ..message = ""
          ..error = null,
      );

  BootstrapState._();

  @nullable
  ConfigModel get config;
  BootstrapStatus get status;
  String get message;
  @nullable
  String get error;

  static Serializer<BootstrapState> get serializer => _$bootstrapStateSerializer;
}

class BootstrapStatus extends EnumClass {
  const BootstrapStatus._(String name) : super(name);

  static const BootstrapStatus loading = _$loading;
  static const BootstrapStatus success = _$success;
  static const BootstrapStatus failure = _$failure;

  static BuiltSet<BootstrapStatus> get values => _$values;
  static BootstrapStatus valueOf(String name) => _$valueOf(name);
}
