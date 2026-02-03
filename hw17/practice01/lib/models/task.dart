import 'package:mobx/mobx.dart';

part 'task.g.dart';

class Task = TaskBase with _$Task;

abstract class TaskBase with Store {
  TaskBase(this.title);

  @observable
  String title;

  @observable
  bool isCompleted = false;

  @action
  void toggleCompleted() {
    isCompleted = !isCompleted;
  }
}
