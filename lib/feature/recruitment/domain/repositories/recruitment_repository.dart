import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../data/local_data_sources/recruitment_local_data_source.dart';
import '../../data/models/models.dart';
import '../../data/remote_data_sources/recruitment_remote_data_source.dart';

@injectable
abstract class RecruitmentRepository {
  @factoryMethod
  static RecruitmentRepositoryImlp create(
    RecruitmentRemoteDataSource remoteDataSource,
    RecruitmentLocalDataSource localDataSource,
  ) =>
      RecruitmentRepositoryImlp(remoteDataSource, localDataSource);

  Future<Either<String, RecruitmentModel>> get(String id);
}

class RecruitmentRepositoryImlp extends RecruitmentRepository {
  RecruitmentRepositoryImlp(
    this._remoteDataSource,
    this._localDataSource,
  );

  // ignore: unused_field
  final RecruitmentLocalDataSource _localDataSource;
  // ignore: unused_field
  final RecruitmentRemoteDataSource _remoteDataSource;
  @override
  Future<Either<String, RecruitmentModel>> get(String id) async {
    try {
      // final resultRemote = await _remoteDataSource.get(id);
      // final resultLocal = await _localDataSource.get(id);
      // final data = resultRemote.data;
      return Right(RecruitmentModel());
    } catch (e) {
      return Left(e.toString());
    }
  }
}
