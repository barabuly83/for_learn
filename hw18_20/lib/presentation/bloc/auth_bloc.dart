import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/usecase/usecase.dart';
import '../../data/models/user_model.dart';
import '../../domain/usecases/change_password.dart';
import '../../domain/usecases/get_current_user.dart';
import '../../domain/usecases/login.dart';
import '../../domain/usecases/logout.dart';
import '../../domain/usecases/register.dart';
import '../../domain/usecases/reset_password.dart';
import '../../domain/usecases/update_user_avatar.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({
    required this.login,
    required this.register,
    required this.getCurrentUser,
    required this.logout,
    required this.resetPassword,
    required this.changePassword,
    required this.updateUserAvatar,
  }) : super(AuthInitial()) {
    on<LoginEvent>(_onLogin);
    on<RegisterEvent>(_onRegister);
    on<LogoutEvent>(_onLogout);
    on<PasswordResetEvent>(_onPasswordReset);
    on<ChangePasswordEvent>(_onChangePassword);
    on<UpdateAvatarEvent>(_onUpdateAvatar);
    on<AuthStateUpdateEvent>(_onAuthStateUpdate);
    on<AuthSignOutEvent>(_onAuthSignOut);

    // Listen to Firebase Auth state changes
    _listenToAuthStateChanges();
  }

  final Login login;
  final Register register;
  final GetCurrentUser getCurrentUser;
  final Logout logout;
  final ResetPassword resetPassword;
  final ChangePassword changePassword;
  final UpdateUserAvatar updateUserAvatar;

  void _listenToAuthStateChanges() {
    firebase_auth.FirebaseAuth.instance.authStateChanges().listen((
      firebaseUser,
    ) {
      print(
        'AuthBloc: Firebase auth state changed - User: ${firebaseUser?.email ?? 'null'}',
      );

      if (firebaseUser != null) {
        // User is signed in
        final user = UserModel.fromFirebaseUser(firebaseUser).toEntity();
        add(AuthStateUpdateEvent(user));
      } else {
        // User is signed out
        add(const AuthSignOutEvent());
      }
    });
  }

  Future<void> _onLogin(LoginEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    final result = await login(
      LoginParams(email: event.email, password: event.password),
    );
    result.fold(
      (failure) => emit(AuthError(failure.message)),
      (user) => emit(Authenticated(user)),
    );
  }

  Future<void> _onRegister(RegisterEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    final result = await register(
      RegisterParams(
        name: event.name,
        email: event.email,
        password: event.password,
      ),
    );
    result.fold(
      (failure) => emit(AuthError(failure.message)),
      (user) => emit(Authenticated(user)),
    );
  }

  Future<void> _onLogout(LogoutEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    final result = await logout(NoParams());
    result.fold(
      (failure) => emit(AuthError(failure.message)),
      (_) => emit(Unauthenticated()),
    );
  }

  Future<void> _onPasswordReset(
    PasswordResetEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    final result = await resetPassword(ResetPasswordParams(email: event.email));
    result.fold(
      (failure) => emit(AuthError(failure.message)),
      (_) => emit(const PasswordResetSuccess()),
    );
  }

  Future<void> _onChangePassword(
    ChangePasswordEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    final result = await changePassword(ChangePasswordParams(
      currentPassword: event.currentPassword,
      newPassword: event.newPassword,
    ));
    result.fold(
      (failure) => emit(AuthError(failure.message)),
      (_) => emit(const PasswordChangedSuccess()),
    );
  }

  Future<void> _onUpdateAvatar(
    UpdateAvatarEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    final result = await updateUserAvatar(UpdateUserAvatarParams(
      userId: event.userId,
      avatarUrl: event.avatarUrl,
    ));
    result.fold(
      (failure) => emit(AuthError(failure.message)),
      (_) async {
        // После успешного обновления аватарки получаем обновленную информацию о пользователе
        final userResult = await getCurrentUser(NoParams());
        userResult.fold(
          (failure) => emit(AuthError(failure.message)),
          (user) => emit(AvatarUpdatedSuccess(user!)),
        );
      },
    );
  }

  void _onAuthStateUpdate(AuthStateUpdateEvent event, Emitter<AuthState> emit) {
    emit(Authenticated(event.user));
  }

  void _onAuthSignOut(AuthSignOutEvent event, Emitter<AuthState> emit) {
    emit(Unauthenticated());
  }
}
