//part of 'package:flutter_application_3/common_path/counter.dart';
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_application_3/domain/models/counter.dart';

enum CounterStatus { init, counting, counted, error }

@immutable
class CounterState extends Equatable {
  final CounterStatus status;
  final Counter counter;

  CounterState({@required this.status, @required this.counter});

  @override
  List<Object> get props => [status, counter.value];

  Stream<CounterState> increment() async* {
    yield counter.counting();
    yield counter.increment();
  }

  Stream<CounterState> decrement() async* {
    yield counter.counting();
    yield counter.decrement();
  }

  Stream<CounterState> getRandomFromHttpRequest(int range) async* {
    yield counter.counting();
    yield await counter.getRandomFromHttpRequest(range);
  }

  Stream<CounterState> getRandomFromCloudy() async* {
    yield counter.counting();
    yield await counter.getRandomNumWithDelay();
  }
}
