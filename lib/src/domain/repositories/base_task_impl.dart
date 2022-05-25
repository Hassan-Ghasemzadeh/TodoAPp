import '../../data/models/task.dart';
import '../../data/repositories/base_task.dart';
import '../../injector.dart';
import '../entities/task_datasource.dart';

class TaskRepositoryImpl implements ITaskRepository {
  // inject our PersonModel from injector.dart
  final TaskDataSource model = injector<TaskDataSource>();

  // these are our overriden functions we talk about them before
  @override
  Future<bool> delete(Task task) async {
    return model.deleteTask(task);
  }

  @override
  Future<List<Task>> getAllPersons() async {
    return model.getAllTasks();
  }

  @override
  Future<void> insert(Task task) async {
    return model.addTask(task);
  }

  @override
  Future<void> update(Task task) async {
    return model.updateTask(task);
  }
  // end of overriden functions
}
