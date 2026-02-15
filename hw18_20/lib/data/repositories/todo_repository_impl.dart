import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

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
      debugPrint('📊 TodoRepositoryImpl: Fetching todos for user: $userId');
      // Firestore предоставляет встроенное офлайн-кэширование
      final todoModels = await remoteDataSource.getTodos(userId);
      debugPrint(
        '📊 TodoRepositoryImpl: Retrieved ${todoModels.length} todos from data source',
      );
      final todos = todoModels.map((model) => model.toEntity()).toList();
      return Right(todos);
    } catch (e) {
      debugPrint('❌ TodoRepositoryImpl: Error fetching todos: $e');
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

  @override
  Future<Either<Failure, List<TodoItem>>> reorderTodos(
    List<TodoItem> todos,
  ) async {
    try {
      debugPrint('🔄 TodoRepositoryImpl: Reordering ${todos.length} todos');

      // Обновляем порядок задач в базе данных
      final updatedModels = <TodoItemModel>[];
      for (var i = 0; i < todos.length; i++) {
        final todo = todos[i];
        final updatedTodo = todo.copyWith(order: i);
        final model = TodoItemModel.fromEntity(updatedTodo);
        final updatedModel = await remoteDataSource.updateTodo(model);
        updatedModels.add(updatedModel);
      }

      final updatedTodos = updatedModels
          .map((model) => model.toEntity())
          .toList();
      debugPrint('✅ TodoRepositoryImpl: Successfully reordered todos');
      return Right(updatedTodos);
    } catch (e) {
      debugPrint('❌ TodoRepositoryImpl: Error reordering todos: $e');
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
