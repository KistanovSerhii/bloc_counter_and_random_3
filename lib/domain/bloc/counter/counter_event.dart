import 'package:flutter/cupertino.dart';

abstract class CounterEvent {}

class EventIncrement extends CounterEvent {}

class EventDecrement extends CounterEvent {}

class EventRandomFromHttpRequest extends CounterEvent {
  final int range;

  EventRandomFromHttpRequest({@required this.range});
}

class EventRandomNumWithDelay extends CounterEvent {}
