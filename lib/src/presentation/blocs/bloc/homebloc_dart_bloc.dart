import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hemend/debug/developer_tools.dart';
import 'package:todoappflutter/src/data/models/person.dart';
import 'package:todoappflutter/src/domain/usecases/add_person_usecase.dart';
import 'package:todoappflutter/src/domain/usecases/get_all_person_usecase.dart';
import 'package:todoappflutter/src/domain/usecases/remove_person_usecase.dart';
import 'package:todoappflutter/src/domain/usecases/update_person_usecase.dart';
part 'homebloc_dart_event.dart';
part 'homebloc_dart_state.dart';

class HomeBloc extends Bloc<HomeblocEvent, HomeblocState> {
  // update usecase
  UpdatePersonUseCases get update => UpdatePersonUseCases();

// remove usecase
  RemovePersonUseCases get remove => RemovePersonUseCases();

// insert usecase
  AddPersonUseCase get insert => AddPersonUseCase();

  GetAllPersonUsecase get getAllPerson => GetAllPersonUsecase();

  // update person
  HomeBloc() : super(HomeblocInitial()) {
    on<UpdatePerson>((event, emit) {
      update.invoke(event.person);
    });
//---------------------------------------------
// remove person
    on<RemovePerson>(((event, emit) {
      remove.invoke(event.person);
    }));
//---------------------------------------------
// insert person
    on<InsertPerson>(((event, emit) {
      insert.invoke(event.person);
    }));
//---------------------------------------------
//get all person
    on<GetAllPerson>(((event, emit) async {
      final result = await getAllPerson.invoke();
      result.singleActOnFinished(onDone: (data) {
        emit(AllPersonsState(data!));
      }, onError: (error) {
        error?.log();
      });
    }));
    //---------------------------------------------
  }
}
