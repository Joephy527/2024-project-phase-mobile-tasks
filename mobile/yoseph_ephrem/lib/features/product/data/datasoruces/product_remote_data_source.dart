import 'package:yoseph_ephrem/features/product/data/models/product_model.dart';

abstract class ProductRemoteDataSource {
  Future<ProductModel> getProduct(int id);
}
