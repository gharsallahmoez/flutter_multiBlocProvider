import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'random_event.dart';

part 'random_state.dart';

class RandomBloc extends Bloc<RandomEvent, RandomState> {
  RandomBloc() : super(RandomState(0));

  @override
  Stream<RandomState> mapEventToState(
    RandomEvent event,
  ) async* {
    if (event is GenerateRandom) {
      var rng = new Random();
      int random = rng.nextInt(20);

      yield RandomState(random);
    }
  }
}
