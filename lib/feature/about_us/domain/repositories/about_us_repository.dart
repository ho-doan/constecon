import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../data/local_data_sources/about_us_local_data_source.dart';
import '../../data/models/models.dart';
import '../../data/remote_data_sources/about_us_remote_data_source.dart';

@injectable
abstract class AboutUsRepository {
  @factoryMethod
  static AboutUsRepositoryImlp create(
    AboutUsRemoteDataSource remoteDataSource,
    AboutUsLocalDataSource localDataSource,
  ) =>
      AboutUsRepositoryImlp(remoteDataSource, localDataSource);

  Future<Either<String, AboutUsModel>> get(String id);
}

class AboutUsRepositoryImlp extends AboutUsRepository {
  AboutUsRepositoryImlp(
    this._remoteDataSource,
    this._localDataSource,
  );

  // ignore: unused_field
  final AboutUsLocalDataSource _localDataSource;
  // ignore: unused_field
  final AboutUsRemoteDataSource _remoteDataSource;

  @override
  Future<Either<String, AboutUsModel>> get(String id) async {
    try {
      // final resultRemote = await _remoteDataSource.get(id);
      // final resultLocal = await _localDataSource.get(id);
      // final data = resultRemote.data;
      return Right(AboutUsModel());
    } catch (e) {
      return Left(e.toString());
    }
  }
}
