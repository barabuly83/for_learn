import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:formz/formz.dart';

import '../bloc/auth_bloc.dart';
import '../bloc/auth_event.dart';
import '../bloc/auth_state.dart';
import '../forms/email.dart';
import '../forms/login_form_state.dart';
import '../forms/password.dart';

/// {@template login_form_cubit}
/// Cubit for managing the login form state.
/// {@endtemplate}
class LoginFormCubit extends Cubit<LoginFormState> {
  /// {@macro login_form_cubit}
  LoginFormCubit(this._authBloc) : super(const LoginFormState()) {
    // Listen to AuthBloc state changes to update form status
    _authBloc.stream.listen(_onAuthStateChanged);
  }

  final AuthBloc _authBloc;

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

    // Dispatch login event to AuthBloc
    // AuthBloc will emit AuthLoading, which will be caught by _onAuthStateChanged
    _authBloc.add(LoginEvent(
      email: state.email.value,
      password: state.password.value,
    ));

    // Note: AuthBloc will handle the actual authentication
    // and emit states that are listened to in the UI
  }

  /// Resets the form to initial state.
  void reset() {
    emit(const LoginFormState());
  }

  /// Listens to AuthBloc state changes and updates form status accordingly.
  void _onAuthStateChanged(AuthState authState) {
    debugPrint('🔄 LoginFormCubit: Auth state changed to ${authState.runtimeType}');
    if (authState is AuthLoading) {
      // AuthBloc started loading, keep form in progress
      debugPrint('🔄 LoginFormCubit: Setting status to inProgress');
      emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
    } else if (authState is AuthError) {
      // AuthBloc failed, set form to failure
      debugPrint('❌ LoginFormCubit: Setting status to failure due to AuthError: ${authState.message}');
      emit(state.copyWith(status: FormzSubmissionStatus.failure));
    } else if (authState is Authenticated) {
      // AuthBloc succeeded, set form to success
      debugPrint('✅ LoginFormCubit: Setting status to success');
      emit(state.copyWith(status: FormzSubmissionStatus.success));
    }
    // For other states (Unauthenticated, etc.), don't change form status
  }
}
