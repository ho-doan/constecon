part of 'contact_bloc.dart';

@immutable
abstract class ContactState {}

class ContactInitial extends ContactState {}

class ContactLoading extends ContactState {}

class ContactFailure extends ContactState {
  ContactFailure(this.error);

  final String error;
}

@CopyWith()
class ContactSuccess extends ContactState {
  ContactSuccess({
    this.counter = 0,
  });
  final int counter;
}
