import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_3/internal/dependences_init_tools/state_module.dart';
import 'package:flutter_application_3/domain/bloc/counter/counter_state.dart';
import 'package:flutter_application_3/domain/bloc/counter/counter_event.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc()
      // ВАЖНО задать первоначальное состояние
      : super(StateModule.counterState());
  @override
  Stream<CounterState> mapEventToState(CounterEvent event) async* {
    switch (event.runtimeType) {
      case EventIncrement:
        yield* state.increment();
        break;
      case EventDecrement:
        yield* state.decrement();
        break;
      case EventRandomNumWithDelay:
        yield* state.getRandomFromCloudy();
        break;
      case EventRandomFromHttpRequest:
        yield* state.getRandomFromHttpRequest(1 /*event.range*/);
        break;
      default:
    }
  }
}
