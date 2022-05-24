import '../models/person.dart';

abstract class IPersonRepository {
  // get all persons
  Future<List<Person>> getAllPersons();

  // insert a perosn
  Future<void> insert(Person person);

  // delete a perosn
  Future<void> delete(Person person);

  // update a perosn
  Future<void> update(Person person);
}
