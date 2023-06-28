import '../../../../core/local_database/local_database.dart';
import '../models/models.dart';

class NewLocalDataSource extends BaseLocalDatabase<NewModel>
    with LocalDatabase {
  NewLocalDataSource();

  @override
  Future<NewModel> get(String id) async {
    // if (instance == null) throw Exception('db null');
    // return instance!.newModels.filter().idEqualTo(id).findFirst();
    return NewModel();
  }
}
