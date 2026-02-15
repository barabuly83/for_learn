import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo_item.freezed.dart';
part 'todo_item.g.dart';

@freezed
abstract class TodoItem with _$TodoItem {
  const factory TodoItem({
    required String id,
    required String title,
    required String description,
    required String userId,
    @Default(false) bool isCompleted,
    @Default(0) int order,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _TodoItem;

  factory TodoItem.fromJson(Map<String, dynamic> json) =>
      _$TodoItemFromJson(json);
}
