// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vpn_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$VpnEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() connect,
    required TResult Function() disconnect,
    required TResult Function() refresh,
    required TResult Function() loadConnectionHistory,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? connect,
    TResult? Function()? disconnect,
    TResult? Function()? refresh,
    TResult? Function()? loadConnectionHistory,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? connect,
    TResult Function()? disconnect,
    TResult Function()? refresh,
    TResult Function()? loadConnectionHistory,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Connect value) connect,
    required TResult Function(_Disconnect value) disconnect,
    required TResult Function(_Refresh value) refresh,
    required TResult Function(_LoadHistory value) loadConnectionHistory,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Connect value)? connect,
    TResult? Function(_Disconnect value)? disconnect,
    TResult? Function(_Refresh value)? refresh,
    TResult? Function(_LoadHistory value)? loadConnectionHistory,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Connect value)? connect,
    TResult Function(_Disconnect value)? disconnect,
    TResult Function(_Refresh value)? refresh,
    TResult Function(_LoadHistory value)? loadConnectionHistory,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VpnEventCopyWith<$Res> {
  factory $VpnEventCopyWith(VpnEvent value, $Res Function(VpnEvent) then) =
      _$VpnEventCopyWithImpl<$Res, VpnEvent>;
}

/// @nodoc
class _$VpnEventCopyWithImpl<$Res, $Val extends VpnEvent>
    implements $VpnEventCopyWith<$Res> {
  _$VpnEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VpnEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$ConnectImplCopyWith<$Res> {
  factory _$$ConnectImplCopyWith(
          _$ConnectImpl value, $Res Function(_$ConnectImpl) then) =
      __$$ConnectImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ConnectImplCopyWithImpl<$Res>
    extends _$VpnEventCopyWithImpl<$Res, _$ConnectImpl>
    implements _$$ConnectImplCopyWith<$Res> {
  __$$ConnectImplCopyWithImpl(
      _$ConnectImpl _value, $Res Function(_$ConnectImpl) _then)
      : super(_value, _then);

  /// Create a copy of VpnEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ConnectImpl extends _Connect {
  const _$ConnectImpl() : super._();

  @override
  String toString() {
    return 'VpnEvent.connect()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ConnectImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() connect,
    required TResult Function() disconnect,
    required TResult Function() refresh,
    required TResult Function() loadConnectionHistory,
  }) {
    return connect();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? connect,
    TResult? Function()? disconnect,
    TResult? Function()? refresh,
    TResult? Function()? loadConnectionHistory,
  }) {
    return connect?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? connect,
    TResult Function()? disconnect,
    TResult Function()? refresh,
    TResult Function()? loadConnectionHistory,
    required TResult orElse(),
  }) {
    if (connect != null) {
      return connect();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Connect value) connect,
    required TResult Function(_Disconnect value) disconnect,
    required TResult Function(_Refresh value) refresh,
    required TResult Function(_LoadHistory value) loadConnectionHistory,
  }) {
    return connect(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Connect value)? connect,
    TResult? Function(_Disconnect value)? disconnect,
    TResult? Function(_Refresh value)? refresh,
    TResult? Function(_LoadHistory value)? loadConnectionHistory,
  }) {
    return connect?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Connect value)? connect,
    TResult Function(_Disconnect value)? disconnect,
    TResult Function(_Refresh value)? refresh,
    TResult Function(_LoadHistory value)? loadConnectionHistory,
    required TResult orElse(),
  }) {
    if (connect != null) {
      return connect(this);
    }
    return orElse();
  }
}

abstract class _Connect extends VpnEvent {
  const factory _Connect() = _$ConnectImpl;
  const _Connect._() : super._();
}

