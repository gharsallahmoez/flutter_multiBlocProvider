import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_counter_multi_bloc/blocs/counter/counter_bloc.dart';
import 'package:flutter_counter_multi_bloc/screens/operation.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home page'),
        actions: [
          FloatingActionButton(
            child: Icon(Icons.navigate_next),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Operation(),
              ),
            ),
          )
        ],
      ),
      body: Center(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              BlocProvider.of<CounterBloc>(context).add(Increment());
            },
          ),
          BlocBuilder<CounterBloc, CounterState>(
            builder: (context, state) {
              return Text('${state.counter}');
            },
          ),
          IconButton(
            icon: Icon(Icons.remove),
            onPressed: () {
              BlocProvider.of<CounterBloc>(context).add(Decrement());
            },
          )
        ],
      )),
    );
  }
}
