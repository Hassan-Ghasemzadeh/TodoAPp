import 'package:hemend/object_controllers/data_snap_handler/data_snap_handler.dart';

import '../../core/utils/usecase/usecase.dart';
import '../../data/models/task.dart';
import '../repositories/base_task_impl.dart';

class RemoveTaskUseCases extends UseCase<bool, Task> {
  final TaskRepositoryImpl model;

  RemoveTaskUseCases(this.model);

  @override
  Future<DataSnapHandler<bool>> invoke(Task task) async {
    try {
      final b = await model.delete(task);
      return DataSnapHandler.done(data: b);
    } catch (e, st) {
      return DataSnapHandler.error(exception: e, sender: st);
    }
  }
}
