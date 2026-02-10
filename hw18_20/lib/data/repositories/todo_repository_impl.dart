import 'package:dartz/dartz.dart';

import '../../core/error/failures.dart';
import '../../domain/entities/todo_item.dart';
import '../../domain/repositories/todo_repository.dart';
import '../datasources/todo_local_data_source.dart';
import '../datasources/todo_remote_data_source.dart';
import '../models/todo_item_model.dart';

/// Реализация репозитория задач
/// Координирует работу между удаленным и локальным источниками данных
/// Предоставляет единообразный доступ к данным для доменного слоя
class TodoRepositoryImpl implements TodoRepository {
  const TodoRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  final TodoRemoteDataSource remoteDataSource;
  final TodoLocalDataSource localDataSource;

  @override
  Future<Either<Failure, List<TodoItem>>> getTodos(String userId) async {
    try {
      // Сначала пытаемся получить данные из кэша
      final cachedTodos = await localDataSource.getCachedTodos(userId);
      if (cachedTodos.isNotEmpty) {
        // Возвращаем кэшированные данные, но также обновляем кэш в фоне
        _refreshTodosCache(userId);
        return Right(cachedTodos.map((model) => model.toEntity()).toList());
      }

      // Если кэша нет, получаем данные из API
      final todoModels = await remoteDataSource.getTodos(userId);

      // Сохраняем в кэш для будущего использования
      await localDataSource.cacheTodos(todoModels);

      return Right(todoModels.map((model) => model.toEntity()).toList());
    } catch (e) {
      // Если API недоступен, пытаемся вернуть данные из кэша
      final cachedTodos = await localDataSource.getCachedTodos(userId);
      if (cachedTodos.isNotEmpty) {
        return Right(cachedTodos.map((model) => model.toEntity()).toList());
      }
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, TodoItem>> getTodoById(String id) async {
    try {
      // Сначала пытаемся получить данные из кэша
      final cachedTodo = await localDataSource.getCachedTodoById(id);
      if (cachedTodo != null) {
        return Right(cachedTodo.toEntity());
      }

      // Если кэша нет, получаем данные из API
      final todoModel = await remoteDataSource.getTodoById(id);

      // Сохраняем в кэш для будущего использования
      await localDataSource.cacheTodo(todoModel);

      return Right(todoModel.toEntity());
    } catch (e) {
      // Если API недоступен, пытаемся вернуть данные из кэша
      final cachedTodo = await localDataSource.getCachedTodoById(id);
      if (cachedTodo != null) {
        return Right(cachedTodo.toEntity());
      }
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, TodoItem>> createTodo(TodoItem todo) async {
    try {
      final todoModel = TodoItemModel.fromEntity(todo);

      // Создаем задачу через API
      final createdTodo = await remoteDataSource.createTodo(todoModel);

      // Сохраняем в кэш
      await localDataSource.cacheTodo(createdTodo);

      return Right(createdTodo.toEntity());
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, TodoItem>> updateTodo(TodoItem todo) async {
    try {
      final todoModel = TodoItemModel.fromEntity(todo);

      // Обновляем задачу через API
      final updatedTodo = await remoteDataSource.updateTodo(todoModel);

      // Обновляем кэш
      await localDataSource.cacheTodo(updatedTodo);

      return Right(updatedTodo.toEntity());
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> deleteTodo(String id) async {
    try {
      // Удаляем задачу через API
      await remoteDataSource.deleteTodo(id);

      // Удаляем из кэша
      await localDataSource.deleteCachedTodo(id);

      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, TodoItem>> toggleTodoComplete(String id) async {
    try {
      final updatedTodo = await remoteDataSource.toggleTodoComplete(id);

      // Обновляем кэш
      await localDataSource.cacheTodo(updatedTodo);

      return Right(updatedTodo.toEntity());
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  /// Обновляет кэш задач в фоне
  void _refreshTodosCache(String userId) async {
    try {
      final todoModels = await remoteDataSource.getTodos(userId);
      await localDataSource.cacheTodos(todoModels);
    } catch (e) {
      // Игнорируем ошибки при обновлении кэша в фоне
    }
  }
}