import 'package:equatable/equatable.dart';

import '../../domain/entities/user.dart';

abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object?> get props => [];
}

class UserInitial extends UserState {}

class UserLoading extends UserState {}

class UsersLoaded extends UserState {
  const UsersLoaded(this.users);

  final List<User> users;

  @override
  List<Object?> get props => [users];
}

class UserLoaded extends UserState {
  const UserLoaded(this.user);

  final User user;

  @override
  List<Object?> get props => [user];
}

class UserError extends UserState {
  const UserError(this.message);

  final String message;

  @override
  List<Object?> get props => [message];
}