import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'email.dart';
import 'password.dart';

part 'login_form_state.freezed.dart';

/// {@template login_form_state}
/// Form state for the login form.
/// {@endtemplate}
@freezed
abstract class LoginFormState with _$LoginFormState, FormzMixin {
  /// {@macro login_form_state}
  const factory LoginFormState({
    @Default(Email.pure()) Email email,
    @Default(Password.pure()) Password password,
    @Default(FormzSubmissionStatus.initial) FormzSubmissionStatus status,
  }) = _LoginFormState;

  const LoginFormState._();

  @override
  List<FormzInput<dynamic, dynamic>> get inputs => [email, password];
}
