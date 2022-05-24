part of 'homebloc_dart_bloc.dart';

abstract class HomeblocState extends Equatable {
  const HomeblocState();

  @override
  List<Object> get props => [];
}

class HomeblocInitial extends HomeblocState {}
