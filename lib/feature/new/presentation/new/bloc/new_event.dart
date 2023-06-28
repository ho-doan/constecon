part of 'new_bloc.dart';

@immutable
abstract class NewEvent {}

class NewInitEvent extends NewEvent {}

class NewLoadingEvent extends NewEvent {}

class NewSuccessEvent extends NewEvent {
  NewSuccessEvent(this.state);

  final NewSuccess state;
}

class NewFailureEvent extends NewEvent {
  NewFailureEvent(this.error);

  final String error;
}
