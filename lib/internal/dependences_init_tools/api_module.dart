import 'package:flutter_application_3/data/api/api_util.dart';
import 'package:flutter_application_3/data/api/services/spaceweb_service.dart';

class ApiModule {
  static CounterApiUtil counterApiUtil() => CounterApiUtil(SpacewebService());
}
