part of 'homebloc_dart_bloc.dart';

abstract class HomeblocState extends Equatable {
  const HomeblocState();
}

class HomeblocInitial extends HomeblocState {
  @override
  List<Object?> get props => [];
}

class AllPersonsState extends HomeblocState {
  final List<Task> tasks;

  const AllPersonsState(this.tasks);

  @override
  List<Object?> get props => [tasks];
}
