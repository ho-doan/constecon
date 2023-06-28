import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../data/local_data_sources/partner_local_data_source.dart';
import '../../data/models/models.dart';
import '../../data/remote_data_sources/partner_remote_data_source.dart';

@injectable
abstract class PartnerRepository {
  @factoryMethod
  static PartnerRepositoryImlp create(
    PartnerRemoteDataSource remoteDataSource,
    PartnerLocalDataSource localDataSource,
  ) =>
      PartnerRepositoryImlp(remoteDataSource, localDataSource);

  Future<Either<String, PartnerModel>> get(String id);
}

class PartnerRepositoryImlp extends PartnerRepository {
  PartnerRepositoryImlp(
    this._remoteDataSource,
    this._localDataSource,
  );

  // ignore: unused_field
  final PartnerLocalDataSource _localDataSource;
  // ignore: unused_field
  final PartnerRemoteDataSource _remoteDataSource;
  @override
  Future<Either<String, PartnerModel>> get(String id) async {
    try {
      // final resultRemote = await _remoteDataSource.get(id);
      // final resultLocal = await _localDataSource.get(id);
      // final data = resultRemote.data;
      return Right(PartnerModel());
    } catch (e) {
      return Left(e.toString());
    }
  }
}
