import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_counter_multi_bloc/blocs/Calculate/calculate_bloc.dart';
import 'package:flutter_counter_multi_bloc/blocs/counter/counter_bloc.dart';
import 'package:flutter_counter_multi_bloc/blocs/random/random_bloc.dart';

class Operation extends StatelessWidget {
  int vall1;
  int vall2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('operation page'),
      ),
      body: Container(
        padding: EdgeInsets.all(2),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('State Value'),
                SizedBox(width: 10),
                BlocBuilder<CounterBloc, CounterState>(
                  builder: (context, state) {
                    vall1 = state.counter;
                    return Text('${state.counter}');
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Random'),
                SizedBox(width: 10),
                FloatingActionButton(
                  heroTag: "btn1",
                  child: Text('gen'),
                  onPressed: () => BlocProvider.of<RandomBloc>(context).add(GenerateRandom()),
                ),
                SizedBox(width: 10),
                BlocBuilder<RandomBloc, RandomState>(
                  builder: (context, state) {
                    vall2 = state.random;
                    return Text('${state.random}');
                  },
                )
              ],
            ),
            FloatingActionButton(
              heroTag: "btn2",
              child: Text('sum'),
              onPressed: () => BlocProvider.of<CalculateBloc>(context).add(SumEvent(val1: vall1, val2: vall2)),
            ),
            BlocBuilder<CalculateBloc, CalculateState>(
              builder: (context, state) => Text('${state.sum}'),
            )
          ],
        ),
      ),
    );
  }
}
