import '../../../../core/local_database/local_database.dart';
import '../models/models.dart';

class AboutUsLocalDataSource extends BaseLocalDatabase<AboutUsModel>
    with LocalDatabase {
  AboutUsLocalDataSource();

  @override
  Future<AboutUsModel> get(String id) async {
    // if (instance == null) throw Exception('db null');
    // return instance!.aboutUsModels.filter().idEqualTo(id).findFirst();
    return AboutUsModel();
  }
}
