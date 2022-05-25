import 'package:flutter_test/flutter_test.dart';
import 'package:hemend/object_controllers/data_snap_handler/data_snap_handler.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:todoappflutter/src/data/models/task.dart';
import 'package:todoappflutter/src/domain/repositories/base_task_impl.dart';
import 'package:todoappflutter/src/domain/usecases/add_task_usecase.dart';
import 'package:todoappflutter/src/domain/usecases/get_all_task_usecase.dart';
import 'package:todoappflutter/src/domain/usecases/remove_task_usecase.dart';
import 'package:todoappflutter/src/domain/usecases/update_task_usecase.dart';
import 'use_case_test.mocks.dart';

@GenerateMocks([TaskRepositoryImpl])
void main() {
  group('use case test', () {
    final repo = MockPersonRepositoryImpl();
//------------------------------------------------------
    setUp(() {
      when(
        repo.delete(argThat(isNotNull)),
      ).thenAnswer(
        (realInvocation) async {
          return true;
        },
      );
      //-----------------------------------------------------
      when(
        repo.getAllPersons(),
      ).thenAnswer(
        (realInvocation) async {
          return [];
        },
      );
    }); //end of set up
//------------------------------------------------------
    test('add person test', () async {
      final insert = AddTaskUseCase(repo);

      final task = Task.unique();

      final add = await insert.invoke(task);

      expect(add.status, SnapStatus.done);

      verify(repo.insert(task));
    });

    //----------------------------------------------------

    test('remove person test', () async {
      final delete = RemoveTaskUseCases(repo);

      final person = Task.unique();

      final remove = await delete.invoke(person);

      expect(remove.status, SnapStatus.done);

      verify(repo.delete(person));
    });
    //------------------------------------------------------
    test('upadate person test', () async {
      final updateUsecase = UpdateTaskUseCases(repo);

      final person = Task.unique();

      final update = await updateUsecase.invoke(person);

      expect(update.status, SnapStatus.done);

      verify(repo.update(person));
    });
    //-----------------------------------------------------
    test('get all person test', () async {
      final getAllPerson = GetAllPersonUsecase(repo);

      final result = await getAllPerson.invoke();

      expect(result.status, SnapStatus.done);

      verify(repo.getAllPersons());
    });
  }); // end of group test
}
