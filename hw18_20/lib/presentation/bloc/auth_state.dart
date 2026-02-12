import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object?> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class Authenticated extends AuthState {
  const Authenticated(this.user);

  final firebase_auth.User user;

  String? get avatarUrl => user.photoURL;

  String get displayName => user.displayName ?? user.email?.split('@')[0] ?? 'User';

  @override
  List<Object?> get props => [user];
}

class Unauthenticated extends AuthState {}

class AuthError extends AuthState {
  const AuthError(this.message);

  final String message;

  @override
  List<Object?> get props => [message];
}

class PasswordResetSuccess extends AuthState {
  const PasswordResetSuccess();
}

class PasswordChangedSuccess extends AuthState {
  const PasswordChangedSuccess();
}

class AvatarUpdatedSuccess extends AuthState {
  const AvatarUpdatedSuccess();

  @override
  List<Object?> get props => [];
}
