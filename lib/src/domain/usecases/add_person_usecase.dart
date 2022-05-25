import 'package:hemend/object_controllers/data_snap_handler/data_snap_handler.dart';
import '../../data/models/person.dart';
import '../repositories/base_person_impl.dart';

class AddPersonUseCase {
  final PersonRepositoryImpl model;

  AddPersonUseCase(this.model);

  Future<DataSnapHandler<void>> invoke(Person person) async {
    try {
      await model.insert(person);
      return const DataSnapHandler.done(data: null);
    } catch (e, st) {
      return DataSnapHandler.error(exception: e, sender: st);
    }
  }
}
