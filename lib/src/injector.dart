import 'package:get_it/get_it.dart';
import 'package:todoappflutter/src/domain/entities/PersonsModel.dart';

final injector = GetIt.instance;

void setUp() {
  injector.registerSingleton<PersonModel>(PersonModel.empty());
}
