import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../core/error/failures.dart';
import '../../core/usecase/usecase.dart';
import '../repositories/todo_repository.dart';

class DeleteTodoParams extends Equatable {
  const DeleteTodoParams({
    required this.id,
  });

  final String id;

  @override
  List<Object?> get props => [id];
}

class DeleteTodo implements UseCase<void, DeleteTodoParams> {
  const DeleteTodo(this.repository);

  final TodoRepository repository;

  @override
  Future<Either<Failure, void>> call(DeleteTodoParams params) async {
    return await repository.deleteTodo(params.id);
  }
}