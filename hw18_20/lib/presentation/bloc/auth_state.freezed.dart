// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$AuthState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(firebase_auth.User user, String? localAvatarPath)
    authenticated,
    required TResult Function() unauthenticated,
    required TResult Function(AuthFailure failure) failure,
    required TResult Function() passwordResetSuccess,
    required TResult Function() passwordChangedSuccess,
    required TResult Function() avatarUpdatedSuccess,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(firebase_auth.User user, String? localAvatarPath)?
    authenticated,
    TResult? Function()? unauthenticated,
    TResult? Function(AuthFailure failure)? failure,
    TResult? Function()? passwordResetSuccess,
    TResult? Function()? passwordChangedSuccess,
    TResult? Function()? avatarUpdatedSuccess,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(firebase_auth.User user, String? localAvatarPath)?
    authenticated,
    TResult Function()? unauthenticated,
    TResult Function(AuthFailure failure)? failure,
    TResult Function()? passwordResetSuccess,
    TResult Function()? passwordChangedSuccess,
    TResult Function()? avatarUpdatedSuccess,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthInitial value) initial,
    required TResult Function(AuthLoading value) loading,
    required TResult Function(Authenticated value) authenticated,
    required TResult Function(Unauthenticated value) unauthenticated,
    required TResult Function(AuthFailureState value) failure,
    required TResult Function(PasswordResetSuccess value) passwordResetSuccess,
    required TResult Function(PasswordChangedSuccess value)
    passwordChangedSuccess,
    required TResult Function(AvatarUpdatedSuccess value) avatarUpdatedSuccess,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthInitial value)? initial,
    TResult? Function(AuthLoading value)? loading,
    TResult? Function(Authenticated value)? authenticated,
    TResult? Function(Unauthenticated value)? unauthenticated,
    TResult? Function(AuthFailureState value)? failure,
    TResult? Function(PasswordResetSuccess value)? passwordResetSuccess,
    TResult? Function(PasswordChangedSuccess value)? passwordChangedSuccess,
    TResult? Function(AvatarUpdatedSuccess value)? avatarUpdatedSuccess,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthInitial value)? initial,
    TResult Function(AuthLoading value)? loading,
    TResult Function(Authenticated value)? authenticated,
    TResult Function(Unauthenticated value)? unauthenticated,
    TResult Function(AuthFailureState value)? failure,
    TResult Function(PasswordResetSuccess value)? passwordResetSuccess,
    TResult Function(PasswordChangedSuccess value)? passwordChangedSuccess,
    TResult Function(AvatarUpdatedSuccess value)? avatarUpdatedSuccess,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) then) =
      _$AuthStateCopyWithImpl<$Res, AuthState>;
}

