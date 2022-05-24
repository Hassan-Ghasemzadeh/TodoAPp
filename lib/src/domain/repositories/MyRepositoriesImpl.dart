import 'package:todoappflutter/src/data/models/Person.dart';
import 'package:todoappflutter/src/data/repositories/IPersonRepository.dart';
import 'package:todoappflutter/src/domain/entities/PersonsModel.dart';
import 'package:todoappflutter/src/injector.dart';

class PersonRepositoryImpl implements IPersonRepository {

  // inject our PersonModel from injector.dart
  final PersonModel model = injector<PersonModel>();

 // these are our overriden functions we talk about them before
  @override
  Future<void> delete(Person person) async {
    model.DeletePerson(person);
  }

  @override
  Future<List<Person>> getAllPersons() async {
    final person = await model.getAllPersons();
    return person;
  }

  @override
  Future<void> insert(Person person) async {
    model.AddPerson(person);
  }

  @override
  Future<void> update(Person person) async {
    model.UpdatePerson(person);
  }

  // end of overriden functions
}
