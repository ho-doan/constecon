import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import '../../../domain/use_case/new_use_case.dart';

part 'new_event.dart';
part 'new_state.dart';
part 'new_bloc.g.dart';

class NewBloc extends Bloc<NewEvent, NewState> {
  NewBloc(this._useCase) : super(NewInitial()) {
    on<NewLoadingEvent>(
      (event, emit) => emit(NewLoading()),
    );
    on<NewFailureEvent>(
      (event, emit) => emit(NewFailure(event.error)),
    );
    on<NewSuccessEvent>(
      (event, emit) => emit(event.state),
    );
    on<NewInitEvent>((event, emit) async {
      try {
        //   final result = await _useCase.getXXX();
        //   final model = result.fold(
        //     (l) => throw Exception(l),
        //     (r) => r,
        //   );
        emit(NewSuccess());
      } catch (e) {
        emit(NewFailure(e.toString()));
      }
    });
  }

  // ignore: unused_field
  final NewUseCase _useCase;
}
