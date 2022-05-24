import 'package:equatable/equatable.dart';

class PersonEntity extends Equatable {
  String name;
  String last;
  int age;

  PersonEntity({
    required this.name,
    required this.last,
    required this.age,
  });

  @override
  List<Object?> get props => [name, last, age];
}
