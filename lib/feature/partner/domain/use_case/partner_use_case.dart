import 'dart:async';

import 'package:dartz/dartz.dart';

import '../repositories/partner_repository.dart';

class PartnerUseCase {
  PartnerUseCase(this._repository);

  final PartnerRepository _repository;
  Future<Either<String, dynamic>> get(String id) => _repository.get(id);
}
