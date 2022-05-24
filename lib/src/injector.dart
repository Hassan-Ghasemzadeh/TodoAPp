import 'package:get_it/get_it.dart';
import 'package:todoappflutter/src/domain/entities/person_datasource.dart';
import 'package:todoappflutter/src/domain/repositories/base_person_impl.dart';

GetIt get injector => GetIt.instance;

void setUp() {
  injector.registerSingleton<PersonDataSource>(PersonDataSource.empty());
  injector.registerSingleton<PersonRepositoryImpl>(PersonRepositoryImpl());
}
