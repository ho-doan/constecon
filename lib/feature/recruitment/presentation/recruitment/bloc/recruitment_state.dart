part of 'recruitment_bloc.dart';

@immutable
abstract class RecruitmentState {}

class RecruitmentInitial extends RecruitmentState {}

class RecruitmentLoading extends RecruitmentState {}

class RecruitmentFailure extends RecruitmentState {
  RecruitmentFailure(this.error);

  final String error;
}

@CopyWith()
class RecruitmentSuccess extends RecruitmentState {
  RecruitmentSuccess({
    this.counter = 0,
  });
  final int counter;
}
