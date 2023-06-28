import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../data/local_data_sources/new_local_data_source.dart';
import '../../data/models/models.dart';
import '../../data/remote_data_sources/new_remote_data_source.dart';

@injectable
abstract class NewRepository {
  @factoryMethod
  static NewRepositoryImlp create(
    NewRemoteDataSource remoteDataSource,
    NewLocalDataSource localDataSource,
  ) =>
      NewRepositoryImlp(remoteDataSource, localDataSource);

  Future<Either<String, NewModel>> get(String id);
}

class NewRepositoryImlp extends NewRepository {
  NewRepositoryImlp(
    this._remoteDataSource,
    this._localDataSource,
  );

  // ignore: unused_field
  final NewLocalDataSource _localDataSource;
  // ignore: unused_field
  final NewRemoteDataSource _remoteDataSource;
  @override
  Future<Either<String, NewModel>> get(String id) async {
    try {
      // final resultRemote = await _remoteDataSource.get(id);
      // final resultLocal = await _localDataSource.get(id);
      // final data = resultRemote.data;
      return Right(NewModel());
    } catch (e) {
      return Left(e.toString());
    }
  }
}
