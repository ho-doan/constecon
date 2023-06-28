import '../../../../core/local_database/local_database.dart';
import '../models/models.dart';

class RecruitmentLocalDataSource extends BaseLocalDatabase<RecruitmentModel>
    with LocalDatabase {
  RecruitmentLocalDataSource();

  @override
  Future<RecruitmentModel> get(String id) async {
    // if (instance == null) throw Exception('db null');
    // return instance!.recruitmentModels.filter().idEqualTo(id).findFirst();
    return RecruitmentModel();
  }
}
