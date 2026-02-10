import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../core/error/failures.dart';
import '../../core/usecase/usecase.dart';
import '../entities/todo_item.dart';
import '../repositories/todo_repository.dart';

class ToggleTodoCompleteParams extends Equatable {
  const ToggleTodoCompleteParams({
    required this.id,
  });

  final String id;

  @override
  List<Object?> get props => [id];
}

class ToggleTodoComplete implements UseCase<TodoItem, ToggleTodoCompleteParams> {
  const ToggleTodoComplete(this.repository);

  final TodoRepository repository;

  @override
  Future<Either<Failure, TodoItem>> call(ToggleTodoCompleteParams params) async {
    return await repository.toggleTodoComplete(params.id);
  }
}