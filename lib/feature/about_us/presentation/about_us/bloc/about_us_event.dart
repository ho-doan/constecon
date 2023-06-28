part of 'about_us_bloc.dart';

@immutable
abstract class AboutUsEvent {}

class AboutUsInitEvent extends AboutUsEvent {}

class AboutUsLoadingEvent extends AboutUsEvent {}

class AboutUsSuccessEvent extends AboutUsEvent {
  AboutUsSuccessEvent(this.state);

  final AboutUsSuccess state;
}

class AboutUsFailureEvent extends AboutUsEvent {
  AboutUsFailureEvent(this.error);

  final String error;
}