/// @nodoc
class _$AuthStateCopyWithImpl<$Res, $Val extends AuthState>
    implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$AuthInitialImplCopyWith<$Res> {
  factory _$$AuthInitialImplCopyWith(
    _$AuthInitialImpl value,
    $Res Function(_$AuthInitialImpl) then,
  ) = __$$AuthInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AuthInitialImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthInitialImpl>
    implements _$$AuthInitialImplCopyWith<$Res> {
  __$$AuthInitialImplCopyWithImpl(
    _$AuthInitialImpl _value,
    $Res Function(_$AuthInitialImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$AuthInitialImpl extends AuthInitial {
  const _$AuthInitialImpl() : super._();

  @override
  String toString() {
    return 'AuthState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AuthInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(firebase_auth.User user, String? localAvatarPath)
    authenticated,
    required TResult Function() unauthenticated,
    required TResult Function(AuthFailure failure) failure,
    required TResult Function() passwordResetSuccess,
    required TResult Function() passwordChangedSuccess,
    required TResult Function() avatarUpdatedSuccess,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(firebase_auth.User user, String? localAvatarPath)?
    authenticated,
    TResult? Function()? unauthenticated,
    TResult? Function(AuthFailure failure)? failure,
    TResult? Function()? passwordResetSuccess,
    TResult? Function()? passwordChangedSuccess,
    TResult? Function()? avatarUpdatedSuccess,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(firebase_auth.User user, String? localAvatarPath)?
    authenticated,
    TResult Function()? unauthenticated,
    TResult Function(AuthFailure failure)? failure,
    TResult Function()? passwordResetSuccess,
    TResult Function()? passwordChangedSuccess,
    TResult Function()? avatarUpdatedSuccess,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthInitial value) initial,
    required TResult Function(AuthLoading value) loading,
    required TResult Function(Authenticated value) authenticated,
    required TResult Function(Unauthenticated value) unauthenticated,
    required TResult Function(AuthFailureState value) failure,
    required TResult Function(PasswordResetSuccess value) passwordResetSuccess,
    required TResult Function(PasswordChangedSuccess value)
    passwordChangedSuccess,
    required TResult Function(AvatarUpdatedSuccess value) avatarUpdatedSuccess,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthInitial value)? initial,
    TResult? Function(AuthLoading value)? loading,
    TResult? Function(Authenticated value)? authenticated,
    TResult? Function(Unauthenticated value)? unauthenticated,
    TResult? Function(AuthFailureState value)? failure,
    TResult? Function(PasswordResetSuccess value)? passwordResetSuccess,
    TResult? Function(PasswordChangedSuccess value)? passwordChangedSuccess,
    TResult? Function(AvatarUpdatedSuccess value)? avatarUpdatedSuccess,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthInitial value)? initial,
    TResult Function(AuthLoading value)? loading,
    TResult Function(Authenticated value)? authenticated,
    TResult Function(Unauthenticated value)? unauthenticated,
    TResult Function(AuthFailureState value)? failure,
    TResult Function(PasswordResetSuccess value)? passwordResetSuccess,
    TResult Function(PasswordChangedSuccess value)? passwordChangedSuccess,
    TResult Function(AvatarUpdatedSuccess value)? avatarUpdatedSuccess,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class AuthInitial extends AuthState {
  const factory AuthInitial() = _$AuthInitialImpl;
  const AuthInitial._() : super._();
}

/// @nodoc
abstract class _$$AuthLoadingImplCopyWith<$Res> {
  factory _$$AuthLoadingImplCopyWith(
    _$AuthLoadingImpl value,
    $Res Function(_$AuthLoadingImpl) then,
  ) = __$$AuthLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AuthLoadingImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthLoadingImpl>
    implements _$$AuthLoadingImplCopyWith<$Res> {
  __$$AuthLoadingImplCopyWithImpl(
    _$AuthLoadingImpl _value,
    $Res Function(_$AuthLoadingImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$AuthLoadingImpl extends AuthLoading {
  const _$AuthLoadingImpl() : super._();

  @override
  String toString() {
    return 'AuthState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AuthLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(firebase_auth.User user, String? localAvatarPath)
    authenticated,
    required TResult Function() unauthenticated,
    required TResult Function(AuthFailure failure) failure,
    required TResult Function() passwordResetSuccess,
    required TResult Function() passwordChangedSuccess,
    required TResult Function() avatarUpdatedSuccess,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(firebase_auth.User user, String? localAvatarPath)?
    authenticated,
    TResult? Function()? unauthenticated,
    TResult? Function(AuthFailure failure)? failure,
    TResult? Function()? passwordResetSuccess,
    TResult? Function()? passwordChangedSuccess,
    TResult? Function()? avatarUpdatedSuccess,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(firebase_auth.User user, String? localAvatarPath)?
    authenticated,
    TResult Function()? unauthenticated,
    TResult Function(AuthFailure failure)? failure,
    TResult Function()? passwordResetSuccess,
    TResult Function()? passwordChangedSuccess,
    TResult Function()? avatarUpdatedSuccess,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthInitial value) initial,
    required TResult Function(AuthLoading value) loading,
    required TResult Function(Authenticated value) authenticated,
    required TResult Function(Unauthenticated value) unauthenticated,
    required TResult Function(AuthFailureState value) failure,
    required TResult Function(PasswordResetSuccess value) passwordResetSuccess,
    required TResult Function(PasswordChangedSuccess value)
    passwordChangedSuccess,
    required TResult Function(AvatarUpdatedSuccess value) avatarUpdatedSuccess,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthInitial value)? initial,
    TResult? Function(AuthLoading value)? loading,
    TResult? Function(Authenticated value)? authenticated,
    TResult? Function(Unauthenticated value)? unauthenticated,
    TResult? Function(AuthFailureState value)? failure,
    TResult? Function(PasswordResetSuccess value)? passwordResetSuccess,
    TResult? Function(PasswordChangedSuccess value)? passwordChangedSuccess,
    TResult? Function(AvatarUpdatedSuccess value)? avatarUpdatedSuccess,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthInitial value)? initial,
    TResult Function(AuthLoading value)? loading,
    TResult Function(Authenticated value)? authenticated,
    TResult Function(Unauthenticated value)? unauthenticated,
    TResult Function(AuthFailureState value)? failure,
    TResult Function(PasswordResetSuccess value)? passwordResetSuccess,
    TResult Function(PasswordChangedSuccess value)? passwordChangedSuccess,
    TResult Function(AvatarUpdatedSuccess value)? avatarUpdatedSuccess,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class AuthLoading extends AuthState {
  const factory AuthLoading() = _$AuthLoadingImpl;
  const AuthLoading._() : super._();
}

/// @nodoc
abstract class _$$AuthenticatedImplCopyWith<$Res> {
  factory _$$AuthenticatedImplCopyWith(
    _$AuthenticatedImpl value,
    $Res Function(_$AuthenticatedImpl) then,
  ) = __$$AuthenticatedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({firebase_auth.User user, String? localAvatarPath});
}

/// @nodoc
class __$$AuthenticatedImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthenticatedImpl>
    implements _$$AuthenticatedImplCopyWith<$Res> {
  __$$AuthenticatedImplCopyWithImpl(
    _$AuthenticatedImpl _value,
    $Res Function(_$AuthenticatedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? user = null, Object? localAvatarPath = freezed}) {
    return _then(
      _$AuthenticatedImpl(
        null == user
            ? _value.user
            : user // ignore: cast_nullable_to_non_nullable
                  as firebase_auth.User,
        freezed == localAvatarPath
            ? _value.localAvatarPath
            : localAvatarPath // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$AuthenticatedImpl extends Authenticated {
  const _$AuthenticatedImpl(this.user, [this.localAvatarPath]) : super._();

  @override
  final firebase_auth.User user;
  @override
  final String? localAvatarPath;

  @override
  String toString() {
    return 'AuthState.authenticated(user: $user, localAvatarPath: $localAvatarPath)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthenticatedImpl &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.localAvatarPath, localAvatarPath) ||
                other.localAvatarPath == localAvatarPath));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user, localAvatarPath);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthenticatedImplCopyWith<_$AuthenticatedImpl> get copyWith =>
      __$$AuthenticatedImplCopyWithImpl<_$AuthenticatedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(firebase_auth.User user, String? localAvatarPath)
    authenticated,
    required TResult Function() unauthenticated,
    required TResult Function(AuthFailure failure) failure,
    required TResult Function() passwordResetSuccess,
    required TResult Function() passwordChangedSuccess,
    required TResult Function() avatarUpdatedSuccess,
  }) {
    return authenticated(user, localAvatarPath);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(firebase_auth.User user, String? localAvatarPath)?
    authenticated,
    TResult? Function()? unauthenticated,
    TResult? Function(AuthFailure failure)? failure,
    TResult? Function()? passwordResetSuccess,
    TResult? Function()? passwordChangedSuccess,
    TResult? Function()? avatarUpdatedSuccess,
  }) {
    return authenticated?.call(user, localAvatarPath);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(firebase_auth.User user, String? localAvatarPath)?
    authenticated,
    TResult Function()? unauthenticated,
    TResult Function(AuthFailure failure)? failure,
    TResult Function()? passwordResetSuccess,
    TResult Function()? passwordChangedSuccess,
    TResult Function()? avatarUpdatedSuccess,
    required TResult orElse(),
  }) {
    if (authenticated != null) {
      return authenticated(user, localAvatarPath);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthInitial value) initial,
    required TResult Function(AuthLoading value) loading,
    required TResult Function(Authenticated value) authenticated,
    required TResult Function(Unauthenticated value) unauthenticated,
    required TResult Function(AuthFailureState value) failure,
    required TResult Function(PasswordResetSuccess value) passwordResetSuccess,
    required TResult Function(PasswordChangedSuccess value)
    passwordChangedSuccess,
    required TResult Function(AvatarUpdatedSuccess value) avatarUpdatedSuccess,
  }) {
    return authenticated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthInitial value)? initial,
    TResult? Function(AuthLoading value)? loading,
    TResult? Function(Authenticated value)? authenticated,
    TResult? Function(Unauthenticated value)? unauthenticated,
    TResult? Function(AuthFailureState value)? failure,
    TResult? Function(PasswordResetSuccess value)? passwordResetSuccess,
    TResult? Function(PasswordChangedSuccess value)? passwordChangedSuccess,
    TResult? Function(AvatarUpdatedSuccess value)? avatarUpdatedSuccess,
  }) {
    return authenticated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthInitial value)? initial,
    TResult Function(AuthLoading value)? loading,
    TResult Function(Authenticated value)? authenticated,
    TResult Function(Unauthenticated value)? unauthenticated,
    TResult Function(AuthFailureState value)? failure,
    TResult Function(PasswordResetSuccess value)? passwordResetSuccess,
    TResult Function(PasswordChangedSuccess value)? passwordChangedSuccess,
    TResult Function(AvatarUpdatedSuccess value)? avatarUpdatedSuccess,
    required TResult orElse(),
  }) {
    if (authenticated != null) {
      return authenticated(this);
    }
    return orElse();
  }
}

