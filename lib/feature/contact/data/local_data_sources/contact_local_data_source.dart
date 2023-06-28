import '../../../../core/local_database/local_database.dart';
import '../models/models.dart';

class ContactLocalDataSource extends BaseLocalDatabase<ContactModel>
    with LocalDatabase {
  ContactLocalDataSource();

  @override
  Future<ContactModel> get(String id) async {
    // if (instance == null) throw Exception('db null');
    // return instance!.contactModels.filter().idEqualTo(id).findFirst();
    return ContactModel();
  }
}
