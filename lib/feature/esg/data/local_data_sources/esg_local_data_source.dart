import '../../../../core/local_database/local_database.dart';
import '../models/models.dart';

class EsgLocalDataSource extends BaseLocalDatabase<EsgModel>
    with LocalDatabase {
  EsgLocalDataSource();

  @override
  Future<EsgModel> get(String id) async {
    // if (instance == null) throw Exception('db null');
    // return instance!.esgModels.filter().idEqualTo(id).findFirst();
    return EsgModel();
  }
}
