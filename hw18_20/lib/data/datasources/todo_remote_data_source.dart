import 'dart:async';
import '../models/todo_item_model.dart';

abstract class TodoRemoteDataSource {
  Future<List<TodoItemModel>> getTodos(String userId);
  Stream<List<TodoItemModel>> watchTodos(String userId);
  Future<TodoItemModel> getTodoById(String id);
  Future<TodoItemModel> createTodo(TodoItemModel todo);
  Future<TodoItemModel> updateTodo(TodoItemModel todo);
  Future<void> deleteTodo(String id);
  Future<TodoItemModel> toggleTodoComplete(String id);
}
