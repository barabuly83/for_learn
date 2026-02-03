import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import '../stores/todo_store.dart';

class TaskListWidget extends StatelessWidget {
  const TaskListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final todoStore = Provider.of<TodoStore>(context);

    return Expanded(
      child: Observer(
        builder: (_) => todoStore.tasks.isEmpty
            ? const Center(
                child: Text(
                  'Нет задач. Добавьте первую!',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              )
            : ListView.builder(
                itemCount: todoStore.tasks.length,
                itemBuilder: (context, index) {
                  final task = todoStore.tasks[index];
                  return Observer(
                    builder: (_) => Card(
                      margin: const EdgeInsets.only(bottom: 8),
                      child: ListTile(
                        leading: Checkbox(
                          value: task.isCompleted,
                          onChanged: (_) => todoStore.toggleTask(task),
                        ),
                        title: Text(
                          task.title,
                          style: TextStyle(
                            decoration: task.isCompleted
                                ? TextDecoration.lineThrough
                                : null,
                            color: task.isCompleted ? Colors.grey : null,
                          ),
                        ),
                        trailing: IconButton(
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                          onPressed: () => todoStore.removeTask(task),
                        ),
                        onTap: () => todoStore.toggleTask(task),
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}