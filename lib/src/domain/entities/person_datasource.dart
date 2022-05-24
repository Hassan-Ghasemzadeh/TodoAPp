import '../../data/models/person.dart';

class PersonDataSource {
  List<Person> persons = [];
  PersonDataSource.empty();

  Future<List<Person>> getAllPersons() async {
    return persons;
  }

  Future<void> addPerson(Person person) async {
    persons.add(person);
  }

  Future<bool> deletePerson(Person person) async {
    return persons.remove(person);
  }

  Future<void> updatePerson(Person person) async {
    persons.add(person);
  }
}
