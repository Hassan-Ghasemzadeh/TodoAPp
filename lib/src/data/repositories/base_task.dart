import '../models/task.dart';

abstract class ITaskRepository {
  // get all persons
  Future<List<Task>> getAllPersons();

  // insert a perosn
  Future<void> insert(Task task);

  // delete a perosn
  Future<void> delete(Task task);

  // update a perosn
  Future<void> update(Task task);
}
