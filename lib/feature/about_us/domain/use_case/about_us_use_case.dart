import 'dart:async';

import 'package:dartz/dartz.dart';

import '../repositories/about_us_repository.dart';

class AboutUsUseCase {
  AboutUsUseCase(this._repository);

  final AboutUsRepository _repository;
  Future<Either<String, dynamic>> get(String id) => _repository.get(id);
}
