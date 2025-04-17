import '../../../../core/usecases.dart';
import '../repositories/product_repository.dart';
import '../entities/product.dart';

class DeleteProduct implements UseCase<Product, Params> {
  final ProductRepository repository;

  DeleteProduct(this.repository);

  @override
  Future<Product> call(Params params) async {
    return await repository.deleteProduct(params.id);
  }
}

class Params {
  final int id;

  Params({required this.id});
}
