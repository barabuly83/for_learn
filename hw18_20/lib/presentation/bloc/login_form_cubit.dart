import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';

import '../../domain/usecases/login.dart';
import '../forms/email.dart';
import '../forms/login_form_state.dart';
import '../forms/password.dart';

/// {@template login_form_cubit}
/// Cubit for managing the login form state.
/// {@endtemplate}
class LoginFormCubit extends Cubit<LoginFormState> {
  /// {@macro login_form_cubit}
  LoginFormCubit(this._login) : super(const LoginFormState());

  final Login _login;

  /// Updates the email field.
  void emailChanged(String value) {
    final email = Email.dirty(value);
    emit(state.copyWith(email: email));
  }

  /// Updates the password field.
  void passwordChanged(String value) {
    final password = Password.dirty(value);
    emit(state.copyWith(password: password));
  }

  /// Submits the login form.
  Future<void> submit() async {
    if (!state.isValid) return;

    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));

    try {
      await _login(
        LoginParams(email: state.email.value, password: state.password.value),
      );
      emit(state.copyWith(status: FormzSubmissionStatus.success));
    } catch (error) {
      emit(state.copyWith(status: FormzSubmissionStatus.failure));
    }
  }

  /// Resets the form to initial state.
  void reset() {
    emit(const LoginFormState());
  }
}
