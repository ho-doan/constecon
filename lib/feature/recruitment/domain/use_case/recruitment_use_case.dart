import 'dart:async';

import 'package:dartz/dartz.dart';

import '../repositories/recruitment_repository.dart';

class RecruitmentUseCase {
  RecruitmentUseCase(this._repository);

  final RecruitmentRepository _repository;
  Future<Either<String, dynamic>> get(String id) => _repository.get(id);
}
