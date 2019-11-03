// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<AppState> _$appStateSerializer = new _$AppStateSerializer();

class _$AppStateSerializer implements StructuredSerializer<AppState> {
  @override
  final Iterable<Type> types = const [AppState, _$AppState];
  @override
  final String wireName = 'AppState';

  @override
  Iterable serialize(Serializers serializers, AppState object, {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'user',
      serializers.serialize(object.user, specifiedType: const FullType(UserState)),
      'bootstrap',
      serializers.serialize(object.bootstrap, specifiedType: const FullType(BootstrapState)),
    ];

    return result;
  }

  @override
  AppState deserialize(Serializers serializers, Iterable serialized, {FullType specifiedType = FullType.unspecified}) {
    final result = new AppStateBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'user':
          result.user.replace(serializers.deserialize(value, specifiedType: const FullType(UserState)) as UserState);
          break;
        case 'bootstrap':
          result.bootstrap
              .replace(serializers.deserialize(value, specifiedType: const FullType(BootstrapState)) as BootstrapState);
          break;
      }
    }

    return result.build();
  }
}

class _$AppState extends AppState {
  @override
  final UserState user;
  @override
  final BootstrapState bootstrap;

  factory _$AppState([void Function(AppStateBuilder) updates]) => (new AppStateBuilder()..update(updates)).build();

  _$AppState._({this.user, this.bootstrap}) : super._() {
    if (user == null) {
      throw new BuiltValueNullFieldError('AppState', 'user');
    }
    if (bootstrap == null) {
      throw new BuiltValueNullFieldError('AppState', 'bootstrap');
    }
  }

  @override
  AppState rebuild(void Function(AppStateBuilder) updates) => (toBuilder()..update(updates)).build();

  @override
  AppStateBuilder toBuilder() => new AppStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AppState && user == other.user && bootstrap == other.bootstrap;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, user.hashCode), bootstrap.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AppState')..add('user', user)..add('bootstrap', bootstrap)).toString();
  }
}

class AppStateBuilder implements Builder<AppState, AppStateBuilder> {
  _$AppState _$v;

  UserStateBuilder _user;
  UserStateBuilder get user => _$this._user ??= new UserStateBuilder();
  set user(UserStateBuilder user) => _$this._user = user;

  BootstrapStateBuilder _bootstrap;
  BootstrapStateBuilder get bootstrap => _$this._bootstrap ??= new BootstrapStateBuilder();
  set bootstrap(BootstrapStateBuilder bootstrap) => _$this._bootstrap = bootstrap;

  AppStateBuilder();

  AppStateBuilder get _$this {
    if (_$v != null) {
      _user = _$v.user?.toBuilder();
      _bootstrap = _$v.bootstrap?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AppState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$AppState;
  }

  @override
  void update(void Function(AppStateBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$AppState build() {
    _$AppState _$result;
    try {
      _$result = _$v ?? new _$AppState._(user: user.build(), bootstrap: bootstrap.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'user';
        user.build();
        _$failedField = 'bootstrap';
        bootstrap.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError('AppState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