abstract class Authenticated extends AuthState {
  const factory Authenticated(
    final firebase_auth.User user, [
    final String? localAvatarPath,
  ]) = _$AuthenticatedImpl;
  const Authenticated._() : super._();

  firebase_auth.User get user;
  String? get localAvatarPath;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AuthenticatedImplCopyWith<_$AuthenticatedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UnauthenticatedImplCopyWith<$Res> {
  factory _$$UnauthenticatedImplCopyWith(
    _$UnauthenticatedImpl value,
    $Res Function(_$UnauthenticatedImpl) then,
  ) = __$$UnauthenticatedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UnauthenticatedImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$UnauthenticatedImpl>
    implements _$$UnauthenticatedImplCopyWith<$Res> {
  __$$UnauthenticatedImplCopyWithImpl(
    _$UnauthenticatedImpl _value,
    $Res Function(_$UnauthenticatedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$UnauthenticatedImpl extends Unauthenticated {
  const _$UnauthenticatedImpl() : super._();

  @override
  String toString() {
    return 'AuthState.unauthenticated()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$UnauthenticatedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(firebase_auth.User user, String? localAvatarPath)
    authenticated,
    required TResult Function() unauthenticated,
    required TResult Function(AuthFailure failure) failure,
    required TResult Function() passwordResetSuccess,
    required TResult Function() passwordChangedSuccess,
    required TResult Function() avatarUpdatedSuccess,
  }) {
    return unauthenticated();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(firebase_auth.User user, String? localAvatarPath)?
    authenticated,
    TResult? Function()? unauthenticated,
    TResult? Function(AuthFailure failure)? failure,
    TResult? Function()? passwordResetSuccess,
    TResult? Function()? passwordChangedSuccess,
    TResult? Function()? avatarUpdatedSuccess,
  }) {
    return unauthenticated?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(firebase_auth.User user, String? localAvatarPath)?
    authenticated,
    TResult Function()? unauthenticated,
    TResult Function(AuthFailure failure)? failure,
    TResult Function()? passwordResetSuccess,
    TResult Function()? passwordChangedSuccess,
    TResult Function()? avatarUpdatedSuccess,
    required TResult orElse(),
  }) {
    if (unauthenticated != null) {
      return unauthenticated();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthInitial value) initial,
    required TResult Function(AuthLoading value) loading,
    required TResult Function(Authenticated value) authenticated,
    required TResult Function(Unauthenticated value) unauthenticated,
    required TResult Function(AuthFailureState value) failure,
    required TResult Function(PasswordResetSuccess value) passwordResetSuccess,
    required TResult Function(PasswordChangedSuccess value)
    passwordChangedSuccess,
    required TResult Function(AvatarUpdatedSuccess value) avatarUpdatedSuccess,
  }) {
    return unauthenticated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthInitial value)? initial,
    TResult? Function(AuthLoading value)? loading,
    TResult? Function(Authenticated value)? authenticated,
    TResult? Function(Unauthenticated value)? unauthenticated,
    TResult? Function(AuthFailureState value)? failure,
    TResult? Function(PasswordResetSuccess value)? passwordResetSuccess,
    TResult? Function(PasswordChangedSuccess value)? passwordChangedSuccess,
    TResult? Function(AvatarUpdatedSuccess value)? avatarUpdatedSuccess,
  }) {
    return unauthenticated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthInitial value)? initial,
    TResult Function(AuthLoading value)? loading,
    TResult Function(Authenticated value)? authenticated,
    TResult Function(Unauthenticated value)? unauthenticated,
    TResult Function(AuthFailureState value)? failure,
    TResult Function(PasswordResetSuccess value)? passwordResetSuccess,
    TResult Function(PasswordChangedSuccess value)? passwordChangedSuccess,
    TResult Function(AvatarUpdatedSuccess value)? avatarUpdatedSuccess,
    required TResult orElse(),
  }) {
    if (unauthenticated != null) {
      return unauthenticated(this);
    }
    return orElse();
  }
}

