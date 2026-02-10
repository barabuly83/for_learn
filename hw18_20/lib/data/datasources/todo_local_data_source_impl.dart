import 'todo_local_data_source.dart';
import '../models/todo_item_model.dart';

class TodoLocalDataSourceImpl implements TodoLocalDataSource {
  // Simple in-memory storage for demo purposes
  final Map<String, TodoItemModel> _cache = {};

  @override
  Future<List<TodoItemModel>> getCachedTodos(String userId) async {
    return _cache.values.where((todo) => todo.userId == userId).toList();
  }

  @override
  Future<void> cacheTodos(List<TodoItemModel> todos) async {
    for (final todo in todos) {
      _cache[todo.id] = todo;
    }
  }

  @override
  Future<TodoItemModel?> getCachedTodoById(String id) async {
    return _cache[id];
  }

  @override
  Future<void> cacheTodo(TodoItemModel todo) async {
    _cache[todo.id] = todo;
  }

  @override
  Future<void> deleteCachedTodo(String id) async {
    _cache.remove(id);
  }

  @override
  Future<void> clearCache() async {
    _cache.clear();
  }
}
