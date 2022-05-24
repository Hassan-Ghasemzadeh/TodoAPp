import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hemend/debug/developer_tools.dart';

import '../../../data/models/person.dart';
import '../../../domain/repositories/base_person_impl.dart';
import '../../../domain/usecases/add_person_usecase.dart';
import '../../../domain/usecases/get_all_person_usecase.dart';
import '../../../domain/usecases/remove_person_usecase.dart';
import '../../../domain/usecases/update_person_usecase.dart';
import '../../../injector.dart';

part 'homebloc_dart_event.dart';
part 'homebloc_dart_state.dart';

class HomeBloc extends Bloc<HomeblocEvent, HomeblocState> {
  final PersonRepositoryImpl repo = injector<PersonRepositoryImpl>();
  // update usecase
  UpdatePersonUseCases get update => UpdatePersonUseCases(repo);

// remove usecase
  RemovePersonUseCases get remove => RemovePersonUseCases(repo);

// insert usecase
  AddPersonUseCase get insert => AddPersonUseCase(repo);

  GetAllPersonUsecase get getAllPerson => GetAllPersonUsecase(repo);

  // update person
  HomeBloc() : super(HomeblocInitial()) {
    on<UpdatePerson>((event, emit) {
      update.invoke(event.person);
    });
//---------------------------------------------
// remove person
    on<RemovePerson>(
      (event, emit) {
        remove.invoke(event.person);
      },
    );
//---------------------------------------------
// insert person
    on<InsertPerson>(
      (event, emit) {
        insert.invoke(event.person);
      },
    );
//---------------------------------------------
//get all person
    on<GetAllPerson>((event, emit) async {
      final result = await getAllPerson.invoke();
      result.singleActOnFinished(
        onDone: (data) {
          emit(AllPersonsState(data!));
        },
        onError: (error) {
          result.log();
        },
      );
    });
    //---------------------------------------------
  }
}
