import 'dart:async';

import 'package:dartz/dartz.dart';

import '../repositories/new_repository.dart';

class NewUseCase {
  NewUseCase(this._repository);

  final NewRepository _repository;
  Future<Either<String, dynamic>> get(String id) => _repository.get(id);
}
