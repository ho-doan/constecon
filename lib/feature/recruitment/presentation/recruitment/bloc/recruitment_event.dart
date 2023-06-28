part of 'recruitment_bloc.dart';

@immutable
abstract class RecruitmentEvent {}

class RecruitmentInitEvent extends RecruitmentEvent {}

class RecruitmentLoadingEvent extends RecruitmentEvent {}

class RecruitmentSuccessEvent extends RecruitmentEvent {
  RecruitmentSuccessEvent(this.state);

  final RecruitmentSuccess state;
}

class RecruitmentFailureEvent extends RecruitmentEvent {
  RecruitmentFailureEvent(this.error);

  final String error;
}
