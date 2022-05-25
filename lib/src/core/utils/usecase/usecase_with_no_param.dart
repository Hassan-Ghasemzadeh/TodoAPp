import 'package:hemend/object_controllers/data_snap_handler/data_snap_handler.dart';

abstract class UseCase<T> {
  Future<DataSnapHandler<T>> invoke();
}
