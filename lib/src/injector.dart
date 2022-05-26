import 'package:get_it/get_it.dart';
import 'domain/entities/task_datasource.dart';
import 'domain/repositories/base_task_impl.dart';

GetIt get injector => GetIt.instance;

void setUp() {
  injector.registerSingleton<TaskDataSource>(TaskDataSource.empty());
  injector.registerSingleton<TaskRepositoryImpl>(TaskRepositoryImpl());
}
