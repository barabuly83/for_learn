import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../bloc/auth_bloc.dart';
import '../bloc/auth_event.dart';
import '../bloc/auth_state.dart';
import '../bloc/todo_bloc.dart';
import '../bloc/todo_event.dart';
import '../bloc/todo_state.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    // Load todos when the page initializes
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<TodoBloc>().add(const LoadTodosEvent());
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, authState) {
        print('HomePage: Auth state changed: $authState');
        if (authState is Authenticated) {
          // User just signed in, load their todos
          print('HomePage: User authenticated, loading todos for user: ${authState.user.id}');
          context.read<TodoBloc>().add(const LoadTodosEvent());
        }
        // When user signs out, the UI will automatically show the "login required" message
        // due to the BlocBuilder check in the body
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Мои дела'),
          actions: [
            IconButton(
              onPressed: () {
                context.read<AuthBloc>().add(const LogoutEvent());
              },
              icon: const Icon(Icons.logout),
              tooltip: 'Выйти',
            ),
          ],
        ),
        body: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, authState) {
            if (authState is! Authenticated) {
              print('HomePage UI: User not authenticated, showing login message');
              return const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.login,
                      size: 64,
                      color: Colors.grey,
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Необходимо войти в систему',
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                  ],
                ),
              );
            }

            return BlocBuilder<TodoBloc, TodoState>(
              builder: (context, state) {
            if (state is TodoLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is TodosLoaded) {
              if (state.todos.isEmpty) {
                return const Center(
                  child: Text(
                    'У вас пока нет задач\nНажмите + чтобы добавить первую',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                );
              }
              return ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: state.todos.length,
                itemBuilder: (context, index) {
                  final todo = state.todos[index];
                  return Card(
                    margin: const EdgeInsets.only(bottom: 8),
                    child: ListTile(
                      title: Text(
                        todo.title,
                        style: TextStyle(
                          decoration: todo.isCompleted
                              ? TextDecoration.lineThrough
                              : null,
                          color: todo.isCompleted ? Colors.grey : null,
                        ),
                      ),
                      subtitle: Text(todo.description),
                      trailing: Checkbox(
                        value: todo.isCompleted,
                        onChanged: (value) {
                          if (value != null) {
                            context.read<TodoBloc>().add(ToggleTodoCompleteEvent(todoId: todo.id));
                          }
                        },
                      ),
                    ),
                  );
                },
              );
            } else if (state is TodoError) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.error_outline,
                      size: 64,
                      color: Colors.red,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Ошибка загрузки задач:\n${state.message}',
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.red),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        context.read<TodoBloc>().add(const LoadTodosEvent());
                      },
                      child: const Text('Повторить'),
                    ),
                  ],
                ),
              );
            }
            return const Center(child: Text('Загрузка задач...'));
          },
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            context.go('/add-todo');
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}