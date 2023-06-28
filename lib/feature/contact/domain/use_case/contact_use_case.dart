import 'dart:async';

import 'package:dartz/dartz.dart';

import '../repositories/contact_repository.dart';

class ContactUseCase {
  ContactUseCase(this._repository);

  final ContactRepository _repository;
  Future<Either<String, dynamic>> get(String id) => _repository.get(id);
}
