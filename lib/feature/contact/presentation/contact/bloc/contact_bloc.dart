import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import '../../../domain/use_case/contact_use_case.dart';

part 'contact_event.dart';
part 'contact_state.dart';
part 'contact_bloc.g.dart';

class ContactBloc extends Bloc<ContactEvent, ContactState> {
  ContactBloc(this._useCase) : super(ContactInitial()) {
    on<ContactLoadingEvent>(
      (event, emit) => emit(ContactLoading()),
    );
    on<ContactFailureEvent>(
      (event, emit) => emit(ContactFailure(event.error)),
    );
    on<ContactSuccessEvent>(
      (event, emit) => emit(event.state),
    );
    on<ContactInitEvent>((event, emit) async {
      try {
        //   final result = await _useCase.getXXX();
        //   final model = result.fold(
        //     (l) => throw Exception(l),
        //     (r) => r,
        //   );
        emit(ContactSuccess());
      } catch (e) {
        emit(ContactFailure(e.toString()));
      }
    });
  }

  // ignore: unused_field
  final ContactUseCase _useCase;
}
