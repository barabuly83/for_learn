// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'register_form_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$RegisterFormState {
  Name get name => throw _privateConstructorUsedError;
  Email get email => throw _privateConstructorUsedError;
  Password get password => throw _privateConstructorUsedError;
  ConfirmedPassword get confirmedPassword => throw _privateConstructorUsedError;
  FormzSubmissionStatus get status => throw _privateConstructorUsedError;

  /// Create a copy of RegisterFormState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RegisterFormStateCopyWith<RegisterFormState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisterFormStateCopyWith<$Res> {
  factory $RegisterFormStateCopyWith(
    RegisterFormState value,
    $Res Function(RegisterFormState) then,
  ) = _$RegisterFormStateCopyWithImpl<$Res, RegisterFormState>;
  @useResult
  $Res call({
    Name name,
    Email email,
    Password password,
    ConfirmedPassword confirmedPassword,
    FormzSubmissionStatus status,
  });
}

/// @nodoc
class _$RegisterFormStateCopyWithImpl<$Res, $Val extends RegisterFormState>
    implements $RegisterFormStateCopyWith<$Res> {
  _$RegisterFormStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RegisterFormState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? email = null,
    Object? password = null,
    Object? confirmedPassword = null,
    Object? status = null,
  }) {
    return _then(
      _value.copyWith(
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as Name,
            email: null == email
                ? _value.email
                : email // ignore: cast_nullable_to_non_nullable
                      as Email,
            password: null == password
                ? _value.password
                : password // ignore: cast_nullable_to_non_nullable
                      as Password,
            confirmedPassword: null == confirmedPassword
                ? _value.confirmedPassword
                : confirmedPassword // ignore: cast_nullable_to_non_nullable
                      as ConfirmedPassword,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as FormzSubmissionStatus,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$RegisterFormStateImplCopyWith<$Res>
    implements $RegisterFormStateCopyWith<$Res> {
  factory _$$RegisterFormStateImplCopyWith(
    _$RegisterFormStateImpl value,
    $Res Function(_$RegisterFormStateImpl) then,
  ) = __$$RegisterFormStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    Name name,
    Email email,
    Password password,
    ConfirmedPassword confirmedPassword,
    FormzSubmissionStatus status,
  });
}

/// @nodoc
class __$$RegisterFormStateImplCopyWithImpl<$Res>
    extends _$RegisterFormStateCopyWithImpl<$Res, _$RegisterFormStateImpl>
    implements _$$RegisterFormStateImplCopyWith<$Res> {
  __$$RegisterFormStateImplCopyWithImpl(
    _$RegisterFormStateImpl _value,
    $Res Function(_$RegisterFormStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RegisterFormState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? email = null,
    Object? password = null,
    Object? confirmedPassword = null,
    Object? status = null,
  }) {
    return _then(
      _$RegisterFormStateImpl(
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as Name,
        email: null == email
            ? _value.email
            : email // ignore: cast_nullable_to_non_nullable
                  as Email,
        password: null == password
            ? _value.password
            : password // ignore: cast_nullable_to_non_nullable
                  as Password,
        confirmedPassword: null == confirmedPassword
            ? _value.confirmedPassword
            : confirmedPassword // ignore: cast_nullable_to_non_nullable
                  as ConfirmedPassword,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as FormzSubmissionStatus,
      ),
    );
  }
}

/// @nodoc

class _$RegisterFormStateImpl extends _RegisterFormState {
  const _$RegisterFormStateImpl({
    this.name = const Name.pure(),
    this.email = const Email.pure(),
    this.password = const Password.pure(),
    this.confirmedPassword = const ConfirmedPassword.pure(),
    this.status = FormzSubmissionStatus.initial,
  }) : super._();

  @override
  @JsonKey()
  final Name name;
  @override
  @JsonKey()
  final Email email;
  @override
  @JsonKey()
  final Password password;
  @override
  @JsonKey()
  final ConfirmedPassword confirmedPassword;
  @override
  @JsonKey()
  final FormzSubmissionStatus status;

  @override
  String toString() {
    return 'RegisterFormState(name: $name, email: $email, password: $password, confirmedPassword: $confirmedPassword, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegisterFormStateImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.confirmedPassword, confirmedPassword) ||
                other.confirmedPassword == confirmedPassword) &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    name,
    email,
    password,
    confirmedPassword,
    status,
  );

  /// Create a copy of RegisterFormState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RegisterFormStateImplCopyWith<_$RegisterFormStateImpl> get copyWith =>
      __$$RegisterFormStateImplCopyWithImpl<_$RegisterFormStateImpl>(
        this,
        _$identity,
      );
}

abstract class _RegisterFormState extends RegisterFormState {
  const factory _RegisterFormState({
    final Name name,
    final Email email,
    final Password password,
    final ConfirmedPassword confirmedPassword,
    final FormzSubmissionStatus status,
  }) = _$RegisterFormStateImpl;
  const _RegisterFormState._() : super._();

  @override
  Name get name;
  @override
  Email get email;
  @override
  Password get password;
  @override
  ConfirmedPassword get confirmedPassword;
  @override
  FormzSubmissionStatus get status;

  /// Create a copy of RegisterFormState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RegisterFormStateImplCopyWith<_$RegisterFormStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
