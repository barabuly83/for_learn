import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../bloc/auth_bloc.dart';
import '../bloc/auth_event.dart';
import '../bloc/auth_state.dart';
import '../bloc/todo_bloc.dart';
import '../bloc/todo_event.dart';
import '../bloc/todo_state.dart';
import '../widgets/empty_todos_widget.dart';
import '../widgets/login_required_widget.dart';
import '../widgets/todo_error_widget.dart';
import '../widgets/todo_item_widget.dart';

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
          print(
            'HomePage: User authenticated, loading todos for user: ${authState.user.id}',
          );
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
              print(
                'HomePage UI: User not authenticated, showing login message',
              );
              return const LoginRequiredWidget();
            }

            return BlocBuilder<TodoBloc, TodoState>(
              builder: (context, state) {
                if (state is TodoLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is TodosLoaded) {
                  if (state.todos.isEmpty) {
                    return const EmptyTodosWidget();
                  }
                  return ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: state.todos.length,
                    itemBuilder: (context, index) {
                      final todo = state.todos[index];
                      return TodoItemWidget(
                        todo: todo,
                        onToggleComplete: (value) {
                          if (value != null) {
                            context.read<TodoBloc>().add(
                              ToggleTodoCompleteEvent(todoId: todo.id),
                            );
                          }
                        },
                      );
                    },
                  );
                } else if (state is TodoError) {
                  return TodoErrorWidget(
                    message: state.message,
                    onRetry: () {
                      context.read<TodoBloc>().add(const LoadTodosEvent());
                    },
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
