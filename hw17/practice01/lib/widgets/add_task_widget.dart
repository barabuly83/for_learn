import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../stores/todo_store.dart';

class AddTaskWidget extends StatefulWidget {
  const AddTaskWidget({super.key});

  @override
  State<AddTaskWidget> createState() => _AddTaskWidgetState();
}

class _AddTaskWidgetState extends State<AddTaskWidget> {
  final TextEditingController _controller = TextEditingController();

  void _addTask() {
    final todoStore = Provider.of<TodoStore>(context, listen: false);
    final title = _controller.text.trim();

    if (title.isNotEmpty) {
      todoStore.addTask(title);
      _controller.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: _controller,
            onSubmitted: (_) => _addTask(),
            decoration: const InputDecoration(
              hintText: 'Введите задачу...',
              border: OutlineInputBorder(),
            ),
          ),
        ),
        const SizedBox(width: 8),
        ElevatedButton(onPressed: _addTask, child: const Text('Добавить')),
      ],
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
