part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeFailure extends HomeState {
  HomeFailure(this.error);

  final String error;
}

@CopyWith()
class HomeSuccess extends HomeState {
  HomeSuccess({
    this.counter = 0,
  });
  final int counter;
}
