import 'package:hemend/object_controllers/data_snap_handler/data_snap_handler.dart';
import 'package:todoappflutter/src/data/models/person.dart';
import 'package:todoappflutter/src/data/repositories/base_person.dart';
import 'package:todoappflutter/src/domain/entities/person_datasource.dart';
import 'package:todoappflutter/src/injector.dart';

class PersonRepositoryImpl implements IPersonRepository {
  // inject our PersonModel from injector.dart
  final PersonDataSource model = injector<PersonDataSource>();

  // these are our overriden functions we talk about them before
  @override
  Future<DataSnapHandler<void>> delete(Person person) async {
    return await model.deletePerson(person);
  }

  @override
  Future<DataSnapHandler<List<Person>>> getAllPersons() async {
    return await model.getAllPersons();
  }

  @override
  Future<DataSnapHandler<void>> insert(Person person) async {
    return await model.addPerson(person);
  }

  @override
  Future<DataSnapHandler<void>> update(Person person) async {
    return await model.updatePerson(person);
  }
  // end of overriden functions
}
