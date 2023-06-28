import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../data/local_data_sources/esg_local_data_source.dart';
import '../../data/models/models.dart';
import '../../data/remote_data_sources/esg_remote_data_source.dart';

@injectable
abstract class EsgRepository {
  @factoryMethod
  static EsgRepositoryImlp create(
    EsgRemoteDataSource remoteDataSource,
    EsgLocalDataSource localDataSource,
  ) =>
      EsgRepositoryImlp(remoteDataSource, localDataSource);

  Future<Either<String, EsgModel>> get(String id);
}

class EsgRepositoryImlp extends EsgRepository {
  EsgRepositoryImlp(
    this._remoteDataSource,
    this._localDataSource,
  );

  // ignore: unused_field
  final EsgLocalDataSource _localDataSource;
  // ignore: unused_field
  final EsgRemoteDataSource _remoteDataSource;
  @override
  Future<Either<String, EsgModel>> get(String id) async {
    try {
      // final resultRemote = await _remoteDataSource.get(id);
      // final resultLocal = await _localDataSource.get(id);
      // final data = resultRemote.data;
      return Right(EsgModel());
    } catch (e) {
      return Left(e.toString());
    }
  }
}
