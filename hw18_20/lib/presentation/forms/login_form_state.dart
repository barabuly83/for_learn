import 'package:formz/formz.dart';

import 'email.dart';
import 'password.dart';

/// {@template login_form_state}
/// Form state for the login form.
/// {@endtemplate}
class LoginFormState with FormzMixin {
  /// {@macro login_form_state}
  const LoginFormState({
    this.email = const Email.pure(),
    this.password = const Password.pure(),
    this.status = FormzSubmissionStatus.initial,
  });

  /// Email field.
  final Email email;

  /// Password field.
  final Password password;

  /// Form submission status.
  final FormzSubmissionStatus status;

  /// Creates a copy of this [LoginFormState] with the given fields replaced.
  LoginFormState copyWith({
    Email? email,
    Password? password,
    FormzSubmissionStatus? status,
  }) {
    return LoginFormState(
      email: email ?? this.email,
      password: password ?? this.password,
      status: status ?? this.status,
    );
  }

  @override
  List<FormzInput<dynamic, dynamic>> get inputs => [email, password];
}
