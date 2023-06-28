import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import '../../../domain/use_case/product_use_case.dart';

part 'product_event.dart';
part 'product_state.dart';
part 'product_bloc.g.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc(this._useCase) : super(ProductInitial()) {
    on<ProductLoadingEvent>(
      (event, emit) => emit(ProductLoading()),
    );
    on<ProductFailureEvent>(
      (event, emit) => emit(ProductFailure(event.error)),
    );
    on<ProductSuccessEvent>(
      (event, emit) => emit(event.state),
    );
    on<ProductInitEvent>((event, emit) async {
      try {
        //   final result = await _useCase.getXXX();
        //   final model = result.fold(
        //     (l) => throw Exception(l),
        //     (r) => r,
        //   );
        emit(ProductSuccess());
      } catch (e) {
        emit(ProductFailure(e.toString()));
      }
    });
  }

  // ignore: unused_field
  final ProductUseCase _useCase;
}
