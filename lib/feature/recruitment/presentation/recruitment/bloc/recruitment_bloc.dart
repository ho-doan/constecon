import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import '../../../domain/use_case/recruitment_use_case.dart';

part 'recruitment_event.dart';
part 'recruitment_state.dart';
part 'recruitment_bloc.g.dart';

class RecruitmentBloc extends Bloc<RecruitmentEvent, RecruitmentState> {
  RecruitmentBloc(this._useCase) : super(RecruitmentInitial()) {
    on<RecruitmentLoadingEvent>(
      (event, emit) => emit(RecruitmentLoading()),
    );
    on<RecruitmentFailureEvent>(
      (event, emit) => emit(RecruitmentFailure(event.error)),
    );
    on<RecruitmentSuccessEvent>(
      (event, emit) => emit(event.state),
    );
    on<RecruitmentInitEvent>((event, emit) async {
      try {
        //   final result = await _useCase.getXXX();
        //   final model = result.fold(
        //     (l) => throw Exception(l),
        //     (r) => r,
        //   );
        emit(RecruitmentSuccess());
      } catch (e) {
        emit(RecruitmentFailure(e.toString()));
      }
    });
  }

  // ignore: unused_field
  final RecruitmentUseCase _useCase;
}