abstract class Unauthenticated extends AuthState {
  const factory Unauthenticated() = _$UnauthenticatedImpl;
  const Unauthenticated._() : super._();
}

/// @nodoc
abstract class _$$AuthFailureStateImplCopyWith<$Res> {
  factory _$$AuthFailureStateImplCopyWith(
    _$AuthFailureStateImpl value,
    $Res Function(_$AuthFailureStateImpl) then,
  ) = __$$AuthFailureStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({AuthFailure failure});
}

/// @nodoc
class __$$AuthFailureStateImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthFailureStateImpl>
    implements _$$AuthFailureStateImplCopyWith<$Res> {
  __$$AuthFailureStateImplCopyWithImpl(
    _$AuthFailureStateImpl _value,
    $Res Function(_$AuthFailureStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? failure = freezed}) {
    return _then(
      _$AuthFailureStateImpl(
        freezed == failure
            ? _value.failure
            : failure // ignore: cast_nullable_to_non_nullable
                  as AuthFailure,
      ),
    );
  }
}

/// @nodoc

class _$AuthFailureStateImpl extends AuthFailureState {
  const _$AuthFailureStateImpl(this.failure) : super._();

  @override
  final AuthFailure failure;

  @override
  String toString() {
    return 'AuthState.failure(failure: $failure)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthFailureStateImpl &&
            const DeepCollectionEquality().equals(other.failure, failure));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(failure));

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthFailureStateImplCopyWith<_$AuthFailureStateImpl> get copyWith =>
      __$$AuthFailureStateImplCopyWithImpl<_$AuthFailureStateImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(firebase_auth.User user, String? localAvatarPath)
    authenticated,
    required TResult Function() unauthenticated,
    required TResult Function(AuthFailure failure) failure,
    required TResult Function() passwordResetSuccess,
    required TResult Function() passwordChangedSuccess,
    required TResult Function() avatarUpdatedSuccess,
  }) {
    return failure(this.failure);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(firebase_auth.User user, String? localAvatarPath)?
    authenticated,
    TResult? Function()? unauthenticated,
    TResult? Function(AuthFailure failure)? failure,
    TResult? Function()? passwordResetSuccess,
    TResult? Function()? passwordChangedSuccess,
    TResult? Function()? avatarUpdatedSuccess,
  }) {
    return failure?.call(this.failure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(firebase_auth.User user, String? localAvatarPath)?
    authenticated,
    TResult Function()? unauthenticated,
    TResult Function(AuthFailure failure)? failure,
    TResult Function()? passwordResetSuccess,
    TResult Function()? passwordChangedSuccess,
    TResult Function()? avatarUpdatedSuccess,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this.failure);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthInitial value) initial,
    required TResult Function(AuthLoading value) loading,
    required TResult Function(Authenticated value) authenticated,
    required TResult Function(Unauthenticated value) unauthenticated,
    required TResult Function(AuthFailureState value) failure,
    required TResult Function(PasswordResetSuccess value) passwordResetSuccess,
    required TResult Function(PasswordChangedSuccess value)
    passwordChangedSuccess,
    required TResult Function(AvatarUpdatedSuccess value) avatarUpdatedSuccess,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthInitial value)? initial,
    TResult? Function(AuthLoading value)? loading,
    TResult? Function(Authenticated value)? authenticated,
    TResult? Function(Unauthenticated value)? unauthenticated,
    TResult? Function(AuthFailureState value)? failure,
    TResult? Function(PasswordResetSuccess value)? passwordResetSuccess,
    TResult? Function(PasswordChangedSuccess value)? passwordChangedSuccess,
    TResult? Function(AvatarUpdatedSuccess value)? avatarUpdatedSuccess,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthInitial value)? initial,
    TResult Function(AuthLoading value)? loading,
    TResult Function(Authenticated value)? authenticated,
    TResult Function(Unauthenticated value)? unauthenticated,
    TResult Function(AuthFailureState value)? failure,
    TResult Function(PasswordResetSuccess value)? passwordResetSuccess,
    TResult Function(PasswordChangedSuccess value)? passwordChangedSuccess,
    TResult Function(AvatarUpdatedSuccess value)? avatarUpdatedSuccess,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class AuthFailureState extends AuthState {
  const factory AuthFailureState(final AuthFailure failure) =
      _$AuthFailureStateImpl;
  const AuthFailureState._() : super._();

  AuthFailure get failure;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AuthFailureStateImplCopyWith<_$AuthFailureStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PasswordResetSuccessImplCopyWith<$Res> {
  factory _$$PasswordResetSuccessImplCopyWith(
    _$PasswordResetSuccessImpl value,
    $Res Function(_$PasswordResetSuccessImpl) then,
  ) = __$$PasswordResetSuccessImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PasswordResetSuccessImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$PasswordResetSuccessImpl>
    implements _$$PasswordResetSuccessImplCopyWith<$Res> {
  __$$PasswordResetSuccessImplCopyWithImpl(
    _$PasswordResetSuccessImpl _value,
    $Res Function(_$PasswordResetSuccessImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$PasswordResetSuccessImpl extends PasswordResetSuccess {
  const _$PasswordResetSuccessImpl() : super._();

  @override
  String toString() {
    return 'AuthState.passwordResetSuccess()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PasswordResetSuccessImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(firebase_auth.User user, String? localAvatarPath)
    authenticated,
    required TResult Function() unauthenticated,
    required TResult Function(AuthFailure failure) failure,
    required TResult Function() passwordResetSuccess,
    required TResult Function() passwordChangedSuccess,
    required TResult Function() avatarUpdatedSuccess,
  }) {
    return passwordResetSuccess();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(firebase_auth.User user, String? localAvatarPath)?
    authenticated,
    TResult? Function()? unauthenticated,
    TResult? Function(AuthFailure failure)? failure,
    TResult? Function()? passwordResetSuccess,
    TResult? Function()? passwordChangedSuccess,
    TResult? Function()? avatarUpdatedSuccess,
  }) {
    return passwordResetSuccess?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(firebase_auth.User user, String? localAvatarPath)?
    authenticated,
    TResult Function()? unauthenticated,
    TResult Function(AuthFailure failure)? failure,
    TResult Function()? passwordResetSuccess,
    TResult Function()? passwordChangedSuccess,
    TResult Function()? avatarUpdatedSuccess,
    required TResult orElse(),
  }) {
    if (passwordResetSuccess != null) {
      return passwordResetSuccess();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthInitial value) initial,
    required TResult Function(AuthLoading value) loading,
    required TResult Function(Authenticated value) authenticated,
    required TResult Function(Unauthenticated value) unauthenticated,
    required TResult Function(AuthFailureState value) failure,
    required TResult Function(PasswordResetSuccess value) passwordResetSuccess,
    required TResult Function(PasswordChangedSuccess value)
    passwordChangedSuccess,
    required TResult Function(AvatarUpdatedSuccess value) avatarUpdatedSuccess,
  }) {
    return passwordResetSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthInitial value)? initial,
    TResult? Function(AuthLoading value)? loading,
    TResult? Function(Authenticated value)? authenticated,
    TResult? Function(Unauthenticated value)? unauthenticated,
    TResult? Function(AuthFailureState value)? failure,
    TResult? Function(PasswordResetSuccess value)? passwordResetSuccess,
    TResult? Function(PasswordChangedSuccess value)? passwordChangedSuccess,
    TResult? Function(AvatarUpdatedSuccess value)? avatarUpdatedSuccess,
  }) {
    return passwordResetSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthInitial value)? initial,
    TResult Function(AuthLoading value)? loading,
    TResult Function(Authenticated value)? authenticated,
    TResult Function(Unauthenticated value)? unauthenticated,
    TResult Function(AuthFailureState value)? failure,
    TResult Function(PasswordResetSuccess value)? passwordResetSuccess,
    TResult Function(PasswordChangedSuccess value)? passwordChangedSuccess,
    TResult Function(AvatarUpdatedSuccess value)? avatarUpdatedSuccess,
    required TResult orElse(),
  }) {
    if (passwordResetSuccess != null) {
      return passwordResetSuccess(this);
    }
    return orElse();
  }
}

