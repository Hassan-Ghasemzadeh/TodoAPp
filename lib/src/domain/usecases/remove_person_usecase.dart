import 'package:hemend/object_controllers/data_snap_handler/data_snap_handler.dart';

import '../../data/models/person.dart';
import '../repositories/base_person_impl.dart';

class RemovePersonUseCases {
  final PersonRepositoryImpl model;

  RemovePersonUseCases(this.model);

  Future<DataSnapHandler<bool>> invoke(Person person) async {
    try {
      final b = await model.delete(person);
      return DataSnapHandler.done(data: b);
    } catch (e, st) {
      return DataSnapHandler.error(exception: e, sender: st);
    }
  }
}
