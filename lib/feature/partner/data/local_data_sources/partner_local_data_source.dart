import '../../../../core/local_database/local_database.dart';
import '../models/models.dart';

class PartnerLocalDataSource extends BaseLocalDatabase<PartnerModel>
    with LocalDatabase {
  PartnerLocalDataSource();

  @override
  Future<PartnerModel> get(String id) async {
    // if (instance == null) throw Exception('db null');
    // return instance!.partnerModels.filter().idEqualTo(id).findFirst();
    return PartnerModel();
  }
}
