import 'dart:async';

import 'package:dartz/dartz.dart';

import '../repositories/product_repository.dart';

class ProductUseCase {
  ProductUseCase(this._repository);

  final ProductRepository _repository;
  Future<Either<String, dynamic>> get(String id) => _repository.get(id);
}
