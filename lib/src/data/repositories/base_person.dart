import 'package:hemend/object_controllers/data_snap_handler/data_snap_handler.dart';
import 'package:todoappflutter/src/data/models/person.dart';

abstract class IPersonRepository {
  // get all persons
  Future<DataSnapHandler<List<Person>>> getAllPersons();

  // insert a perosn
  Future<DataSnapHandler<void>> insert(Person person);

  // delete a perosn
  Future<DataSnapHandler<void>> delete(Person person);

  // update a perosn
  Future<DataSnapHandler<void>> update(Person person);
}
