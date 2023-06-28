part of 'product_bloc.dart';

@immutable
abstract class ProductState {}

class ProductInitial extends ProductState {}

class ProductLoading extends ProductState {}

class ProductFailure extends ProductState {
  ProductFailure(this.error);

  final String error;
}

@CopyWith()
class ProductSuccess extends ProductState {
  ProductSuccess({
    this.counter = 0,
  });
  final int counter;
}
