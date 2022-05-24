import 'package:hemend/object_controllers/data_snap_handler/data_snap_handler.dart';

import '../../data/models/person.dart';
import '../../injector.dart';
import '../repositories/base_person_impl.dart';

class GetAllPersonUsecase {
  final PersonRepositoryImpl model = injector<PersonRepositoryImpl>();

  Future<DataSnapHandler<List<Person>>> invoke() async {
    return model.getAllPersons();
  }
}
