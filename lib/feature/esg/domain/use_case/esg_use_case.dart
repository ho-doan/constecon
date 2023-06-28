import 'dart:async';

import 'package:dartz/dartz.dart';

import '../repositories/esg_repository.dart';

class EsgUseCase {
  EsgUseCase(this._repository);

  final EsgRepository _repository;
  Future<Either<String, dynamic>> get(String id) => _repository.get(id);
}
