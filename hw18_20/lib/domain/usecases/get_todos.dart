import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../core/error/failures.dart';
import '../../core/usecase/usecase.dart';
import '../entities/todo_item.dart';
import '../repositories/todo_repository.dart';

class GetTodosParams extends Equatable {
  const GetTodosParams({
    required this.userId,
  });

  final String userId;

  @override
  List<Object?> get props => [userId];
}

class GetTodos implements UseCase<List<TodoItem>, GetTodosParams> {
  const GetTodos(this.repository);

  final TodoRepository repository;

  @override
  Future<Either<Failure, List<TodoItem>>> call(GetTodosParams params) async {
    return await repository.getTodos(params.userId);
  }
}