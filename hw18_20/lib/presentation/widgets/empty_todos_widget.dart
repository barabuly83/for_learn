import 'package:flutter/material.dart';

class EmptyTodosWidget extends StatelessWidget {
  const EmptyTodosWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'У вас пока нет задач\nНажмите + чтобы добавить первую',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 16, color: Colors.grey),
      ),
    );
  }
}
