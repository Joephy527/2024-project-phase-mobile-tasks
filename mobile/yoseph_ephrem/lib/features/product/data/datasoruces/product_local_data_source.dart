import 'package:yoseph_ephrem/features/product/data/models/product_model.dart';

abstract class ProductLocalDataSource {
  Future<ProductModel> getProduct();
  Future<void> cacheProduct(ProductModel product);
}
