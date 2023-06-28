part of 'new_bloc.dart';

@immutable
abstract class NewState {}

class NewInitial extends NewState {}

class NewLoading extends NewState {}

class NewFailure extends NewState {
  NewFailure(this.error);

  final String error;
}

@CopyWith()
class NewSuccess extends NewState {
  NewSuccess({
    this.counter = 0,
  });
  final int counter;
}
