import 'dart:async';

import 'package:dartz/dartz.dart';

import '../repositories/home_repository.dart';

class HomeUseCase {
  HomeUseCase(this._repository);

  final HomeRepository _repository;
  Future<Either<String, dynamic>> get(String id) => _repository.get(id);
}