/// @nodoc
abstract class _$$DisconnectImplCopyWith<$Res> {
  factory _$$DisconnectImplCopyWith(
          _$DisconnectImpl value, $Res Function(_$DisconnectImpl) then) =
      __$$DisconnectImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DisconnectImplCopyWithImpl<$Res>
    extends _$VpnEventCopyWithImpl<$Res, _$DisconnectImpl>
    implements _$$DisconnectImplCopyWith<$Res> {
  __$$DisconnectImplCopyWithImpl(
      _$DisconnectImpl _value, $Res Function(_$DisconnectImpl) _then)
      : super(_value, _then);

  /// Create a copy of VpnEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$DisconnectImpl extends _Disconnect {
  const _$DisconnectImpl() : super._();

  @override
  String toString() {
    return 'VpnEvent.disconnect()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$DisconnectImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() connect,
    required TResult Function() disconnect,
    required TResult Function() refresh,
    required TResult Function() loadConnectionHistory,
  }) {
    return disconnect();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? connect,
    TResult? Function()? disconnect,
    TResult? Function()? refresh,
    TResult? Function()? loadConnectionHistory,
  }) {
    return disconnect?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? connect,
    TResult Function()? disconnect,
    TResult Function()? refresh,
    TResult Function()? loadConnectionHistory,
    required TResult orElse(),
  }) {
    if (disconnect != null) {
      return disconnect();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Connect value) connect,
    required TResult Function(_Disconnect value) disconnect,
    required TResult Function(_Refresh value) refresh,
    required TResult Function(_LoadHistory value) loadConnectionHistory,
  }) {
    return disconnect(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Connect value)? connect,
    TResult? Function(_Disconnect value)? disconnect,
    TResult? Function(_Refresh value)? refresh,
    TResult? Function(_LoadHistory value)? loadConnectionHistory,
  }) {
    return disconnect?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Connect value)? connect,
    TResult Function(_Disconnect value)? disconnect,
    TResult Function(_Refresh value)? refresh,
    TResult Function(_LoadHistory value)? loadConnectionHistory,
    required TResult orElse(),
  }) {
    if (disconnect != null) {
      return disconnect(this);
    }
    return orElse();
  }
}

abstract class _Disconnect extends VpnEvent {
  const factory _Disconnect() = _$DisconnectImpl;
  const _Disconnect._() : super._();
}

/// @nodoc
abstract class _$$RefreshImplCopyWith<$Res> {
  factory _$$RefreshImplCopyWith(
          _$RefreshImpl value, $Res Function(_$RefreshImpl) then) =
      __$$RefreshImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RefreshImplCopyWithImpl<$Res>
    extends _$VpnEventCopyWithImpl<$Res, _$RefreshImpl>
    implements _$$RefreshImplCopyWith<$Res> {
  __$$RefreshImplCopyWithImpl(
      _$RefreshImpl _value, $Res Function(_$RefreshImpl) _then)
      : super(_value, _then);

  /// Create a copy of VpnEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$RefreshImpl extends _Refresh {
  const _$RefreshImpl() : super._();

  @override
  String toString() {
    return 'VpnEvent.refresh()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$RefreshImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() connect,
    required TResult Function() disconnect,
    required TResult Function() refresh,
    required TResult Function() loadConnectionHistory,
  }) {
    return refresh();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? connect,
    TResult? Function()? disconnect,
    TResult? Function()? refresh,
    TResult? Function()? loadConnectionHistory,
  }) {
    return refresh?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? connect,
    TResult Function()? disconnect,
    TResult Function()? refresh,
    TResult Function()? loadConnectionHistory,
    required TResult orElse(),
  }) {
    if (refresh != null) {
      return refresh();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Connect value) connect,
    required TResult Function(_Disconnect value) disconnect,
    required TResult Function(_Refresh value) refresh,
    required TResult Function(_LoadHistory value) loadConnectionHistory,
  }) {
    return refresh(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Connect value)? connect,
    TResult? Function(_Disconnect value)? disconnect,
    TResult? Function(_Refresh value)? refresh,
    TResult? Function(_LoadHistory value)? loadConnectionHistory,
  }) {
    return refresh?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Connect value)? connect,
    TResult Function(_Disconnect value)? disconnect,
    TResult Function(_Refresh value)? refresh,
    TResult Function(_LoadHistory value)? loadConnectionHistory,
    required TResult orElse(),
  }) {
    if (refresh != null) {
      return refresh(this);
    }
    return orElse();
  }
}

abstract class _Refresh extends VpnEvent {
  const factory _Refresh() = _$RefreshImpl;
  const _Refresh._() : super._();
}

