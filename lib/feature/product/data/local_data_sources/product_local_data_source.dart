import '../../../../core/local_database/local_database.dart';
import '../models/models.dart';

class ProductLocalDataSource extends BaseLocalDatabase<ProductModel>
    with LocalDatabase {
  ProductLocalDataSource();

  @override
  Future<ProductModel> get(String id) async {
    // if (instance == null) throw Exception('db null');
    // return instance!.productModels.filter().idEqualTo(id).findFirst();
    return ProductModel();
  }
}
