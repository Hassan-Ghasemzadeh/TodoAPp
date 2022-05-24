import 'package:hemend/object_controllers/data_snap_handler/data_snap_handler.dart';

import '../../data/models/person.dart';
import '../repositories/base_person_impl.dart';

class GetAllPersonUsecase {
  final PersonRepositoryImpl model;

  GetAllPersonUsecase(this.model);

  Future<DataSnapHandler<List<Person>>> invoke() async {
    try {
      final result = await model.getAllPersons();
      return DataSnapHandler.done(data: result);
    } catch (e, st) {
      return DataSnapHandler.error(exception: e, sender: st);
    }
  }
}
