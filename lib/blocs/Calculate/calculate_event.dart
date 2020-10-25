part of 'calculate_bloc.dart';

@immutable
abstract class CalculateEvent {}

class SumEvent extends CalculateEvent {
  int val1;
  int val2;

  SumEvent({this.val1, this.val2});
}
