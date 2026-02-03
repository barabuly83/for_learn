// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TodoStore on TodoStoreBase, Store {
  Computed<int>? _$taskCountComputed;

  @override
  int get taskCount => (_$taskCountComputed ??= Computed<int>(
    () => super.taskCount,
    name: 'TodoStoreBase.taskCount',
  )).value;
  Computed<int>? _$completedTaskCountComputed;

  @override
  int get completedTaskCount => (_$completedTaskCountComputed ??= Computed<int>(
    () => super.completedTaskCount,
    name: 'TodoStoreBase.completedTaskCount',
  )).value;

  late final _$tasksAtom = Atom(name: 'TodoStoreBase.tasks', context: context);

  @override
  ObservableList<Task> get tasks {
    _$tasksAtom.reportRead();
    return super.tasks;
  }

  @override
  set tasks(ObservableList<Task> value) {
    _$tasksAtom.reportWrite(value, super.tasks, () {
      super.tasks = value;
    });
  }

  late final _$TodoStoreBaseActionController = ActionController(
    name: 'TodoStoreBase',
    context: context,
  );

  @override
  void addTask(String title) {
    final _$actionInfo = _$TodoStoreBaseActionController.startAction(
      name: 'TodoStoreBase.addTask',
    );
    try {
      return super.addTask(title);
    } finally {
      _$TodoStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeTask(Task task) {
    final _$actionInfo = _$TodoStoreBaseActionController.startAction(
      name: 'TodoStoreBase.removeTask',
    );
    try {
      return super.removeTask(task);
    } finally {
      _$TodoStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleTask(Task task) {
    final _$actionInfo = _$TodoStoreBaseActionController.startAction(
      name: 'TodoStoreBase.toggleTask',
    );
    try {
      return super.toggleTask(task);
    } finally {
      _$TodoStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearAllTasks() {
    final _$actionInfo = _$TodoStoreBaseActionController.startAction(
      name: 'TodoStoreBase.clearAllTasks',
    );
    try {
      return super.clearAllTasks();
    } finally {
      _$TodoStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
tasks: ${tasks},
taskCount: ${taskCount},
completedTaskCount: ${completedTaskCount}
    ''';
  }
}
