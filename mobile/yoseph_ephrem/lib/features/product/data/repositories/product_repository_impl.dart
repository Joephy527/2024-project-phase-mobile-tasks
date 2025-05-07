import '../../../../core/platform/network_info.dart';
import '../../../../data.dart';
import '../datasoruces/product_local_data_source.dart';
import '../datasoruces/product_remote_data_source.dart';
import '../../domain/entities/product.dart';
import '../../domain/repositories/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDataSource remoteDataSource;
  final ProductLocalDataSource localDataSource;
  final NetworkInfo networkInfo;
  final products = ProductData().data;

  ProductRepositoryImpl({ required this.remoteDataSource, required this.localDataSource, required this.networkInfo })


  @override
  Future<Product> createProduct(Product product) async {
    products.add(product);

    final wasAdded = products.contains(product);

    if (!wasAdded) {
      throw Exception("Failed to add the product.");
    }

    return product;
  }

  @override
  Future<Product> deleteProduct(int id) async {
    try {
      final product = await getProduct(id);

      ProductData().deleteItem(product);

      final wasAdded = products.contains(product);

      if (wasAdded) {
        throw Exception("Failed to delete the product.");
      }

      return product;
    } catch (e) {
      throw Exception("Failed to delete the product.");
    }
  }

  @override
  Future<Product> getProduct(int id) async {
    try {
      final product = products.firstWhere((item) => item.id == id);

      return product;
    } catch (e) {
      throw Exception("Failed to get product.");
    }
  }

  @override
  Future<Product> updateProduct(Product product) async {
    final index = products.indexWhere((item) => item.id == product.id);

    if (index != -1) {
      products[index] = product;
      return product;
    }

    throw Exception("Failed to update product.");
  }
}
