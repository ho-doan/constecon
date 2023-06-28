import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import '../../../domain/use_case/home_use_case.dart';

part 'home_event.dart';
part 'home_state.dart';
part 'home_bloc.g.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(this._useCase) : super(HomeInitial()) {
    on<HomeLoadingEvent>(
      (event, emit) => emit(HomeLoading()),
    );
    on<HomeFailureEvent>(
      (event, emit) => emit(HomeFailure(event.error)),
    );
    on<HomeSuccessEvent>(
      (event, emit) => emit(event.state),
    );
    on<HomeInitEvent>((event, emit) async {
      try {
        //   final result = await _useCase.getXXX();
        //   final model = result.fold(
        //     (l) => throw Exception(l),
        //     (r) => r,
        //   );
        emit(HomeSuccess());
      } catch (e) {
        emit(HomeFailure(e.toString()));
      }
    });
  }

  // ignore: unused_field
  final HomeUseCase _useCase;
}
