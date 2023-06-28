import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import '../../../domain/use_case/partner_use_case.dart';

part 'partner_event.dart';
part 'partner_state.dart';
part 'partner_bloc.g.dart';

class PartnerBloc extends Bloc<PartnerEvent, PartnerState> {
  PartnerBloc(this._useCase) : super(PartnerInitial()) {
    on<PartnerLoadingEvent>(
      (event, emit) => emit(PartnerLoading()),
    );
    on<PartnerFailureEvent>(
      (event, emit) => emit(PartnerFailure(event.error)),
    );
    on<PartnerSuccessEvent>(
      (event, emit) => emit(event.state),
    );
    on<PartnerInitEvent>((event, emit) async {
      try {
        //   final result = await _useCase.getXXX();
        //   final model = result.fold(
        //     (l) => throw Exception(l),
        //     (r) => r,
        //   );
        emit(PartnerSuccess());
      } catch (e) {
        emit(PartnerFailure(e.toString()));
      }
    });
  }

  // ignore: unused_field
  final PartnerUseCase _useCase;
}
