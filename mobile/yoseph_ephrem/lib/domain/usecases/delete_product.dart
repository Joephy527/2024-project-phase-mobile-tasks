import 'package:yoseph_ephrem/domain/repositories/product_repository.dart';

import '../../core/usecases.dart';
import '../entities/product.dart';

class DeleteProductUsecase implements UseCase<Product, Params> {
  final ProductRepository repository;

  DeleteProductUsecase(this.repository);

  @override
  Future<Product> call(Params params) async {
    return await repository.deleteProduct(params.id);
  }
}

class Params {
  final int id;

  Params({required this.id});
}
