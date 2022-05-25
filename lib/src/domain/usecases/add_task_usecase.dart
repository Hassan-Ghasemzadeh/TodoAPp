import 'package:hemend/object_controllers/data_snap_handler/data_snap_handler.dart';
import '../../core/utils/usecase/usecase.dart';
import '../../data/models/task.dart';
import '../repositories/base_task_impl.dart';

class AddTaskUseCase extends UseCase<void, Task> {
  final TaskRepositoryImpl model;

  AddTaskUseCase(this.model);

  @override
  Future<DataSnapHandler<void>> invoke(Task task) async {
    try {
      await model.insert(task);
      return const DataSnapHandler.done(data: null);
    } catch (e, st) {
      return DataSnapHandler.error(exception: e, sender: st);
    }
  }
}
