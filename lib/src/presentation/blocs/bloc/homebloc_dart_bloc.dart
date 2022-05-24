import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'homebloc_dart_event.dart';
part 'homebloc_dart_state.dart';

class HomeBloc extends Bloc<HomeblocEvent, HomeblocState> {
  HomeBloc() : super(HomeblocInitial()) {
    on<HomeblocEvent>((event, emit) {});
  }
}
