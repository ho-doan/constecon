part of 'about_us_bloc.dart';

@immutable
abstract class AboutUsState {}

class AboutUsInitial extends AboutUsState {}

class AboutUsLoading extends AboutUsState {}

class AboutUsFailure extends AboutUsState {
  AboutUsFailure(this.error);

  final String error;
}

@CopyWith()
class AboutUsSuccess extends AboutUsState {
  AboutUsSuccess({
    this.counter = 0,
  });
  final int counter;
}
