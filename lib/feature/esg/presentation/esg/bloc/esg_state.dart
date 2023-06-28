part of 'esg_bloc.dart';

@immutable
abstract class EsgState {}

class EsgInitial extends EsgState {}

class EsgLoading extends EsgState {}

class EsgFailure extends EsgState {
  EsgFailure(this.error);

  final String error;
}

@CopyWith()
class EsgSuccess extends EsgState {
  EsgSuccess({
    this.counter = 0,
  });
  final int counter;
}
