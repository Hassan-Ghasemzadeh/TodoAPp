import 'package:hemend/object_controllers/data_snap_handler/data_snap_handler.dart';
import 'package:todoappflutter/src/domain/repositories/base_person_impl.dart';

import '../../data/models/person.dart';
import '../../injector.dart';
import '../entities/person_datasource.dart';

class AddPersonUseCase {
  final PersonRepositoryImpl model = injector<PersonRepositoryImpl>();

  Future<DataSnapHandler<void>> invoke(Person person) async {
    return model.insert(person);
  }
}
