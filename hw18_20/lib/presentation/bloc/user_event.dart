import 'package:equatable/equatable.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object?> get props => [];
}

class GetUsersEvent extends UserEvent {
  const GetUsersEvent();
}

class CreateUserEvent extends UserEvent {
  const CreateUserEvent({
    required this.name,
    required this.email,
  });

  final String name;
  final String email;

  @override
  List<Object?> get props => [name, email];
}

class UpdateUserEvent extends UserEvent {
  const UpdateUserEvent({
    required this.id,
    required this.name,
    required this.email,
  });

  final String id;
  final String name;
  final String email;

  @override
  List<Object?> get props => [id, name, email];
}

class DeleteUserEvent extends UserEvent {
  const DeleteUserEvent({
    required this.id,
  });

  final String id;

  @override
  List<Object?> get props => [id];
}