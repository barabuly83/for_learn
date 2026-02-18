import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/error/failures.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(const AuthInitial()) {
    on<LoginEvent>(_onLogin);
    on<RegisterEvent>(_onRegister);
    on<LogoutEvent>(_onLogout);
    on<PasswordResetEvent>(_onPasswordReset);
    on<ChangePasswordEvent>(_onChangePassword);
    on<UpdateAvatarEvent>(_onUpdateAvatar);
    on<AuthUserChanged>(_onAuthUserChanged);

    // Listen to Firebase auth state changes directly
    _listenToAuthStateChanges();
  }

  final firebase_auth.FirebaseAuth _auth = firebase_auth.FirebaseAuth.instance;
  StreamSubscription<firebase_auth.User?>? _authSubscription;

  void _listenToAuthStateChanges() {
    _authSubscription = _auth.authStateChanges().listen((firebaseUser) {
      debugPrint(
        '🎧 AuthBloc: Firebase authStateChanges - User: ${firebaseUser?.email ?? 'null'}',
      );

      // Dispatch event instead of calling emit directly
      debugPrint('📤 AuthBloc: Dispatching AuthUserChanged event');
      add(AuthUserChanged(firebaseUser));
    });
  }

  Future<void> _onLogin(LoginEvent event, Emitter<AuthState> emit) async {
    emit(const AuthLoading());
    try {
      debugPrint('🔐 Попытка входа: ${event.email}');
      await _auth.signInWithEmailAndPassword(
        email: event.email,
        password: event.password,
      );
      debugPrint('✅ Вход успешен');
      // Auth state will be updated automatically by the listener
    } on firebase_auth.FirebaseAuthException catch (e) {
      debugPrint('❌ Ошибка Firebase Auth: ${e.code} - ${e.message}');
      final failure = authFailureFromFirebaseCode(e.code);
      debugPrint(
        '📤 AuthBloc: Emitting AuthFailureState with failure: ${failure.code}',
      );
      emit(AuthFailureState(failure));
    } catch (e) {
      debugPrint('❌ Неизвестная ошибка входа: $e');
      const failure = AuthFailure(
        message: 'auth-error-unknown',
        code: 'auth-error-unknown',
      );
      debugPrint(
        '📤 AuthBloc: Emitting AuthFailureState with failure: ${failure.code}',
      );
      emit(const AuthFailureState(failure));
    }
  }

  Future<void> _onRegister(RegisterEvent event, Emitter<AuthState> emit) async {
    emit(const AuthLoading());
    try {
      final userCredential = await _auth.createUserWithEmailAndPassword(
        email: event.email,
        password: event.password,
      );

      if (userCredential.user != null) {
        await userCredential.user!.updateDisplayName(event.name);
        await userCredential.user!.reload();
        // Auth state will be updated automatically by the listener
      }
    } on firebase_auth.FirebaseAuthException catch (e) {
      final failure = authFailureFromFirebaseCode(e.code);
      emit(AuthFailureState(failure));
    } catch (e) {
      const failure = AuthFailure(
        message: 'auth-error-unknown',
        code: 'auth-error-unknown',
      );
      emit(const AuthFailureState(failure));
    }
  }

  Future<void> _onLogout(LogoutEvent event, Emitter<AuthState> emit) async {
    emit(const AuthLoading());
    try {
      await _auth.signOut();
      // Auth state will be updated automatically by the listener
    } catch (e) {
      const failure = AuthFailure(
        message: 'auth-error-unknown',
        code: 'auth-error-unknown',
      );
      emit(const AuthFailureState(failure));
    }
  }

  Future<void> _onPasswordReset(
    PasswordResetEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthLoading());
    try {
      await _auth.sendPasswordResetEmail(email: event.email);
      emit(const PasswordResetSuccess());
    } on firebase_auth.FirebaseAuthException catch (e) {
      final failure = authFailureFromFirebaseCode(e.code);
      emit(AuthFailureState(failure));
    } catch (e) {
      const failure = AuthFailure(
        message: 'auth-error-unknown',
        code: 'auth-error-unknown',
      );
      emit(const AuthFailureState(failure));
    }
  }

  Future<void> _onChangePassword(
    ChangePasswordEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthLoading());
    try {
      final user = _auth.currentUser;
      if (user == null) {
        const failure = AuthFailure(
          message: 'auth-error-unknown',
          code: 'auth-error-unknown',
        );
        emit(const AuthFailureState(failure));
        return;
      }

      final email = user.email;
      if (email == null) {
        const failure = AuthFailure(
          message: 'auth-error-unknown',
          code: 'auth-error-unknown',
        );
        emit(const AuthFailureState(failure));
        return;
      }

      final credential = firebase_auth.EmailAuthProvider.credential(
        email: email,
        password: event.currentPassword,
      );

      await user.reauthenticateWithCredential(credential);
      await user.updatePassword(event.newPassword);
      emit(const PasswordChangedSuccess());
    } on firebase_auth.FirebaseAuthException catch (e) {
      final failure = authFailureFromFirebaseCode(e.code);
      emit(AuthFailureState(failure));
    } catch (e) {
      const failure = AuthFailure(
        message: 'auth-error-unknown',
        code: 'auth-error-unknown',
      );
      emit(const AuthFailureState(failure));
    }
  }

  Future<void> _onUpdateAvatar(
    UpdateAvatarEvent event,
    Emitter<AuthState> emit,
  ) async {
    try {
      debugPrint('📸 AuthBloc: Updating user avatar URL: ${event.avatarUrl}');

      final currentUser = _auth.currentUser;
      if (currentUser == null) {
        debugPrint('❌ AuthBloc: No current user found');
        const failure = AuthFailure(
          message: 'auth-error-unknown',
          code: 'auth-error-unknown',
        );
        emit(const AuthFailureState(failure));
        return;
      }

      debugPrint('📸 AuthBloc: Current user photoURL: ${currentUser.photoURL}');

      // Update the user's photoURL in Firebase Auth
      await currentUser.updatePhotoURL(event.avatarUrl);
      debugPrint('📸 AuthBloc: photoURL updated in Firebase Auth');

      // Reload user data to get updated photoURL
      await currentUser.reload();
      debugPrint('📸 AuthBloc: User data reloaded');

      // Add a small delay to ensure Firebase Auth is fully updated
      await Future<void>.delayed(const Duration(milliseconds: 500));

      final updatedUser = _auth.currentUser;
      if (updatedUser != null) {
        debugPrint(
          '✅ AuthBloc: Avatar updated successfully, new photoURL: ${updatedUser.photoURL}',
        );

        // Emit the updated Authenticated state with new avatar
        emit(Authenticated(updatedUser));

        // Small delay before emitting success to ensure UI updates
        await Future<void>.delayed(const Duration(milliseconds: 100));

        // Then emit success state for UI feedback
        emit(const AvatarUpdatedSuccess());
      } else {
        debugPrint('❌ AuthBloc: Updated user is null');
        const failure = AuthFailure(
          message: 'auth-error-unknown',
          code: 'auth-error-unknown',
        );
        emit(const AuthFailureState(failure));
      }
    } catch (e) {
      debugPrint('❌ AuthBloc: Error updating avatar: $e');
      const failure = AuthFailure(
        message: 'auth-error-unknown',
        code: 'auth-error-unknown',
      );
      emit(const AuthFailureState(failure));
    }
  }

  void _onAuthUserChanged(AuthUserChanged event, Emitter<AuthState> emit) {
    debugPrint(
      '🔄 AuthBloc._onAuthUserChanged: user=${event.user?.email ?? 'null'}',
    );
    if (event.user != null) {
      // User is signed in
      debugPrint('✅ AuthBloc: Emitting Authenticated');
      emit(Authenticated(event.user!));
    } else {
      // User is signed out
      debugPrint('❌ AuthBloc: Emitting Unauthenticated');
      emit(const Unauthenticated());
    }
  }

  @override
  Future<void> close() async {
    _authSubscription?.cancel();
    await super.close();
  }
}
