import 'package:flutter/cupertino.dart';
import 'package:flutter_application_3/domain/repositories_contract/counter_repository.dart';
import 'package:flutter_application_3/data/api/api_util.dart';
import 'package:flutter_application_3/domain/models/counter.dart';

class CounterDataRepository extends CounterRepository {
  final CounterApiUtil apiUtil;

  CounterDataRepository({@required this.apiUtil});

  @override
  Future<Counter> getRandomCounter({@required int range}) {
    return apiUtil.getRandomCounter(range: range);
  }
}
