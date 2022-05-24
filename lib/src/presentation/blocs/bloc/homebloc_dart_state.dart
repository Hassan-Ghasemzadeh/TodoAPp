part of 'homebloc_dart_bloc.dart';

abstract class HomeblocDartState extends Equatable {
  const HomeblocDartState();

  @override
  List<Object> get props => [];
}

class HomeblocInitial extends HomeblocDartState {}
