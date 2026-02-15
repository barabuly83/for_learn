import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../core/error/failures.dart';

part 'auth_state.freezed.dart';

@freezed
abstract class AuthState with _$AuthState {
  const factory AuthState.initial() = AuthInitial;

  const factory AuthState.loading() = AuthLoading;

  const factory AuthState.authenticated(
    firebase_auth.User user, [
    String? localAvatarPath,
  ]) = Authenticated;

  const factory AuthState.unauthenticated() = Unauthenticated;

  const factory AuthState.failure(AuthFailure failure) = AuthFailureState;

  const factory AuthState.passwordResetSuccess() = PasswordResetSuccess;

  const factory AuthState.passwordChangedSuccess() = PasswordChangedSuccess;

  const factory AuthState.avatarUpdatedSuccess() = AvatarUpdatedSuccess;

  const AuthState._();

  String? get avatarUrl => maybeWhen<String?>(
    authenticated: (user, localAvatarPath) => localAvatarPath ?? user.photoURL,
    orElse: () => null,
  );

  String? get displayName => maybeWhen<String?>(
    authenticated: (user, _) =>
        user.displayName ?? user.email?.split('@')[0] ?? 'User',
    orElse: () => null,
  );
}
