import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/todo_item.dart';

part 'todo_state.freezed.dart';

@freezed
abstract class TodoState with _$TodoState {
  const factory TodoState.initial() = TodoInitial;

  const factory TodoState.loading() = TodoLoading;

  const factory TodoState.created(TodoItem todo) = TodoCreated;

  const factory TodoState.error(String message) = TodoError;

  const factory TodoState.loaded(List<TodoItem> todos) = TodosLoaded;

  const factory TodoState.deleted(String todoId) = TodoDeleted;

  const factory TodoState.updated(TodoItem todo) = TodoUpdated;
}
