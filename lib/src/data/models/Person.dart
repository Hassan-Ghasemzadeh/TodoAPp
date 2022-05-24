import 'package:equatable/equatable.dart';

class Person extends Equatable {
  String name;
  String last;
  int age;

  Person({this.name = "", this.last = "", this.age = 0});

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
    last = last;
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
