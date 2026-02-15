import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:reorderables/reorderables.dart';

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
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    // Load todos when the page initializes if user is already authenticated
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final authBloc = context.read<AuthBloc>();
      debugPrint(
        '🏠 HomePage: initState - Auth state: ${authBloc.state.runtimeType}',
      );
      if (authBloc.state is Authenticated) {
        debugPrint('🏠 HomePage: User already authenticated, loading todos');
        context.read<TodoBloc>().add(const LoadTodosEvent());
      } else {
        debugPrint(
          '🏠 HomePage: User not authenticated, waiting for auth state change',
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        debugPrint(
          '🏠 HomePage: BlocListener received state: ${state.runtimeType}',
        );
        if (state is Authenticated) {
          debugPrint(
            '🏠 HomePage: User authenticated via BlocListener, loading todos',
          );
          context.read<TodoBloc>().add(const LoadTodosEvent());
        } else if (state is AuthFailureState) {
          debugPrint(
            '🏠 HomePage: Auth failure received: ${state.failure.code}',
          );
        } else if (state is AvatarUpdatedSuccess) {
          debugPrint('🏠 HomePage: Avatar updated successfully');
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
              return CustomScrollView(
                controller: _scrollController,
                slivers: [
                  SliverPadding(
                    padding: const EdgeInsets.all(16),
                    sliver: ReorderableSliverList(
                      delegate: ReorderableSliverChildBuilderDelegate((
                        context,
                        index,
                      ) {
                        final todo = state.todos[index];
                        return TodoItemWidget(
                          key: ValueKey(todo.id),
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
                      }, childCount: state.todos.length),
                      onReorder: (oldIndex, newIndex) {
                        context.read<TodoBloc>().add(
                          ReorderTodosEvent(
                            oldIndex: oldIndex,
                            newIndex: newIndex,
                          ),
                        );
                      },
                    ),
                  ),
                ],
              );
            } else if (state is TodoError) {
              return TodoErrorWidget(
                message: state.message,
                onRetry: () {
                  context.read<TodoBloc>().add(const LoadTodosEvent());
                },
              );
            }
            return Center(
              child: Text(AppLocalizations.of(context)!.loadingTasks),
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

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
