import 'package:todoappflutter/src/data/models/Person.dart';

class PersonModel extends Person {
  final List<Person> persons = [];

  PersonModel.empty() {
    name = "";
    age = 0;
    Last = "";
  }
  PersonModel({required super.name, required super.Last, required super.age});

  Future<List<Person>> getAllPersons() async {
    return persons;
  }

  Future<void> AddPerson(Person person) async {
    Future.delayed(const Duration(seconds: 2));
    if (!persons.contains(person)) {
      persons.add(person);
    } else {
      print("There is a person here with this info");
    }
  }

  Future<void> DeletePerson(Person person) async {
    if (persons.contains(person)) {
      persons.remove(person);
    } else {
      print("Cant't find the person...");
    }
  }

  Future<void> UpdatePerson(Person person) async {
    Future.delayed(const Duration(seconds: 2));

    if (persons.contains(person)) {
      persons.add(person);
    }
  }
}
