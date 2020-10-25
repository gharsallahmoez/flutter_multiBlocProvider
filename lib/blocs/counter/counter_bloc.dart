import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';

part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState(0));

  @override
  Stream<CounterState> mapEventToState(
    CounterEvent event,
  ) async* {
    if (event is Increment) {
      yield _incrementCounter();
    } else if (event is Decrement) {
      yield _decrementCounter();
    }
  }

  CounterState _incrementCounter() {
    int newVal = state.counter + 1;
    return CounterState(newVal);
  }

  CounterState _decrementCounter() {
    int newVal = state.counter - 1;
    return CounterState(newVal);
  }
}
