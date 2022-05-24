import 'package:equatable/equatable.dart';

class Person extends Equatable {
  String name;
  String Last;
  int age;

  Person({this.name = "", this.Last = "", this.age = 0});

  String get getName {
    return this.name;
  }

  set setName(String name) {
    this.name = name;
  }

  String get getLast {
    return this.Last;
  }

  set setLast(String last) {
    this.Last = last;
  }

  int get getAge {
    return this.age;
  }

  set setAge(int age) {
    this.age = age;
  }

  @override
  List<Object?> get props => [name, Last, age];
}
