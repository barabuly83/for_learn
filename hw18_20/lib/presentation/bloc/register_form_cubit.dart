import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';

import '../../domain/usecases/register.dart';
import '../forms/confirmed_password.dart';
import '../forms/email.dart';
import '../forms/name.dart';
import '../forms/password.dart';
import '../forms/register_form_state.dart';

/// {@template register_form_cubit}
/// Cubit for managing the register form state.
/// {@endtemplate}
class RegisterFormCubit extends Cubit<RegisterFormState> {
  /// {@macro register_form_cubit}
  RegisterFormCubit(this._register) : super(const RegisterFormState());

  final Register _register;

  /// Updates the name field.
  void nameChanged(String value) {
    final name = Name.dirty(value);
    emit(state.copyWith(name: name));
  }

  /// Updates the email field.
  void emailChanged(String value) {
    final email = Email.dirty(value);
    emit(state.copyWith(email: email));
  }

  /// Updates the password field.
  void passwordChanged(String value) {
    final password = Password.dirty(value);
    final confirmedPassword = ConfirmedPassword.dirty(
      password: password.value,
      value: state.confirmedPassword.value,
    );
    emit(
      state.copyWith(password: password, confirmedPassword: confirmedPassword),
    );
  }

  /// Updates the confirmed password field.
  void confirmedPasswordChanged(String value) {
    final confirmedPassword = ConfirmedPassword.dirty(
      password: state.password.value,
      value: value,
    );
    emit(state.copyWith(confirmedPassword: confirmedPassword));
  }

  /// Submits the register form.
  Future<void> submit() async {
    if (!state.isValid) return;

    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));

    try {
      await _register(
        RegisterParams(
          name: state.name.value,
          email: state.email.value,
          password: state.password.value,
        ),
      );
      emit(state.copyWith(status: FormzSubmissionStatus.success));
    } catch (error) {
      emit(state.copyWith(status: FormzSubmissionStatus.failure));
    }
  }
}
