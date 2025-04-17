import '../../../../core/usecases.dart';
import '../repositories/product_repository.dart';
import '../entities/product.dart';

class GetProduct implements UseCase<Product, Params> {
  final ProductRepository repository;

  GetProduct(this.repository);

  @override
  Future<Product> call(Params params) async {
    return await repository.getProduct(params.id);
  }
}

class Params {
  final int id;

  Params({required this.id});
}
