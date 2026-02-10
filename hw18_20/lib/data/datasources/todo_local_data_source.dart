import '../models/todo_item_model.dart';

/// Абстракция для локального источника данных задач (Hive Storage)
/// Скрывает детали реализации работы с локальным хранилищем
/// В реальном приложении здесь мог бы быть Hive, SharedPreferences, SQLite и т.д.
abstract class TodoLocalDataSource {
  Future<List<TodoItemModel>> getCachedTodos(String userId);
  Future<void> cacheTodos(List<TodoItemModel> todos);
  Future<TodoItemModel?> getCachedTodoById(String id);
  Future<void> cacheTodo(TodoItemModel todo);
  Future<void> deleteCachedTodo(String id);
  Future<void> clearCache();
}