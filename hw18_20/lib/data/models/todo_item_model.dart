import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/todo_item.dart';

part 'todo_item_model.freezed.dart';
part 'todo_item_model.g.dart';

@freezed
abstract class TodoItemModel with _$TodoItemModel {
  const factory TodoItemModel({
    required String id,
    required String title,
    required String description,
    required String userId,
    @Default(false) bool isCompleted,
    @Default(0) int order,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _TodoItemModel;

  const TodoItemModel._();

  factory TodoItemModel.fromJson(Map<String, dynamic> json) =>
      _$TodoItemModelFromJson(json);

  /// Convert to domain entity
  TodoItem toEntity() {
    return TodoItem(
      id: id,
      title: title,
      description: description,
      userId: userId,
      isCompleted: isCompleted,
      order: order,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }

  /// Create from domain entity
  factory TodoItemModel.fromEntity(TodoItem todo) {
    return TodoItemModel(
      id: todo.id,
      title: todo.title,
      description: todo.description,
      userId: todo.userId,
      isCompleted: todo.isCompleted,
      order: todo.order,
      createdAt: todo.createdAt,
      updatedAt: todo.updatedAt,
    );
  }

  /// Create from Firestore document
  factory TodoItemModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return TodoItemModel(
      id: doc.id,
      title: data['title'] as String,
      description: data['description'] as String,
      userId: data['userId'] as String,
      isCompleted: data['isCompleted'] as bool? ?? false,
      order: data['order'] as int? ?? 0,
      createdAt: (data['createdAt'] as Timestamp?)?.toDate(),
      updatedAt: (data['updatedAt'] as Timestamp?)?.toDate(),
    );
  }

  /// Convert to Firestore data
  Map<String, dynamic> toFirestore() {
    return {
      'title': title,
      'description': description,
      'userId': userId,
      'isCompleted': isCompleted,
      'order': order,
      'createdAt': createdAt != null
          ? Timestamp.fromDate(createdAt!)
          : FieldValue.serverTimestamp(),
      'updatedAt': FieldValue.serverTimestamp(),
    };
  }
}
