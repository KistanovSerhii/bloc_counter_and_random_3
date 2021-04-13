import 'package:flutter/cupertino.dart';
import 'package:flutter_application_3/domain/models/counter.dart';

abstract class CounterRepository {
  Future<Counter> getRandomCounter({@required int range});
}
