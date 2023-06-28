part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class HomeInitEvent extends HomeEvent {}

class HomeLoadingEvent extends HomeEvent {}

class HomeSuccessEvent extends HomeEvent {
  HomeSuccessEvent(this.state);

  final HomeSuccess state;
}

class HomeFailureEvent extends HomeEvent {
  HomeFailureEvent(this.error);

  final String error;
}
