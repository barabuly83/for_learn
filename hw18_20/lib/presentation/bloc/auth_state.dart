import 'package:equatable/equatable.dart';

import '../../domain/entities/user.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object?> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class Authenticated extends AuthState {
  const Authenticated(this.user);

  final User user;

  String? get avatarUrl => user.avatarUrl;

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
  const AvatarUpdatedSuccess(this.updatedUser);

  final User updatedUser;

  @override
  List<Object?> get props => [updatedUser];
}
