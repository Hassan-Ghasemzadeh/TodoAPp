import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hemend/debug/developer_tools.dart';

import '../../data/models/task.dart';
import '../../domain/repositories/base_task_impl.dart';
import '../../domain/usecases/add_task_usecase.dart';
import '../../domain/usecases/get_all_task_usecase.dart';
import '../../domain/usecases/remove_task_usecase.dart';
import '../../domain/usecases/update_task_usecase.dart';
import '../../injector.dart';

part 'homebloc_dart_event.dart';
part 'homebloc_dart_state.dart';

class HomeBloc extends Bloc<HomeblocEvent, HomeblocState> {
  final TaskRepositoryImpl repo = injector<TaskRepositoryImpl>();
  // update usecase
  UpdateTaskUseCases get update => UpdateTaskUseCases(repo);

// remove usecase
  RemoveTaskUseCases get remove => RemoveTaskUseCases(repo);

// insert usecase
  AddTaskUseCase get insert => AddTaskUseCase(repo);

  GetAllPersonUsecase get getAllPerson => GetAllPersonUsecase(repo);

  // update person
  HomeBloc() : super(const AllPersonsState()) {
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
          emit(AllPersonsState(tasks: data!));
        },
        onError: (error) {
          result.log();
        },
      );
    });
    //---------------------------------------------
  }
}
