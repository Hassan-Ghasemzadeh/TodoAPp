import 'package:hemend/object_controllers/data_snap_handler/data_snap_handler.dart';
import 'package:todoappflutter/src/injector.dart';

import '../../data/models/person.dart';
import '../repositories/base_person_impl.dart';

class RemovePersonUseCases {
  final PersonRepositoryImpl model = injector<PersonRepositoryImpl>();

  Future<DataSnapHandler<void>> invoke(Person person) async {
    return model.delete(person);
  }
}
