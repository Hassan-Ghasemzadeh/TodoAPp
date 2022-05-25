import '../../data/models/task.dart';

class TaskDataSource {
  List<Task> tasks = [];
  TaskDataSource.empty();

  Future<List<Task>> getAllTasks() async {
    return tasks;
  }

  Future<void> addTask(Task task) async {
    tasks.add(task);
  }

  Future<bool> deleteTask(Task task) async {
    return tasks.remove(task);
  }

  Future<void> updateTask(Task task) async {
    tasks.add(task);
  }
}
