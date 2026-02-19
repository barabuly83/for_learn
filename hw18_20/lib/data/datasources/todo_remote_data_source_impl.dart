import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

import 'todo_remote_data_source.dart';
import '../models/todo_item_model.dart';

class TodoRemoteDataSourceImpl implements TodoRemoteDataSource {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<List<TodoItemModel>> getTodos(String userId) async {
    try {
      debugPrint(
        '🔥 TodoRemoteDataSourceImpl: Querying Firestore for user: $userId',
      );

      // Add timeout to prevent hanging
      final querySnapshot = await _firestore
          .collection('todos')
          .where('userId', isEqualTo: userId)
          .get()
          .timeout(const Duration(seconds: 10));

      debugPrint(
        '🔥 TodoRemoteDataSourceImpl: Found ${querySnapshot.docs.length} documents',
      );

      final todos = querySnapshot.docs
          .map((doc) => TodoItemModel.fromFirestore(doc))
          .toList();

      debugPrint(
        '🔥 TodoRemoteDataSourceImpl: Successfully parsed ${todos.length} todos',
      );

      todos.sort((a, b) => a.order.compareTo(b.order));

      debugPrint(
        '🔥 TodoRemoteDataSourceImpl: Returning ${todos.length} sorted todos',
      );
      return todos;
    } catch (e) {
      debugPrint('❌ TodoRemoteDataSourceImpl: Error fetching todos: $e');
      rethrow;
    }
  }

  @override
  Stream<List<TodoItemModel>> watchTodos(String userId) {
    debugPrint(
      '🔥 TodoRemoteDataSourceImpl: Setting up realtime listener for user: $userId',
    );

    return _firestore
        .collection('todos')
        .where('userId', isEqualTo: userId)
        .orderBy('order')
        .snapshots()
        .map((querySnapshot) {
          debugPrint(
            '🔥 TodoRemoteDataSourceImpl: Realtime update - ${querySnapshot.docs.length} documents',
          );

          final todos = querySnapshot.docs
              .map((doc) => TodoItemModel.fromFirestore(doc))
              .toList();

          debugPrint(
            '🔥 TodoRemoteDataSourceImpl: Realtime parsed ${todos.length} todos',
          );
          return todos;
        })
        .transform(
          StreamTransformer<
            List<TodoItemModel>,
            List<TodoItemModel>
          >.fromHandlers(
            handleError: (error, stackTrace, sink) {
              debugPrint(
                '❌ TodoRemoteDataSourceImpl: Realtime listener error: $error',
              );
              // Don't add anything to sink on error - let it propagate
            },
          ),
        );
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
