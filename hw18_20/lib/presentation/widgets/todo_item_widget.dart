import 'package:flutter/material.dart';

import '../../domain/entities/todo_item.dart';

class TodoItemWidget extends StatelessWidget {
  final TodoItem todo;
  final ValueChanged<bool?> onToggleComplete;

  const TodoItemWidget({
    super.key,
    required this.todo,
    required this.onToggleComplete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        title: Text(
          todo.title,
          style: TextStyle(
            decoration: todo.isCompleted ? TextDecoration.lineThrough : null,
            color: todo.isCompleted ? Colors.grey : null,
          ),
        ),
        subtitle: Text(todo.description),
        trailing: Checkbox(
          value: todo.isCompleted,
          onChanged: onToggleComplete,
        ),
      ),
    );
  }
}
