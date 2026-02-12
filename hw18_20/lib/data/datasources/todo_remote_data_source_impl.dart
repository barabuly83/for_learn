import 'package:cloud_firestore/cloud_firestore.dart';

import 'todo_remote_data_source.dart';
import '../models/todo_item_model.dart';

class TodoRemoteDataSourceImpl implements TodoRemoteDataSource {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<List<TodoItemModel>> getTodos(String userId) async {
    try {
      // Add timeout to prevent hanging
      final querySnapshot = await _firestore
          .collection('todos')
          .where('userId', isEqualTo: userId)
          .get()
          .timeout(const Duration(seconds: 10));

      final todos = querySnapshot.docs
          .map((doc) => TodoItemModel.fromFirestore(doc))
          .toList();

      todos.sort((a, b) {
        if (a.createdAt == null && b.createdAt == null) return 0;
        if (a.createdAt == null) return 1;
        if (b.createdAt == null) return -1;
        return b.createdAt!.compareTo(a.createdAt!);
      });

      return todos;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<TodoItemModel> getTodoById(String id) async {
    final docSnapshot = await _firestore.collection('todos').doc(id).get();
    if (!docSnapshot.exists) {
      throw Exception('Todo not found');
    }
    return TodoItemModel.fromFirestore(docSnapshot);
  }

  @override
  Future<TodoItemModel> createTodo(TodoItemModel todo) async {
    try {
      final docRef = await _firestore
          .collection('todos')
          .add(todo.toFirestore());
      final docSnapshot = await docRef.get();
      return TodoItemModel.fromFirestore(docSnapshot);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<TodoItemModel> updateTodo(TodoItemModel todo) async {
    await _firestore
        .collection('todos')
        .doc(todo.id)
        .update(todo.toFirestore());
    return todo;
  }

  @override
  Future<void> deleteTodo(String id) async {
    await _firestore.collection('todos').doc(id).delete();
  }

  @override
  Future<TodoItemModel> toggleTodoComplete(String id) async {
    final docRef = _firestore.collection('todos').doc(id);
    final docSnapshot = await docRef.get();

    if (!docSnapshot.exists) {
      throw Exception('Todo not found');
    }

    final currentTodo = TodoItemModel.fromFirestore(docSnapshot);
    final updatedTodo = currentTodo.copyWith(
      isCompleted: !currentTodo.isCompleted,
    );

    await docRef.update({
      'isCompleted': updatedTodo.isCompleted,
      'updatedAt': FieldValue.serverTimestamp(),
    });

    return updatedTodo;
  }
}
