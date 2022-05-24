part of 'homebloc_dart_bloc.dart';

abstract class HomeblocState extends Equatable {
  const HomeblocState();
}

class HomeblocInitial extends HomeblocState {
  @override
  List<Object?> get props => [];
}

class AllPersonsState extends HomeblocState {
  final List<Person> persons;

  const AllPersonsState(this.persons);

  @override
  List<Object?> get props => [persons];
}