/// @nodoc
abstract class _$$LoadHistoryImplCopyWith<$Res> {
  factory _$$LoadHistoryImplCopyWith(
          _$LoadHistoryImpl value, $Res Function(_$LoadHistoryImpl) then) =
      __$$LoadHistoryImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadHistoryImplCopyWithImpl<$Res>
    extends _$VpnEventCopyWithImpl<$Res, _$LoadHistoryImpl>
    implements _$$LoadHistoryImplCopyWith<$Res> {
  __$$LoadHistoryImplCopyWithImpl(
      _$LoadHistoryImpl _value, $Res Function(_$LoadHistoryImpl) _then)
      : super(_value, _then);

  /// Create a copy of VpnEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadHistoryImpl extends _LoadHistory {
  const _$LoadHistoryImpl() : super._();

  @override
  String toString() {
    return 'VpnEvent.loadConnectionHistory()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadHistoryImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() connect,
    required TResult Function() disconnect,
    required TResult Function() refresh,
    required TResult Function() loadConnectionHistory,
  }) {
    return loadConnectionHistory();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? connect,
    TResult? Function()? disconnect,
    TResult? Function()? refresh,
    TResult? Function()? loadConnectionHistory,
  }) {
    return loadConnectionHistory?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? connect,
    TResult Function()? disconnect,
    TResult Function()? refresh,
    TResult Function()? loadConnectionHistory,
    required TResult orElse(),
  }) {
    if (loadConnectionHistory != null) {
      return loadConnectionHistory();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Connect value) connect,
    required TResult Function(_Disconnect value) disconnect,
    required TResult Function(_Refresh value) refresh,
    required TResult Function(_LoadHistory value) loadConnectionHistory,
  }) {
    return loadConnectionHistory(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Connect value)? connect,
    TResult? Function(_Disconnect value)? disconnect,
    TResult? Function(_Refresh value)? refresh,
    TResult? Function(_LoadHistory value)? loadConnectionHistory,
  }) {
    return loadConnectionHistory?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Connect value)? connect,
    TResult Function(_Disconnect value)? disconnect,
    TResult Function(_Refresh value)? refresh,
    TResult Function(_LoadHistory value)? loadConnectionHistory,
    required TResult orElse(),
  }) {
    if (loadConnectionHistory != null) {
      return loadConnectionHistory(this);
    }
    return orElse();
  }
}

abstract class _LoadHistory extends VpnEvent {
  const factory _LoadHistory() = _$LoadHistoryImpl;
  const _LoadHistory._() : super._();
}

/// @nodoc
mixin _$VpnState {
  ConnectionStatus get status => throw _privateConstructorUsedError;
  VpnConnection? get currentConnection => throw _privateConstructorUsedError;
  List<VpnConnection>? get connectionHistory =>
      throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            ConnectionStatus status,
            VpnConnection? currentConnection,
            List<VpnConnection>? connectionHistory,
            String? errorMessage)
        valueObject,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ConnectionStatus status, VpnConnection? currentConnection,
            List<VpnConnection>? connectionHistory, String? errorMessage)?
        valueObject,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ConnectionStatus status, VpnConnection? currentConnection,
            List<VpnConnection>? connectionHistory, String? errorMessage)?
        valueObject,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_State value) valueObject,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_State value)? valueObject,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_State value)? valueObject,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of VpnState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VpnStateCopyWith<VpnState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VpnStateCopyWith<$Res> {
  factory $VpnStateCopyWith(VpnState value, $Res Function(VpnState) then) =
      _$VpnStateCopyWithImpl<$Res, VpnState>;
  @useResult
  $Res call(
      {ConnectionStatus status,
      VpnConnection? currentConnection,
      List<VpnConnection>? connectionHistory,
      String? errorMessage});
}