abstract class PasswordResetSuccess extends AuthState {
  const factory PasswordResetSuccess() = _$PasswordResetSuccessImpl;
  const PasswordResetSuccess._() : super._();
}

/// @nodoc
abstract class _$$PasswordChangedSuccessImplCopyWith<$Res> {
  factory _$$PasswordChangedSuccessImplCopyWith(
    _$PasswordChangedSuccessImpl value,
    $Res Function(_$PasswordChangedSuccessImpl) then,
  ) = __$$PasswordChangedSuccessImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PasswordChangedSuccessImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$PasswordChangedSuccessImpl>
    implements _$$PasswordChangedSuccessImplCopyWith<$Res> {
  __$$PasswordChangedSuccessImplCopyWithImpl(
    _$PasswordChangedSuccessImpl _value,
    $Res Function(_$PasswordChangedSuccessImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$PasswordChangedSuccessImpl extends PasswordChangedSuccess {
  const _$PasswordChangedSuccessImpl() : super._();

  @override
  String toString() {
    return 'AuthState.passwordChangedSuccess()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PasswordChangedSuccessImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(firebase_auth.User user, String? localAvatarPath)
    authenticated,
    required TResult Function() unauthenticated,
    required TResult Function(AuthFailure failure) failure,
    required TResult Function() passwordResetSuccess,
    required TResult Function() passwordChangedSuccess,
    required TResult Function() avatarUpdatedSuccess,
  }) {
    return passwordChangedSuccess();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(firebase_auth.User user, String? localAvatarPath)?
    authenticated,
    TResult? Function()? unauthenticated,
    TResult? Function(AuthFailure failure)? failure,
    TResult? Function()? passwordResetSuccess,
    TResult? Function()? passwordChangedSuccess,
    TResult? Function()? avatarUpdatedSuccess,
  }) {
    return passwordChangedSuccess?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(firebase_auth.User user, String? localAvatarPath)?
    authenticated,
    TResult Function()? unauthenticated,
    TResult Function(AuthFailure failure)? failure,
    TResult Function()? passwordResetSuccess,
    TResult Function()? passwordChangedSuccess,
    TResult Function()? avatarUpdatedSuccess,
    required TResult orElse(),
  }) {
    if (passwordChangedSuccess != null) {
      return passwordChangedSuccess();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthInitial value) initial,
    required TResult Function(AuthLoading value) loading,
    required TResult Function(Authenticated value) authenticated,
    required TResult Function(Unauthenticated value) unauthenticated,
    required TResult Function(AuthFailureState value) failure,
    required TResult Function(PasswordResetSuccess value) passwordResetSuccess,
    required TResult Function(PasswordChangedSuccess value)
    passwordChangedSuccess,
    required TResult Function(AvatarUpdatedSuccess value) avatarUpdatedSuccess,
  }) {
    return passwordChangedSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthInitial value)? initial,
    TResult? Function(AuthLoading value)? loading,
    TResult? Function(Authenticated value)? authenticated,
    TResult? Function(Unauthenticated value)? unauthenticated,
    TResult? Function(AuthFailureState value)? failure,
    TResult? Function(PasswordResetSuccess value)? passwordResetSuccess,
    TResult? Function(PasswordChangedSuccess value)? passwordChangedSuccess,
    TResult? Function(AvatarUpdatedSuccess value)? avatarUpdatedSuccess,
  }) {
    return passwordChangedSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthInitial value)? initial,
    TResult Function(AuthLoading value)? loading,
    TResult Function(Authenticated value)? authenticated,
    TResult Function(Unauthenticated value)? unauthenticated,
    TResult Function(AuthFailureState value)? failure,
    TResult Function(PasswordResetSuccess value)? passwordResetSuccess,
    TResult Function(PasswordChangedSuccess value)? passwordChangedSuccess,
    TResult Function(AvatarUpdatedSuccess value)? avatarUpdatedSuccess,
    required TResult orElse(),
  }) {
    if (passwordChangedSuccess != null) {
      return passwordChangedSuccess(this);
    }
    return orElse();
  }
}

