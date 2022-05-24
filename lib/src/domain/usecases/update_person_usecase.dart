import 'package:hemend/object_controllers/data_snap_handler/data_snap_handler.dart';

import '../../data/models/person.dart';
import '../repositories/base_person_impl.dart';

class UpdatePersonUseCases {
  final PersonRepositoryImpl model;

  UpdatePersonUseCases(this.model);

  Future<DataSnapHandler<void>> invoke(Person person) async {
    try {
      await model.update(person);
      return const DataSnapHandler.done(data: null);
    } catch (e, st) {
      return DataSnapHandler.error(exception: e, sender: st);
    }
  }
}