/// @nodoc
class _$VpnStateCopyWithImpl<$Res, $Val extends VpnState>
    implements $VpnStateCopyWith<$Res> {
  _$VpnStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VpnState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? currentConnection = freezed,
    Object? connectionHistory = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ConnectionStatus,
      currentConnection: freezed == currentConnection
          ? _value.currentConnection
          : currentConnection // ignore: cast_nullable_to_non_nullable
              as VpnConnection?,
      connectionHistory: freezed == connectionHistory
          ? _value.connectionHistory
          : connectionHistory // ignore: cast_nullable_to_non_nullable
              as List<VpnConnection>?,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StateImplCopyWith<$Res> implements $VpnStateCopyWith<$Res> {
  factory _$$StateImplCopyWith(
          _$StateImpl value, $Res Function(_$StateImpl) then) =
      __$$StateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ConnectionStatus status,
      VpnConnection? currentConnection,
      List<VpnConnection>? connectionHistory,
      String? errorMessage});
}

/// @nodoc
class __$$StateImplCopyWithImpl<$Res>
    extends _$VpnStateCopyWithImpl<$Res, _$StateImpl>
    implements _$$StateImplCopyWith<$Res> {
  __$$StateImplCopyWithImpl(
      _$StateImpl _value, $Res Function(_$StateImpl) _then)
      : super(_value, _then);

  /// Create a copy of VpnState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? currentConnection = freezed,
    Object? connectionHistory = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(_$StateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ConnectionStatus,
      currentConnection: freezed == currentConnection
          ? _value.currentConnection
          : currentConnection // ignore: cast_nullable_to_non_nullable
              as VpnConnection?,
      connectionHistory: freezed == connectionHistory
          ? _value._connectionHistory
          : connectionHistory // ignore: cast_nullable_to_non_nullable
              as List<VpnConnection>?,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$StateImpl extends _State {
  const _$StateImpl(
      {this.status = ConnectionStatus.disconnected,
      this.currentConnection,
      final List<VpnConnection>? connectionHistory,
      this.errorMessage})
      : _connectionHistory = connectionHistory,
        super._();

  @override
  @JsonKey()
  final ConnectionStatus status;
  @override
  final VpnConnection? currentConnection;
  final List<VpnConnection>? _connectionHistory;
  @override
  List<VpnConnection>? get connectionHistory {
    final value = _connectionHistory;
    if (value == null) return null;
    if (_connectionHistory is EqualUnmodifiableListView)
      return _connectionHistory;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'VpnState.valueObject(status: $status, currentConnection: $currentConnection, connectionHistory: $connectionHistory, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.currentConnection, currentConnection) ||
                other.currentConnection == currentConnection) &&
            const DeepCollectionEquality()
                .equals(other._connectionHistory, _connectionHistory) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, currentConnection,
      const DeepCollectionEquality().hash(_connectionHistory), errorMessage);

  /// Create a copy of VpnState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StateImplCopyWith<_$StateImpl> get copyWith =>
      __$$StateImplCopyWithImpl<_$StateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            ConnectionStatus status,
            VpnConnection? currentConnection,
            List<VpnConnection>? connectionHistory,
            String? errorMessage)
        valueObject,
  }) {
    return valueObject(
        status, currentConnection, connectionHistory, errorMessage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ConnectionStatus status, VpnConnection? currentConnection,
            List<VpnConnection>? connectionHistory, String? errorMessage)?
        valueObject,
  }) {
    return valueObject?.call(
        status, currentConnection, connectionHistory, errorMessage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ConnectionStatus status, VpnConnection? currentConnection,
            List<VpnConnection>? connectionHistory, String? errorMessage)?
        valueObject,
    required TResult orElse(),
  }) {
    if (valueObject != null) {
      return valueObject(
          status, currentConnection, connectionHistory, errorMessage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_State value) valueObject,
  }) {
    return valueObject(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_State value)? valueObject,
  }) {
    return valueObject?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_State value)? valueObject,
    required TResult orElse(),
  }) {
    if (valueObject != null) {
      return valueObject(this);
    }
    return orElse();
  }
}

abstract class _State extends VpnState {
  const factory _State(
      {final ConnectionStatus status,
      final VpnConnection? currentConnection,
      final List<VpnConnection>? connectionHistory,
      final String? errorMessage}) = _$StateImpl;
  const _State._() : super._();

  @override
  ConnectionStatus get status;
  @override
  VpnConnection? get currentConnection;
  @override
  List<VpnConnection>? get connectionHistory;
  @override
  String? get errorMessage;

  /// Create a copy of VpnState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StateImplCopyWith<_$StateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
