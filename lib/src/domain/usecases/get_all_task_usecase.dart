import 'package:hemend/object_controllers/data_snap_handler/data_snap_handler.dart';

import '../../core/utils/usecase/usecase_with_no_param.dart';
import '../../data/models/task.dart';
import '../repositories/base_task_impl.dart';

class GetAllPersonUsecase extends UseCase<List<Task>> {
  final TaskRepositoryImpl model;

  GetAllPersonUsecase(this.model);

  @override
  Future<DataSnapHandler<List<Task>>> invoke() async {
    try {
      final result = await model.getAllPersons();
      return DataSnapHandler.done(data: result);
    } catch (e, st) {
      return DataSnapHandler.error(exception: e, sender: st);
    }
  }
}
