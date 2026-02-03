import 'package:mobx/mobx.dart';
import '../models/task.dart';

part 'todo_store.g.dart';

class TodoStore = TodoStoreBase with _$TodoStore;

abstract class TodoStoreBase with Store {
  TodoStoreBase();

  @observable
  ObservableList<Task> tasks = ObservableList<Task>();

  @computed
  int get taskCount => tasks.length;

  @computed
  int get completedTaskCount => tasks.where((task) => task.isCompleted).length;

  @action
  void addTask(String title) {
    if (title.trim().isNotEmpty) {
      final task = Task(title.trim());
      tasks.add(task);
    }
  }

  @action
  void removeTask(Task task) {
    tasks.remove(task);
  }

  @action
  void toggleTask(Task task) {
    task.toggleCompleted();
  }

  @action
  void clearAllTasks() {
    tasks.clear();
  }
}
