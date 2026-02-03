import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'stores/todo_store.dart';
import 'widgets/add_task_widget.dart';
import 'widgets/task_counter_widget.dart';
import 'widgets/task_list_widget.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [Provider<TodoStore>(create: (_) => TodoStore())],
      child: MaterialApp(
        title: 'To-Do List with MobX',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          useMaterial3: true,
        ),
        home: const TodoListPage(),
      ),
    );
  }
}

class TodoListPage extends StatelessWidget {
  const TodoListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('To-Do List'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TaskCounterWidget(),
            SizedBox(height: 16),
            AddTaskWidget(),
            SizedBox(height: 16),
            TaskListWidget(),
          ],
        ),
      ),
    );
  }
}
