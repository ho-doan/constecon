import 'package:dartz/dartz.dart';
import '../models/models.dart';

class PartnerRemoteDataSource {
  PartnerRemoteDataSource(/*this._apiClient*/);
  // final ApiClient _apiClient;

  Future<Either<String, PartnerModel>> get(String id) async {
    try {
      // final result = await _apiClient.get(id);
      // if (result.response.statusCode == 200) {
      //   final resultLocal = await _localDataSource.get(id);
      //   final data = resultRemote.data;
      //   return Right(data);
      // }
      // return Left('${result.response.statusCode}:${result.response.statusMessage}');
      return Right(PartnerModel());
    } catch (e) {
      return Left(e.toString());
    }
  }
}
