import 'package:dartz/dartz.dart';

import '../../core/error/failures.dart';
import '../../domain/entities/todo_item.dart';
import '../../domain/repositories/todo_repository.dart';
import '../datasources/todo_remote_data_source.dart';
import '../models/todo_item_model.dart';

/// Реализация репозитория задач
/// Работает только с удаленным источником данных (Firestore)
/// Firestore предоставляет встроенное офлайн-кэширование
class TodoRepositoryImpl implements TodoRepository {
  const TodoRepositoryImpl({required this.remoteDataSource});

  final TodoRemoteDataSource remoteDataSource;

  @override
  Future<Either<Failure, List<TodoItem>>> getTodos(String userId) async {
    try {
      // Firestore предоставляет встроенное офлайн-кэширование
      final todoModels = await remoteDataSource.getTodos(userId);
      return Right(todoModels.map((model) => model.toEntity()).toList());
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, TodoItem>> getTodoById(String id) async {
    try {
      // Firestore предоставляет встроенное офлайн-кэширование
      final todoModel = await remoteDataSource.getTodoById(id);
      return Right(todoModel.toEntity());
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, TodoItem>> createTodo(TodoItem todo) async {
    try {
      final todoModel = TodoItemModel.fromEntity(todo);

      // Создаем задачу через Firestore
      final createdTodo = await remoteDataSource.createTodo(todoModel);

      return Right(createdTodo.toEntity());
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, TodoItem>> updateTodo(TodoItem todo) async {
    try {
      final todoModel = TodoItemModel.fromEntity(todo);

      // Обновляем задачу через Firestore
      final updatedTodo = await remoteDataSource.updateTodo(todoModel);

      return Right(updatedTodo.toEntity());
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> deleteTodo(String id) async {
    try {
      // Удаляем задачу через Firestore
      await remoteDataSource.deleteTodo(id);

      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, TodoItem>> toggleTodoComplete(String id) async {
    try {
      final updatedTodo = await remoteDataSource.toggleTodoComplete(id);

      return Right(updatedTodo.toEntity());
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
