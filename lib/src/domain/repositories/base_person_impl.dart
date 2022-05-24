import '../../data/models/person.dart';
import '../../data/repositories/base_person.dart';
import '../../injector.dart';
import '../entities/person_datasource.dart';

class PersonRepositoryImpl implements IPersonRepository {
  // inject our PersonModel from injector.dart
  final PersonDataSource model = injector<PersonDataSource>();

  // these are our overriden functions we talk about them before
  @override
  Future<bool> delete(Person person) async {
    return model.deletePerson(person);
  }

  @override
  Future<List<Person>> getAllPersons() async {
    return model.getAllPersons();
  }

  @override
  Future<void> insert(Person person) async {
    return model.addPerson(person);
  }

  @override
  Future<void> update(Person person) async {
    return model.updatePerson(person);
  }
  // end of overriden functions
}
