import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/usecase/usecase.dart';
import '../../domain/usecases/get_users.dart';
import 'user_event.dart';
import 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc({required this.getUsers}) : super(UserInitial()) {
    on<GetUsersEvent>(_onGetUsers);
    on<CreateUserEvent>(_onCreateUser);
    on<UpdateUserEvent>(_onUpdateUser);
    on<DeleteUserEvent>(_onDeleteUser);
  }

  final GetUsers getUsers;

  Future<void> _onGetUsers(GetUsersEvent event, Emitter<UserState> emit) async {
    emit(UserLoading());
    final result = await getUsers(NoParams());
    result.fold(
      (failure) => emit(UserError(failure.message)),
      (users) => emit(UsersLoaded(users)),
    );
  }

  Future<void> _onCreateUser(
    CreateUserEvent event,
    Emitter<UserState> emit,
  ) async {
    // Implementation for creating user
    // This would typically call a CreateUser use case
  }

  Future<void> _onUpdateUser(
    UpdateUserEvent event,
    Emitter<UserState> emit,
  ) async {
    // Implementation for updating user
    // This would typically call an UpdateUser use case
  }

  Future<void> _onDeleteUser(
    DeleteUserEvent event,
    Emitter<UserState> emit,
  ) async {
    // Implementation for deleting user
    // This would typically call a DeleteUser use case
  }
}
