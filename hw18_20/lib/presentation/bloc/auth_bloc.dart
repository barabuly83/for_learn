import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
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

  String _getAuthErrorMessage(firebase_auth.FirebaseAuthException e) {
    switch (e.code) {
      case 'user-not-found':
        return 'Пользователь с таким email не найден';
      case 'wrong-password':
        return 'Неверный пароль';
      case 'email-already-in-use':
        return 'Пользователь с таким email уже существует';
      case 'weak-password':
        return 'Пароль слишком слабый';
      case 'invalid-email':
        return 'Неверный формат email';
      case 'user-disabled':
        return 'Аккаунт заблокирован';
      case 'too-many-requests':
        return 'Слишком много попыток. Попробуйте позже';
      default:
        return 'Ошибка аутентификации: ${e.message ?? e.code}';
    }
  }

  void _listenToAuthStateChanges() {
    _auth.authStateChanges().listen((
      firebaseUser,
    ) {
      debugPrint(
        '🎧 AuthBloc: Firebase authStateChanges - User: ${firebaseUser?.email ?? 'null'}',
      );

      // Dispatch event instead of calling emit directly
      debugPrint('📤 AuthBloc: Dispatching AuthUserChanged event');
      add(AuthUserChanged(firebaseUser));
    });
  }

  Future<void> _onLogin(LoginEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
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
      emit(AuthError(_getAuthErrorMessage(e)));
    } catch (e) {
      debugPrint('❌ Неизвестная ошибка входа: $e');
      emit(AuthError('Ошибка входа: ${e.toString()}'));
    }
  }

  Future<void> _onRegister(RegisterEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
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
      emit(AuthError(_getAuthErrorMessage(e)));
    } catch (e) {
      emit(AuthError('Ошибка регистрации: ${e.toString()}'));
    }
  }

  Future<void> _onLogout(LogoutEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      await _auth.signOut();
      // Auth state will be updated automatically by the listener
    } catch (e) {
      emit(AuthError('Ошибка выхода: ${e.toString()}'));
    }
  }

  Future<void> _onPasswordReset(
    PasswordResetEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    try {
      await _auth.sendPasswordResetEmail(email: event.email);
      emit(const PasswordResetSuccess());
    } on firebase_auth.FirebaseAuthException catch (e) {
      emit(AuthError(_getAuthErrorMessage(e)));
    } catch (e) {
      emit(AuthError('Ошибка сброса пароля: ${e.toString()}'));
    }
  }

  Future<void> _onChangePassword(
    ChangePasswordEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    try {
      final user = _auth.currentUser;
      if (user == null) {
        emit(const AuthError('Пользователь не авторизован'));
        return;
      }

      // Для изменения пароля в Firebase требуется reauthentication
      final email = user.email;
      if (email == null) {
        emit(const AuthError('Email пользователя не найден'));
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
      emit(AuthError(_getAuthErrorMessage(e)));
    } catch (e) {
      emit(AuthError('Ошибка изменения пароля: ${e.toString()}'));
    }
  }

  Future<void> _onUpdateAvatar(
    UpdateAvatarEvent event,
    Emitter<AuthState> emit,
  ) async {
    // Avatar updates are handled by the profile page through AvatarService
    // This method is kept for interface compatibility but not used
    emit(const AvatarUpdatedSuccess());
  }

  void _onAuthUserChanged(
    AuthUserChanged event,
    Emitter<AuthState> emit,
  ) {
    debugPrint('🔄 AuthBloc._onAuthUserChanged: user=${event.user?.email ?? 'null'}');
    if (event.user != null) {
      // User is signed in
      debugPrint('✅ AuthBloc: Emitting Authenticated');
      emit(Authenticated(event.user!));
    } else {
      // User is signed out
      debugPrint('❌ AuthBloc: Emitting Unauthenticated');
      emit(Unauthenticated());
    }
  }

}
