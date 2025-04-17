import '../../../../core/usecases.dart';
import '../repositories/product_repository.dart';
import '../entities/product.dart';

class InsertProduct implements UseCase<Product, Params> {
  final ProductRepository repository;

  InsertProduct(this.repository);

  @override
  Future<Product> call(Params params) async {
    return await repository.createProduct(
      Product(
        id: params.id,
        name: params.name,
        description: params.description,
        imageUrl: params.imageUrl,
        price: params.price,
      ),
    );
  }
}

class Params {
  final int id;
  final String name;
  final String description;
  final String imageUrl;
  final int price;

  Params({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.price,
  });
}
