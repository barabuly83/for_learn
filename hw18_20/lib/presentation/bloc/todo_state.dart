import 'package:equatable/equatable.dart';

import '../../domain/entities/todo_item.dart';

abstract class TodoState extends Equatable {
  const TodoState();

  @override
  List<Object?> get props => [];
}

class TodoInitial extends TodoState {}

class TodoLoading extends TodoState {}

class TodoCreated extends TodoState {
  const TodoCreated(this.todo);

  final TodoItem todo;

  @override
  List<Object?> get props => [todo];
}

class TodoError extends TodoState {
  const TodoError(this.message);

  final String message;

  @override
  List<Object?> get props => [message];
}

class TodosLoaded extends TodoState {
  const TodosLoaded(this.todos);

  final List<TodoItem> todos;

  @override
  List<Object?> get props => [todos];
}

class TodoDeleted extends TodoState {
  const TodoDeleted(this.todoId);

  final String todoId;

  @override
  List<Object?> get props => [todoId];
}

class TodoUpdated extends TodoState {
  const TodoUpdated(this.todo);

  final TodoItem todo;

  @override
  List<Object?> get props => [todo];
}
