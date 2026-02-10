import '../models/todo_item_model.dart';

/// Интерфейс для удаленного источника данных задач
abstract class TodoRemoteDataSource {
  Future<List<TodoItemModel>> getTodos(String userId);
  Future<TodoItemModel> getTodoById(String id);
  Future<TodoItemModel> createTodo(TodoItemModel todo);
  Future<TodoItemModel> updateTodo(TodoItemModel todo);
  Future<void> deleteTodo(String id);
  Future<TodoItemModel> toggleTodoComplete(String id);
}