import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'calculate_event.dart';

part 'calculate_state.dart';

class CalculateBloc extends Bloc<CalculateEvent, CalculateState> {
  CalculateBloc() : super(CalculateState());

  @override
  Stream<CalculateState> mapEventToState(
    CalculateEvent event,
  ) async* {
    if (event is SumEvent) {
      yield CalculateState(sum: event.val1 + event.val2);
    }
  }
}
