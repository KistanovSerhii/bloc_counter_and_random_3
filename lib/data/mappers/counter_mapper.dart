import 'package:flutter_application_3/data/api/respond/filter_random_counter.dart';
import 'package:flutter_application_3/domain/models/counter.dart';

class CounterMapper {
  static Counter fromApi(FilterRandomCounter counter) {
    return Counter(value: counter.randomNum.toInt());
  }
}
