import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../data/local_data_sources/contact_local_data_source.dart';
import '../../data/models/models.dart';
import '../../data/remote_data_sources/contact_remote_data_source.dart';

@injectable
abstract class ContactRepository {
  @factoryMethod
  static ContactRepositoryImlp create(
    ContactRemoteDataSource remoteDataSource,
    ContactLocalDataSource localDataSource,
  ) =>
      ContactRepositoryImlp(remoteDataSource, localDataSource);

  Future<Either<String, ContactModel>> get(String id);
}

class ContactRepositoryImlp extends ContactRepository {
  ContactRepositoryImlp(
    this._remoteDataSource,
    this._localDataSource,
  );

  // ignore: unused_field
  final ContactLocalDataSource _localDataSource;
  // ignore: unused_field
  final ContactRemoteDataSource _remoteDataSource;
  @override
  Future<Either<String, ContactModel>> get(String id) async {
    try {
      // final resultRemote = await _remoteDataSource.get(id);
      // final resultLocal = await _localDataSource.get(id);
      // final data = resultRemote.data;
      return Right(ContactModel());
    } catch (e) {
      return Left(e.toString());
    }
  }
}
