import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import '../../../domain/use_case/about_us_use_case.dart';

part 'about_us_event.dart';
part 'about_us_state.dart';
part 'about_us_bloc.g.dart';

class AboutUsBloc extends Bloc<AboutUsEvent, AboutUsState> {
  AboutUsBloc(this._useCase) : super(AboutUsInitial()) {
    on<AboutUsLoadingEvent>(
      (event, emit) => emit(AboutUsLoading()),
    );
    on<AboutUsFailureEvent>(
      (event, emit) => emit(AboutUsFailure(event.error)),
    );
    on<AboutUsSuccessEvent>(
      (event, emit) => emit(event.state),
    );
    on<AboutUsInitEvent>((event, emit) async {
      try {
        //   final result = await _useCase.getXXX();
        //   final model = result.fold(
        //     (l) => throw Exception(l),
        //     (r) => r,
        //   );
        emit(AboutUsSuccess());
      } catch (e) {
        emit(AboutUsFailure(e.toString()));
      }
    });
  }

  // ignore: unused_field
  final AboutUsUseCase _useCase;
}
