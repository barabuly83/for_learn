import 'package:dartz/dartz.dart';

import '../../core/error/failures.dart';
import '../../core/usecase/usecase.dart';
import '../entities/todo_item.dart';
import '../repositories/todo_repository.dart';

class CreateTodo implements UseCase<TodoItem, TodoItem> {
  const CreateTodo(this.repository);

  final TodoRepository repository;

  @override
  Future<Either<Failure, TodoItem>> call(TodoItem params) async {
    return await repository.createTodo(params);
  }
}