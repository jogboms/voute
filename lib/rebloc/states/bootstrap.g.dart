// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bootstrap.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const BootstrapStatus _$loading = const BootstrapStatus._('loading');
const BootstrapStatus _$success = const BootstrapStatus._('success');
const BootstrapStatus _$failure = const BootstrapStatus._('failure');

BootstrapStatus _$valueOf(String name) {
  switch (name) {
    case 'loading':
      return _$loading;
    case 'success':
      return _$success;
    case 'failure':
      return _$failure;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<BootstrapStatus> _$values =
    new BuiltSet<BootstrapStatus>(const <BootstrapStatus>[
  _$loading,
  _$success,
  _$failure,
]);

Serializer<BootstrapState> _$bootstrapStateSerializer =
    new _$BootstrapStateSerializer();

class _$BootstrapStateSerializer
    implements StructuredSerializer<BootstrapState> {
  @override
  final Iterable<Type> types = const [BootstrapState, _$BootstrapState];
  @override
  final String wireName = 'BootstrapState';

  @override
  Iterable serialize(Serializers serializers, BootstrapState object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'status',
      serializers.serialize(object.status,
          specifiedType: const FullType(BootstrapStatus)),
      'message',
      serializers.serialize(object.message,
          specifiedType: const FullType(String)),
    ];
    if (object.config != null) {
      result
        ..add('config')
        ..add(serializers.serialize(object.config,
            specifiedType: const FullType(ConfigModel)));
    }
    if (object.error != null) {
      result
        ..add('error')
        ..add(serializers.serialize(object.error,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  BootstrapState deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new BootstrapStateBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'config':
          result.config.replace(serializers.deserialize(value,
              specifiedType: const FullType(ConfigModel)) as ConfigModel);
          break;
        case 'status':
          result.status = serializers.deserialize(value,
                  specifiedType: const FullType(BootstrapStatus))
              as BootstrapStatus;
          break;
        case 'message':
          result.message = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'error':
          result.error = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$BootstrapState extends BootstrapState {
  @override
  final ConfigModel config;
  @override
  final BootstrapStatus status;
  @override
  final String message;
  @override
  final String error;

  factory _$BootstrapState([void Function(BootstrapStateBuilder) updates]) =>
      (new BootstrapStateBuilder()..update(updates)).build();

  _$BootstrapState._({this.config, this.status, this.message, this.error})
      : super._() {
    if (status == null) {
      throw new BuiltValueNullFieldError('BootstrapState', 'status');
    }
    if (message == null) {
      throw new BuiltValueNullFieldError('BootstrapState', 'message');
    }
  }

  @override
  BootstrapState rebuild(void Function(BootstrapStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BootstrapStateBuilder toBuilder() =>
      new BootstrapStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BootstrapState &&
        config == other.config &&
        status == other.status &&
        message == other.message &&
        error == other.error;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, config.hashCode), status.hashCode), message.hashCode),
        error.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('BootstrapState')
          ..add('config', config)
          ..add('status', status)
          ..add('message', message)
          ..add('error', error))
        .toString();
  }
}

class BootstrapStateBuilder
    implements Builder<BootstrapState, BootstrapStateBuilder> {
  _$BootstrapState _$v;

  ConfigModelBuilder _config;
  ConfigModelBuilder get config => _$this._config ??= new ConfigModelBuilder();
  set config(ConfigModelBuilder config) => _$this._config = config;

  BootstrapStatus _status;
  BootstrapStatus get status => _$this._status;
  set status(BootstrapStatus status) => _$this._status = status;

  String _message;
  String get message => _$this._message;
  set message(String message) => _$this._message = message;

  String _error;
  String get error => _$this._error;
  set error(String error) => _$this._error = error;

  BootstrapStateBuilder();

  BootstrapStateBuilder get _$this {
    if (_$v != null) {
      _config = _$v.config?.toBuilder();
      _status = _$v.status;
      _message = _$v.message;
      _error = _$v.error;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(BootstrapState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$BootstrapState;
  }

  @override
  void update(void Function(BootstrapStateBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$BootstrapState build() {
    _$BootstrapState _$result;
    try {
      _$result = _$v ??
          new _$BootstrapState._(
              config: _config?.build(),
              status: status,
              message: message,
              error: error);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'config';
        _config?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'BootstrapState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
