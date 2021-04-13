import 'package:flutter_application_3/domain/repositories_contract/counter_repository.dart';
import 'package:flutter_application_3/data/repositories/counter_data_repository.dart';
import 'package:flutter_application_3/internal/dependences_init_tools/api_module.dart';

class RepositoryModule {
  static CounterRepository counterRepository() =>
      CounterDataRepository(apiUtil: ApiModule.counterApiUtil());
}
