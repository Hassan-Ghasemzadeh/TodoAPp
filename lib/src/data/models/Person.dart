import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

class Person extends Equatable {
  String name;
  String last;
  int age;
  String id;
  Person({this.name = '', this.last = '', this.age = 0, required this.id});

  factory Person.unique({String name = '', String last = '', int age = 0}) {
    final uuid = const Uuid().v4().toString();
    return Person(id: uuid, name: name, last: last, age: age);
  }

  String get getName {
    return name;
  }

  set setName(String name) {
    this.name = name;
  }

  String get getLast {
    return last;
  }

  set setLast(String last) {
    this.last = last;
  }

  int get getAge {
    return age;
  }

  set setAge(int age) {
    this.age = age;
  }

  @override
  List<Object?> get props => [name, last, age];
}
