import 'package:hemend/object_controllers/data_snap_handler/data_snap_handler.dart';
import 'package:todoappflutter/src/data/models/person.dart';

class PersonDataSource {
  List<Person> persons = [];
  PersonDataSource.empty();

  Future<DataSnapHandler<List<Person>>> getAllPersons() async {
    return DataSnapHandler.done(data: persons);
  }

  Future<DataSnapHandler<void>> addPerson(Person person) async {
    return DataSnapHandler.done(data: persons.add(person));
  }

  Future<DataSnapHandler<bool>> deletePerson(Person person) async {
    return DataSnapHandler.done(data: persons.remove(person));
  }

  Future<DataSnapHandler<void>> updatePerson(Person person) async {
    return DataSnapHandler.done(data: persons.add(person));
  }
}