abstract class PasswordChangedSuccess extends AuthState {
  const factory PasswordChangedSuccess() = _$PasswordChangedSuccessImpl;
  const PasswordChangedSuccess._() : super._();
}

/// @nodoc
abstract class _$$AvatarUpdatedSuccessImplCopyWith<$Res> {
  factory _$$AvatarUpdatedSuccessImplCopyWith(
    _$AvatarUpdatedSuccessImpl value,
    $Res Function(_$AvatarUpdatedSuccessImpl) then,
  ) = __$$AvatarUpdatedSuccessImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AvatarUpdatedSuccessImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AvatarUpdatedSuccessImpl>
    implements _$$AvatarUpdatedSuccessImplCopyWith<$Res> {
  __$$AvatarUpdatedSuccessImplCopyWithImpl(
    _$AvatarUpdatedSuccessImpl _value,
    $Res Function(_$AvatarUpdatedSuccessImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$AvatarUpdatedSuccessImpl extends AvatarUpdatedSuccess {
  const _$AvatarUpdatedSuccessImpl() : super._();

  @override
  String toString() {
    return 'AuthState.avatarUpdatedSuccess()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AvatarUpdatedSuccessImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(firebase_auth.User user, String? localAvatarPath)
    authenticated,
    required TResult Function() unauthenticated,
    required TResult Function(AuthFailure failure) failure,
    required TResult Function() passwordResetSuccess,
    required TResult Function() passwordChangedSuccess,
    required TResult Function() avatarUpdatedSuccess,
  }) {
    return avatarUpdatedSuccess();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(firebase_auth.User user, String? localAvatarPath)?
    authenticated,
    TResult? Function()? unauthenticated,
    TResult? Function(AuthFailure failure)? failure,
    TResult? Function()? passwordResetSuccess,
    TResult? Function()? passwordChangedSuccess,
    TResult? Function()? avatarUpdatedSuccess,
  }) {
    return avatarUpdatedSuccess?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(firebase_auth.User user, String? localAvatarPath)?
    authenticated,
    TResult Function()? unauthenticated,
    TResult Function(AuthFailure failure)? failure,
    TResult Function()? passwordResetSuccess,
    TResult Function()? passwordChangedSuccess,
    TResult Function()? avatarUpdatedSuccess,
    required TResult orElse(),
  }) {
    if (avatarUpdatedSuccess != null) {
      return avatarUpdatedSuccess();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthInitial value) initial,
    required TResult Function(AuthLoading value) loading,
    required TResult Function(Authenticated value) authenticated,
    required TResult Function(Unauthenticated value) unauthenticated,
    required TResult Function(AuthFailureState value) failure,
    required TResult Function(PasswordResetSuccess value) passwordResetSuccess,
    required TResult Function(PasswordChangedSuccess value)
    passwordChangedSuccess,
    required TResult Function(AvatarUpdatedSuccess value) avatarUpdatedSuccess,
  }) {
    return avatarUpdatedSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthInitial value)? initial,
    TResult? Function(AuthLoading value)? loading,
    TResult? Function(Authenticated value)? authenticated,
    TResult? Function(Unauthenticated value)? unauthenticated,
    TResult? Function(AuthFailureState value)? failure,
    TResult? Function(PasswordResetSuccess value)? passwordResetSuccess,
    TResult? Function(PasswordChangedSuccess value)? passwordChangedSuccess,
    TResult? Function(AvatarUpdatedSuccess value)? avatarUpdatedSuccess,
  }) {
    return avatarUpdatedSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthInitial value)? initial,
    TResult Function(AuthLoading value)? loading,
    TResult Function(Authenticated value)? authenticated,
    TResult Function(Unauthenticated value)? unauthenticated,
    TResult Function(AuthFailureState value)? failure,
    TResult Function(PasswordResetSuccess value)? passwordResetSuccess,
    TResult Function(PasswordChangedSuccess value)? passwordChangedSuccess,
    TResult Function(AvatarUpdatedSuccess value)? avatarUpdatedSuccess,
    required TResult orElse(),
  }) {
    if (avatarUpdatedSuccess != null) {
      return avatarUpdatedSuccess(this);
    }
    return orElse();
  }
}

abstract class AvatarUpdatedSuccess extends AuthState {
  const factory AvatarUpdatedSuccess() = _$AvatarUpdatedSuccessImpl;
  const AvatarUpdatedSuccess._() : super._();
}
