import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../l10n/app_localizations.dart';

import '../bloc/auth_bloc.dart';
import '../bloc/auth_state.dart';
import '../bloc/todo_bloc.dart';
import '../bloc/todo_event.dart';
import '../bloc/todo_state.dart';
import '../widgets/empty_todos_widget.dart';
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
    // Don't load todos immediately - wait for auth state confirmation
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is Authenticated) {
          context.read<TodoBloc>().add(const LoadTodosEvent());
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.myTasks),
          actions: [
            // Simple profile button - authentication is handled by router
            IconButton(
              icon: const Icon(Icons.account_circle),
              onPressed: () => context.go('/profile'),
            ),
            // Logout button removed for now
          ],
        ),
        body: BlocBuilder<TodoBloc, TodoState>(
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
                    onEdit: () {
                      context.go('/edit-todo/${todo.id}');
                    },
                    onDelete: () {
                      context.read<TodoBloc>().add(
                        DeleteTodoEvent(todoId: todo.id),
                      );
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
            return Center(child: Text(AppLocalizations.of(context)!.loadingTasks));
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
