import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../l10n/app_localizations.dart';

import '../bloc/todo_bloc.dart';
import '../bloc/todo_event.dart';
import '../bloc/todo_state.dart';

class EditTodoPage extends StatefulWidget {
  const EditTodoPage({super.key, required this.todoId});

  final String todoId;

  @override
  State<EditTodoPage> createState() => _EditTodoPageState();
}

class _EditTodoPageState extends State<EditTodoPage> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Load the todo data when the page initializes
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadTodoData();
    });
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void _loadTodoData() {
    final currentState = context.read<TodoBloc>().state;
    if (currentState is TodosLoaded) {
      final todo = currentState.todos.firstWhere(
        (todo) => todo.id == widget.todoId,
        orElse: () => throw Exception('Todo not found'),
      );
      _titleController.text = todo.title;
      _descriptionController.text = todo.description;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TodoBloc, TodoState>(
      bloc: context.read<TodoBloc>(),
      listener: (context, state) {
        if (state is TodoUpdated) {
          // Show success message and navigate back
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(AppLocalizations.of(context)!.taskUpdated)),
          );
          context.go('/home');
        } else if (state is TodoError) {
          // Show error message
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                '${AppLocalizations.of(context)!.taskUpdateError}: ${state.message}',
              ),
            ),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(AppLocalizations.of(context)!.editTask),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => context.go('/home'),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextFormField(
                    controller: _titleController,
                    autofocus: true,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(
                      labelText: 'Название задачи',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Пожалуйста, введите название задачи';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _descriptionController,
                    keyboardType: TextInputType.multiline,
                    textInputAction: TextInputAction.newline,
                    decoration: const InputDecoration(
                      labelText: 'Описание задачи',
                      border: OutlineInputBorder(),
                    ),
                    maxLines: 3,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Пожалуйста, введите описание задачи';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 24),
                  BlocBuilder<TodoBloc, TodoState>(
                    bloc: context.read<TodoBloc>(),
                    builder: (context, state) {
                      return ElevatedButton(
                        onPressed: state is TodoLoading
                            ? null
                            : () {
                                if (_formKey.currentState!.validate()) {
                                  context.read<TodoBloc>().add(
                                    UpdateTodoEvent(
                                      todoId: widget.todoId,
                                      title: _titleController.text.trim(),
                                      description: _descriptionController.text
                                          .trim(),
                                    ),
                                  );
                                }
                              },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                        ),
                        child: state is TodoLoading
                            ? const CircularProgressIndicator()
                            : Text(AppLocalizations.of(context)!.updateTask),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
