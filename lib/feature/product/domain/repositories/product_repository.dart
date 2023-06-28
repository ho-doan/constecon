import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../data/local_data_sources/product_local_data_source.dart';
import '../../data/models/models.dart';
import '../../data/remote_data_sources/product_remote_data_source.dart';

@injectable
abstract class ProductRepository {
  @factoryMethod
  static ProductRepositoryImlp create(
    ProductRemoteDataSource remoteDataSource,
    ProductLocalDataSource localDataSource,
  ) =>
      ProductRepositoryImlp(remoteDataSource, localDataSource);

  Future<Either<String, ProductModel>> get(String id);
}

class ProductRepositoryImlp extends ProductRepository {
  ProductRepositoryImlp(
    this._remoteDataSource,
    this._localDataSource,
  );

  // ignore: unused_field
  final ProductLocalDataSource _localDataSource;
  // ignore: unused_field
  final ProductRemoteDataSource _remoteDataSource;

  @override
  Future<Either<String, ProductModel>> get(String id) async {
    try {
      // final resultRemote = await _remoteDataSource.get(id);
      // final resultLocal = await _localDataSource.get(id);
      // final data = resultRemote.data;
      return Right(ProductModel());
    } catch (e) {
      return Left(e.toString());
    }
  }
}
