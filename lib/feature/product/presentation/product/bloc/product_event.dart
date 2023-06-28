part of 'product_bloc.dart';

@immutable
abstract class ProductEvent {}

class ProductInitEvent extends ProductEvent {}

class ProductLoadingEvent extends ProductEvent {}

class ProductSuccessEvent extends ProductEvent {
  ProductSuccessEvent(this.state);

  final ProductSuccess state;
}

class ProductFailureEvent extends ProductEvent {
  ProductFailureEvent(this.error);

  final String error;
}
