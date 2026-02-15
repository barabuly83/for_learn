import 'package:dartz/dartz.dart';

import '../../core/error/failures.dart';
import '../entities/todo_item.dart';

abstract class TodoRepository {
  Future<Either<Failure, List<TodoItem>>> getTodos(String userId);
  Future<Either<Failure, TodoItem>> getTodoById(String id);
  Future<Either<Failure, TodoItem>> createTodo(TodoItem todo);
  Future<Either<Failure, TodoItem>> updateTodo(TodoItem todo);
  Future<Either<Failure, void>> deleteTodo(String id);
  Future<Either<Failure, TodoItem>> toggleTodoComplete(String id);
  Future<Either<Failure, List<TodoItem>>> reorderTodos(List<TodoItem> todos);
}
