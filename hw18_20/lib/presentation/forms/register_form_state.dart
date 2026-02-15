import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'confirmed_password.dart';
import 'email.dart';
import 'name.dart';
import 'password.dart';

part 'register_form_state.freezed.dart';

/// {@template register_form_state}
/// Form state for the register form.
/// {@endtemplate}
@freezed
abstract class RegisterFormState with _$RegisterFormState, FormzMixin {
  /// {@macro register_form_state}
  const factory RegisterFormState({
    @Default(Name.pure()) Name name,
    @Default(Email.pure()) Email email,
    @Default(Password.pure()) Password password,
    @Default(ConfirmedPassword.pure()) ConfirmedPassword confirmedPassword,
    @Default(FormzSubmissionStatus.initial) FormzSubmissionStatus status,
  }) = _RegisterFormState;

  const RegisterFormState._();

  @override
  List<FormzInput<dynamic, dynamic>> get inputs => [
    name,
    email,
    password,
    confirmedPassword,
  ];
}
