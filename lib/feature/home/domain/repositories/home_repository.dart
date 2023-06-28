import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../data/local_data_sources/home_local_data_source.dart';
import '../../data/models/models.dart';
import '../../data/remote_data_sources/home_remote_data_source.dart';

@injectable
abstract class HomeRepository {
  @factoryMethod
  static HomeRepositoryImlp create(
    HomeRemoteDataSource remoteDataSource,
    HomeLocalDataSource localDataSource,
  ) =>
      HomeRepositoryImlp(remoteDataSource, localDataSource);

  Future<Either<String, HomeModel>> get(String id);
}

class HomeRepositoryImlp extends HomeRepository {
  HomeRepositoryImlp(
    this._remoteDataSource,
    this._localDataSource,
  );

  // ignore: unused_field
  final HomeLocalDataSource _localDataSource;
  // ignore: unused_field
  final HomeRemoteDataSource _remoteDataSource;
  @override
  Future<Either<String, HomeModel>> get(String id) async {
    try {
      // final resultRemote = await _remoteDataSource.get(id);
      // final resultLocal = await _localDataSource.get(id);
      // final data = resultRemote.data;
      return Right(HomeModel());
    } catch (e) {
      return Left(e.toString());
    }
  }
}
