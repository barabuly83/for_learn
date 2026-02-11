import 'package:formz/formz.dart';

import 'confirmed_password.dart';
import 'email.dart';
import 'name.dart';
import 'password.dart';

/// {@template register_form_state}
/// Form state for the register form.
/// {@endtemplate}
class RegisterFormState with FormzMixin {
  /// {@macro register_form_state}
  const RegisterFormState({
    this.name = const Name.pure(),
    this.email = const Email.pure(),
    this.password = const Password.pure(),
    this.confirmedPassword = const ConfirmedPassword.pure(),
    this.status = FormzSubmissionStatus.initial,
  });

  /// Name field.
  final Name name;

  /// Email field.
  final Email email;

  /// Password field.
  final Password password;

  /// Confirmed password field.
  final ConfirmedPassword confirmedPassword;

  /// Form submission status.
  final FormzSubmissionStatus status;

  /// Creates a copy of this [RegisterFormState] with the given fields replaced.
  RegisterFormState copyWith({
    Name? name,
    Email? email,
    Password? password,
    ConfirmedPassword? confirmedPassword,
    FormzSubmissionStatus? status,
  }) {
    return RegisterFormState(
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      confirmedPassword: confirmedPassword ?? this.confirmedPassword,
      status: status ?? this.status,
    );
  }

  @override
  List<FormzInput<dynamic, dynamic>> get inputs => [
    name,
    email,
    password,
    confirmedPassword,
  ];
}
