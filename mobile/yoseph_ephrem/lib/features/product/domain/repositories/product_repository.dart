import '../entities/product.dart';

abstract class ProductRepository {
  Future<Product> getProduct(int id);
  Future<Product> createProduct(Product product);
  Future<Product> updateProduct(Product product);
  Future<Product> deleteProduct(int id);
}
