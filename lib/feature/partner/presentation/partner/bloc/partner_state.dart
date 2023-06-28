part of 'partner_bloc.dart';

@immutable
abstract class PartnerState {}

class PartnerInitial extends PartnerState {}

class PartnerLoading extends PartnerState {}

class PartnerFailure extends PartnerState {
  PartnerFailure(this.error);

  final String error;
}

@CopyWith()
class PartnerSuccess extends PartnerState {
  PartnerSuccess({
    this.counter = 0,
  });
  final int counter;
}
