// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'config.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ConfigModel> _$configModelSerializer = new _$ConfigModelSerializer();

class _$ConfigModelSerializer implements StructuredSerializer<ConfigModel> {
  @override
  final Iterable<Type> types = const [ConfigModel, _$ConfigModel];
  @override
  final String wireName = 'ConfigModel';

  @override
  Iterable serialize(Serializers serializers, ConfigModel object,
      {FullType specifiedType = FullType.unspecified}) {
    return <Object>[];
  }

  @override
  ConfigModel deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    return new ConfigModelBuilder().build();
  }
}

class _$ConfigModel extends ConfigModel {
  factory _$ConfigModel([void Function(ConfigModelBuilder) updates]) =>
      (new ConfigModelBuilder()..update(updates)).build();

  _$ConfigModel._() : super._();

  @override
  ConfigModel rebuild(void Function(ConfigModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ConfigModelBuilder toBuilder() => new ConfigModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ConfigModel;
  }

  @override
  int get hashCode {
    return 195922845;
  }
}

class ConfigModelBuilder implements Builder<ConfigModel, ConfigModelBuilder> {
  _$ConfigModel _$v;

  ConfigModelBuilder();

  @override
  void replace(ConfigModel other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ConfigModel;
  }

  @override
  void update(void Function(ConfigModelBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ConfigModel build() {
    final _$result = _$v ?? new _$ConfigModel._();
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
