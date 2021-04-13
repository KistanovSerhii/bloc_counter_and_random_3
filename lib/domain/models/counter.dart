import 'dart:math';
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter_application_3/domain/bloc/counter/counter_state.dart';
import 'package:flutter_application_3/domain/repositories_contract/counter_repository.dart';
import 'package:flutter_application_3/internal/dependences_init_tools/repository_module.dart';

class CounterModule {
  static final CounterRepository repository =
      RepositoryModule.counterRepository();
}

class Counter extends CounterModule {
  int value;
  Counter({@required this.value});

  CounterState counting() {
    return CounterState(status: CounterStatus.counting, counter: this);
  }

  CounterState increment() {
    this.value++;
    return CounterState(status: CounterStatus.counted, counter: this);
  }

  CounterState decrement() {
    this.value--;
    return CounterState(status: CounterStatus.counted, counter: this);
  }

  Future<CounterState> getRandomFromHttpRequest(int range) async {
    try {
      Counter respond =
          await CounterModule.repository.getRandomCounter(range: range);
      return CounterState(status: CounterStatus.counted, counter: respond);
    } catch (e) {
      return CounterState(status: CounterStatus.error, counter: this);
    }
  }

  Future<CounterState> getRandomNumWithDelay() async {
    this.value = await RandomNumWithDelay.getRandomNumWithDelay();
    return CounterState(status: CounterStatus.counted, counter: this);
  }
}

// test fake computing delay
class RandomNumWithDelay {
  static Future<int> getRandomNumWithDelay() =>
      Future.delayed(Duration(seconds: 1), () {
        var rng = new Random();
        return rng.nextInt(100);
      });
}
