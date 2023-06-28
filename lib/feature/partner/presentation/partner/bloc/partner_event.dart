part of 'partner_bloc.dart';

@immutable
abstract class PartnerEvent {}

class PartnerInitEvent extends PartnerEvent {}

class PartnerLoadingEvent extends PartnerEvent {}

class PartnerSuccessEvent extends PartnerEvent {
  PartnerSuccessEvent(this.state);

  final PartnerSuccess state;
}

class PartnerFailureEvent extends PartnerEvent {
  PartnerFailureEvent(this.error);

  final String error;
}
