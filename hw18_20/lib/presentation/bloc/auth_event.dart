import 'package:equatable/equatable.dart';

import '../../domain/entities/user.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object?> get props => [];
}

class LoginEvent extends AuthEvent {
  const LoginEvent({required this.email, required this.password});

  final String email;
  final String password;

  @override
  List<Object?> get props => [email, password];
}

class RegisterEvent extends AuthEvent {
  const RegisterEvent({
    required this.name,
    required this.email,
    required this.password,
  });

  final String name;
  final String email;
  final String password;

  @override
  List<Object?> get props => [name, email, password];
}

class LogoutEvent extends AuthEvent {
  const LogoutEvent();
}

class PasswordResetEvent extends AuthEvent {
  const PasswordResetEvent({required this.email});

  final String email;

  @override
  List<Object?> get props => [email];
}

class ChangePasswordEvent extends AuthEvent {
  const ChangePasswordEvent({
    required this.currentPassword,
    required this.newPassword,
  });

  final String currentPassword;
  final String newPassword;

  @override
  List<Object?> get props => [currentPassword, newPassword];
}

class UpdateAvatarEvent extends AuthEvent {
  const UpdateAvatarEvent({
    required this.userId,
    required this.avatarUrl,
  });

  final String userId;
  final String avatarUrl;

  @override
  List<Object?> get props => [userId, avatarUrl];
}

class AuthStateUpdateEvent extends AuthEvent {
  const AuthStateUpdateEvent(this.user);

  final User user;

  @override
  List<Object?> get props => [user];
}

class AuthSignOutEvent extends AuthEvent {
  const AuthSignOutEvent();
}
