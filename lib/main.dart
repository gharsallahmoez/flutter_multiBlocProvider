import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_counter_multi_bloc/blocs/Calculate/calculate_bloc.dart';
import 'package:flutter_counter_multi_bloc/blocs/counter/counter_bloc.dart';
import 'package:flutter_counter_multi_bloc/blocs/random/random_bloc.dart';
import 'package:flutter_counter_multi_bloc/screens/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CounterBloc>(
          create: (context) => CounterBloc(),
        ),
        BlocProvider<RandomBloc>(
          create: (context) => RandomBloc(),
        ),
        BlocProvider<CalculateBloc>(
          create: (context) => CalculateBloc(),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Home(),
      ),
    );
  }
}
