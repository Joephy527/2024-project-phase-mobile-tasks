import '../entities/product.dart';
import '../repositories/product_repository.dart';
import '../../core/usecases.dart';

class ViewAllProductsUsecase implements UseCase<List<Product>, NoParams> {
  final ProductRepository repository;

  ViewAllProductsUsecase(this.repository);

  @override
  Future<List<Product>> call(NoParams params) async {
    return await repository.getAllProducts();
  }
}
