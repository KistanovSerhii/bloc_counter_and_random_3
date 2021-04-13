import 'package:flutter_application_3/domain/bloc/counter/counter_state.dart';
import 'package:flutter_application_3/domain/models/counter.dart';

class StateModule {
  static CounterState counterState() =>
      CounterState(status: CounterStatus.init, counter: Counter(value: 0));
}
