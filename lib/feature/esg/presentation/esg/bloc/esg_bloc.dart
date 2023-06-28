import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import '../../../domain/use_case/esg_use_case.dart';

part 'esg_event.dart';
part 'esg_state.dart';
part 'esg_bloc.g.dart';

class EsgBloc extends Bloc<EsgEvent, EsgState> {
  EsgBloc(this._useCase) : super(EsgInitial()) {
    on<EsgLoadingEvent>(
      (event, emit) => emit(EsgLoading()),
    );
    on<EsgFailureEvent>(
      (event, emit) => emit(EsgFailure(event.error)),
    );
    on<EsgSuccessEvent>(
      (event, emit) => emit(event.state),
    );
    on<EsgInitEvent>((event, emit) async {
      try {
        //   final result = await _useCase.getXXX();
        //   final model = result.fold(
        //     (l) => throw Exception(l),
        //     (r) => r,
        //   );
        emit(EsgSuccess());
      } catch (e) {
        emit(EsgFailure(e.toString()));
      }
    });
  }

  // ignore: unused_field
  final EsgUseCase _useCase;
}
