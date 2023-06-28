part of 'contact_bloc.dart';

@immutable
abstract class ContactEvent {}

class ContactInitEvent extends ContactEvent {}

class ContactLoadingEvent extends ContactEvent {}

class ContactSuccessEvent extends ContactEvent {
  ContactSuccessEvent(this.state);

  final ContactSuccess state;
}

class ContactFailureEvent extends ContactEvent {
  ContactFailureEvent(this.error);

  final String error;
}
