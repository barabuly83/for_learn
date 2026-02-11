import 'package:equatable/equatable.dart';

import '../../domain/entities/todo_item.dart';

abstract class TodoEvent extends Equatable {
  const TodoEvent();

  @override
  List<Object?> get props => [];
}

class CreateTodoEvent extends TodoEvent {
  const CreateTodoEvent({required this.title, required this.description});

  final String title;
  final String description;

  @override
  List<Object?> get props => [title, description];
}

class LoadTodosEvent extends TodoEvent {
  const LoadTodosEvent();
}

class ToggleTodoCompleteEvent extends TodoEvent {
  const ToggleTodoCompleteEvent({required this.todoId});

  final String todoId;

  @override
  List<Object?> get props => [todoId];
}

class DeleteTodoEvent extends TodoEvent {
  const DeleteTodoEvent({required this.todoId});

  final String todoId;

  @override
  List<Object?> get props => [todoId];
}

class UpdateTodoEvent extends TodoEvent {
  const UpdateTodoEvent({
    required this.todoId,
    required this.title,
    required this.description,
  });

  final String todoId;
  final String title;
  final String description;

  @override
  List<Object?> get props => [todoId, title, description];
}

class TodoErrorEvent extends TodoEvent {
  const TodoErrorEvent(this.message);

  final String message;

  @override
  List<Object?> get props => [message];
}

class ToggleTodoCompleteErrorEvent extends TodoEvent {
  const ToggleTodoCompleteErrorEvent({
    required this.todoId,
    required this.errorMessage,
  });

  final String todoId;
  final String errorMessage;

  @override
  List<Object?> get props => [todoId, errorMessage];
}

class ToggleTodoCompleteSuccessEvent extends TodoEvent {
  const ToggleTodoCompleteSuccessEvent(this.updatedTodo);

  final TodoItem updatedTodo;

  @override
  List<Object?> get props => [updatedTodo];
}

class ShowTodoErrorEvent extends TodoEvent {
  const ShowTodoErrorEvent(this.message);

  final String message;

  @override
  List<Object?> get props => [message];
}
