part of 'esg_bloc.dart';

@immutable
abstract class EsgEvent {}

class EsgInitEvent extends EsgEvent {}

class EsgLoadingEvent extends EsgEvent {}

class EsgSuccessEvent extends EsgEvent {
  EsgSuccessEvent(this.state);

  final EsgSuccess state;
}

class EsgFailureEvent extends EsgEvent {
  EsgFailureEvent(this.error);

  final String error;
}
